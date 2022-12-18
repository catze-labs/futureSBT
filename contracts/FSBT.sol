// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./interfaces/IERC721.sol";
import "./interfaces/IFSBT721.sol";
import "./interfaces/IFERC721Metadata.sol";
import "./utils/Context.sol";
import "./utils/Counters.sol";
import "./utils/EnumerableMap.sol";
import "./utils/Strings.sol";
import "./utils/Initializable.sol";

import "./erc/ERC165.sol";
import "./access/AccessControl.sol";

/**
 * Designed by R3plica and Developed by Catze Labs
 * Inspired by the Soul Bound Token (SBT) whitepaper by Vitalik Buterin and Binance Account Bound Token (BABT)
 * An experiment in Soul Bound Tokens (SBT's) following Vitalik's
 * co-authored whitepaper at:
 * https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4105763
 *
 * I propose for a rename to Future SBT (FSBT)
 */
contract FSBT is Initializable, AccessControl, IFSBT721, IFERC721Metadata {
    using Strings for uint256;
    using Counters for Counters.Counter;
    using EnumerableMap for EnumerableMap.AddressToUintMap;
    using EnumerableMap for EnumerableMap.UintToAddressMap;
    using EnumerableMap for EnumerableMap.UintToUintMap;

    // Mapping from token ID to owner address
    EnumerableMap.UintToAddressMap private _ownerMap;
    EnumerableMap.AddressToUintMap private _tokenMap;
    EnumerableMap.UintToUintMap private _countMap;

    // Token Id
    Counters.Counter private _tokenId;

    // Token name
    string public name;

    // Token symbol
    string public symbol;

    // Token URI
    string private _baseTokenURI;

    // Operator
    bytes32 public constant OPERATOR_ROLE = keccak256("OPERATOR_ROLE");

    /**
     * @dev Initializes the contract by setting a `name` and a `symbol` to the token collection.
     */
    function initialize(
        string memory name_,
        string memory symbol_,
        address admin_
    ) public reinitializer(1) {
        name = name_;
        symbol = symbol_;

        // grant DEFAULT_ADMIN_ROLE to contract creator
        _grantRole(DEFAULT_ADMIN_ROLE, admin_);
        _grantRole(OPERATOR_ROLE, admin_);
    }

    function attest(address to, uint count_) external returns (uint256) {
        require(
            hasRole(OPERATOR_ROLE, _msgSender()),
            "Only the account with OPERATOR_ROLE can attest the SBT"
        );
        require(to != address(0), "Address is empty");
        require(!_tokenMap.contains(to), "SBT already exists");

        _tokenId.increment();
        uint256 tokenId = _tokenId.current();

        _tokenMap.set(to, tokenId);
        _ownerMap.set(tokenId, to);
        _countMap.set(tokenId, count_);

        emit Attest(to, tokenId);
        emit Transfer(address(0), to, tokenId);

        return tokenId;
    }

    function batchAttest(address[] calldata addrs, uint[] calldata counts_) external {
        uint256 addrLength = addrs.length;
        uint256 countLength = counts_.length;

        require(
            hasRole(OPERATOR_ROLE, _msgSender()),
            "Only the account with OPERATOR_ROLE can attest the SBT"
        );
        require(addrLength <= 100, "The max length of addresses is 100");
        require(addrLength == countLength, "The length of addresses and counts is not equal");

        for (uint8 i = 0; i < addrLength; i++) {
            address to = addrs[i];
            uint count_ = counts_[i];

            if (to == address(0) || _tokenMap.contains(to)) {
                continue;
            }

            _tokenId.increment();
            uint256 tokenId = _tokenId.current();

            _tokenMap.set(to, tokenId);
            _ownerMap.set(tokenId, to);
            _countMap.set(tokenId, count_);

            emit Attest(to, tokenId);
            emit Transfer(address(0), to, tokenId);
        }
    }

    function revoke(address from) external {
        require(
            hasRole(OPERATOR_ROLE, _msgSender()),
            "Only the account with OPERATOR_ROLE can revoke the SBT"
        );
        require(from != address(0), "Address is empty");
        require(_tokenMap.contains(from), "The account does not have any SBT");

        uint256 tokenId = _tokenMap.get(from);

        _tokenMap.remove(from);
        _ownerMap.remove(tokenId);
        _countMap.remove(tokenId);

        emit Revoke(from, tokenId);
        emit Transfer(from, address(0), tokenId);
    }

    function batchRevoke(address[] calldata addrs) external {
        uint256 addrLength = addrs.length;

        require(
            hasRole(OPERATOR_ROLE, _msgSender()),
            "Only the account with OPERATOR_ROLE can revoke the SBT"
        );
        require(addrLength <= 100, "The max length of addresses is 100");

        for (uint8 i = 0; i < addrLength; i++) {
            address from = addrs[i];

            if (from == address(0) || !_tokenMap.contains(from)) {
                continue;
            }

            uint256 tokenId = _tokenMap.get(from);

            _tokenMap.remove(from);
            _ownerMap.remove(tokenId);
            _countMap.remove(tokenId);

            emit Revoke(from, tokenId);
            emit Transfer(from, address(0), tokenId);
        }
    }

    function burn() external {
        address sender = _msgSender();

        require(
            _tokenMap.contains(sender),
            "The account does not have any SBT"
        );

        uint256 tokenId = _tokenMap.get(sender);

        _tokenMap.remove(sender);
        _ownerMap.remove(tokenId);
        _countMap.remove(tokenId);

        emit Burn(sender, tokenId);
        emit Transfer(sender, address(0), tokenId);
    }

    /**
     * @dev Update _baseTokenURI
     */
    function setBaseTokenURI(string calldata uri) public {
        require(
            hasRole(DEFAULT_ADMIN_ROLE, _msgSender()),
            "Only the account with DEFAULT_ADMIN_ROLE can set the base token URI"
        );

        _baseTokenURI = uri;
    }

    function balanceOf(address owner) external view returns (uint256) {
        (bool success, ) = _tokenMap.tryGet(owner);
        return success ? 1 : 0;
    }

    function tokenIdOf(address from) external view returns (uint256) {
        return _tokenMap.get(from, "The wallet has not attested any SBT");
    }

    function ownerOf(uint256 tokenId) external view returns (address) {
        return _ownerMap.get(tokenId, "Invalid tokenId");
    }

    function countOf(uint256 tokenId) external view returns (uint256) {
        return _countMap.get(tokenId, "Invalid tokenId");
    }

    function totalSupply() external view returns (uint256) {
        return _tokenMap.length();
    }

    function isOperator(address account) external view returns (bool) {
        return hasRole(OPERATOR_ROLE, account);
    }

    function isAdmin(address account) external view returns (bool) {
        return hasRole(DEFAULT_ADMIN_ROLE, account);
    }

    /**
     * @dev See {IERC721Metadata-tokenURI}.
     */
    function tokenURI(uint256 tokenId) external view returns (string memory) {
        return
            bytes(_baseTokenURI).length > 0
                ? string(abi.encodePacked(_baseTokenURI, tokenId.toString()))
                : "";
    }

    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override
        returns (bool)
    {
        return
            interfaceId == type(IERC721).interfaceId ||
            interfaceId == type(IFERC721Metadata).interfaceId ||
            super.supportsInterface(interfaceId);
    }

    /**
     * @dev Transfers a token from one address to another, if the sender has permission. And Decrements the count variable by 1 when a transfer is made.
     *
     * @param from The address of the current owner of the token.
     * @param to The address of the new owner of the token.
     * @param tokenId The unique identifier of the token.
     */
    function limitedTransfer(address from, address to, uint256 tokenId) external {
        // Check that the sender has permission to transfer the token
        require(_ownerMap.get(tokenId) == from, "Sender does not have permission to transfer token");
        // Check if count is greater than 0 before transferring
        require(_countMap.get(tokenId) > 0, "Transfer is unavailable");
        
        // Decrement count by 1
        uint count = _countMap.get(tokenId);
        _countMap.set(tokenId, count--);

        // Update the owner and token mappings and emit a Transfer event
        _ownerMap.set(tokenId, to);
        _tokenMap.remove(from);
        _tokenMap.set(to, tokenId);
        emit Transfer(from, to, tokenId);
    }
}