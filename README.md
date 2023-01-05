# Future SBT

# Our BEP-179 is live! : bnb-chain/BEPs#179

## Table of Contents
1. [SBT, BAB and fSBT](#tokens)
2. [What is fSBT?](#FSBT)
3. [Why fSBT?](#whyFSBT)
4. [AfSBT & PAfSBT](#customAFSBT)
5. [What is the future of fSBT?](#future)

## SBT, BAB and fSBT <a name="tokens"></a>

Soulbound Tokens (SBTs) are digital identity tokens that represent the traits, features, and achievements that make up a person or entity. SBTs are issued by “Souls,” which represent blockchain accounts or wallets, and cannot be transferred. [(link)](https://academy.binance.com/en/articles/what-are-soulbound-tokens-sbt)

Binance Account Bound (BAB) tokens are the first-ever Soulbound Token (SBT) built on the BNB Chain. BAB token is non-transferable and has no monetary value. It will function as a digital verification tool for Binance users who have completed [Identity Verification](https://www.binance.com/en/support/faq/360027287111).

Binance Account Bound (BAB) tokens are the first-ever Soulbound Token (SBT) built on the BNB Chain.
Like BAB, Future SBT(fSBT)s are the first-ever Soulbound Token which implies that there is a time point of conversion to SBT.

## What is fSBT?<a name="whatFSBT"></a>

### SBT vs fSBT
|  | SBT | fSBT |
|--|--|--|
| Trasnfer-able? | Not available | Limited number of times available |
| Token Owner Account | User | Can be delegated at first |
| User's point of mint | Not free | Free |
| User's wallet address | Needed | Not needed at first |
| Storage of Assets | Not available | Available |
| Community Recovery | Available | Available |

###  Overview of the fSBT (Future Soul Bound Token) proposal and its differences from SBT (Soul Bound Token)
fSBT is one of the various proposals that can be presented in the absence of SBT standards. fSBT stands for Future Soul Bound Token, meaning that there is a point at which it will be converted to SBT. The first major functional difference between fSBT and SBT is the "limit on the number of transfers." With fSBT, it is possible to have wider uses and applications by limiting the number of transfers to 1 or n in the SBT model. In addition, like SBT, the issuer or owner can restrict the functions of the fSBT or burn the token itself.
### The use and issuance of fSBT (Future Soul Bound Token) and its effects on the characteristics of the token
SBT cannot be transferred, so the account that mints the token must be a user. However, fSBT can be issued in advance because it is possible to transfer within the number of times specified in the contract. Depending on the intention of the issuer, it is possible to obtain different effects by issuing in advance or allowing the user to issue fSBT. The owner can use the limited number of transfers to strengthen the SBT-like characteristics by actually receiving the fSBT, or use the fSBT to fluidize the number of transfers to strengthen the NFT-like characteristics by minting the fSBT. If the fSBT is issued by a user's account, the rarity will be further emphasized because the number of transfers is limited.
### Benefits of flexible minting point in fSBT (Future Soul Bound Token) for personal account connection and Web3 onboarding in service situations
The fact that fSBT can be issued in advance also means that the minting point is flexible from the user's perspective. It is very important to consider when a personal account connection is needed in a service situation. Personal account connection is the first step towards Web3 onboarding, and it is the biggest hurdle. The fact that the minting point is flexible means that both the business and the user are free in terms of personal account connection, which provides a very high degree of freedom in the service environment.
## Why FSBT?<a name="whyFSBT"></a>
    
### The r3plica project and its focus on Account Abstraction (AA) for Web3 onboarding and the use of fSBT (Future Soul Bound Token)
[r3plica](https://github.com/catze-labs/BNBChainInnovationHackathon-r3plica-info) is a project that focuses on Web3 onboarding for Web2 users, enabling mass adoption and implementing the conceptual and functional implementation of Account Abstraction (AA). AA aims to implement features such as gas fee support and meta transactions. In actual service situations, this function is emphasized because content providers can act on behalf of users. In addition to the functional implementation of gas fee support and meta transactions pursued by AA, r3plica removes the time constraints of Web3 onboarding. fSBT allows users to benefit from the transparency, decentralization, and security benefits of Web3 without a Web3 account.

## AfSBT & PAfSBT<a name="customAFSBT"></a>

### AfSBT: Assetized fSBT
AfSBT (Assetized fSBT) is a type of fSBT that includes on-chain data in the form of an asset. It can also be thought of as a combination of a metaNFT and an SBT.
#### What’s MetaNFT?
The "meta" part of a meta NFT refers to the fact that these NFTs contain metadata, or additional information, about the underlying item or piece of information that the NFT represents. This metadata can be stored on-chain (on the blockchain) or off-chain (in a separate database).
Meta NFTs are used in a variety of contexts, including art, collectibles, gaming, and more. They allow for the creation of unique digital assets that can be owned and traded by individuals or organizations.
#### SBT + Meta NFT
Some examples of how SBTs can be used include:
-   Managing medical records
-   Storing digital ID cards or memberships
-   Certifying achievements
-   Verifying attendance to an event(similar to a POAP, [Proof of Attendance Protocol](https://www.coindesk.com/learn/poaps-what-is-a-proof-of-attendance-protocol/))

This goes further from the existing use points and enables the following use cases:
-   an artist might create a digital art piece and represent it as a meta SBT.
-   represent in-game items or assets, such as weapons or characters.
#### Use case examples
- IAfSBT, Items by Assetized fSBT
- AAfSBT, Achievements by Assetized fSBT

### PAfSBT: Profiles by AfSBT
The profile concept was introduced and IAfSBT & AAfSBT are mapped and retained.

#### PAfSBT (Profiles by Assetized fSBT) feature in the r3plica fSBT SDK and its transition to fully owned property with a Web3 account connection
The r3plica fSBT SDK allows users to create their fSBT when they join the service. Until the actual owner of the generated fSBT connects to a Web3 account, the ownership of this fSBT exists in the issued contract. This is called PAfSBT (Profiles by Assetized fSBT). When the user connects and owns a Web3 account and the issued PAfSBT, the PAfSBT consumes the limit on the number of transfers and becomes the fully owned property of the real owner.
#### How r3plica's PAfSBT (Profiles by Assetized fSBT) feature simplifies the process of accessing Web3 content for users
When users use the Web3 service through r3plica, they have a similar experience to using Web2 games and services. However, the items, achievements, and experience points that users actually obtain in the game are all stored in this PAfSBT and are transferred to the user when they want to enter Web3. This is significant in that it reduces the amount of information that users need to know in order to enjoy the content, compared to the traditional Web3 content that required users to connect a wallet first.
## How fSBT works? <a name="howFSBT"></a>
    
- countMap, added a new mapping  
	- countmap whiich maps token ID to transfer count
	- Track remaining transferable quantity by token ID  
- added limitedTransfer  
	- Decrease the count based on token ID by one when transferring  
	- When it becomes 0, it becomes impossible to move, and SBT is definitely located as the destination wallet address in the SBT scheduled state.
## What is the future of fSBT? <a name="future"></a>
   
### Utilizing fSBT for voucher functionality: 
By taking advantage of the limited number of transmission functions available with fSBT, vouchers can be designed to act like real vouchers, with expiration dates and other restrictions. This allows users to check the voucher information in advance and use it for specific authorization purposes.
    
### Implementing a white and black list system using fSBT: 
With the use of fSBT, it is possible to register wallet addresses on a white or black list and have this information visible on the entire chain. This allows for better tracking and control of wallet addresses.
    
### Transferring user accounts using PAfSBT: 
By designing PAfSBT (programmable asset-backed fSBT) to be transferable a certain number of times, it is possible to create a structure that emphasizes the characteristics of NFTs. This can be used to trade in-game assets such as levels, achievements, attributed items, and skills.
    
### Using fSBT to build sustainable communities: 
By using fSBT to create persistent communities, it is possible to build communities that matter at certain points in time. Examples could include alumni associations and staff meetings.
    
### Assetizing intangible user experiences with fSBT: 
One of the unique characteristics of fSBT is its ability to record and prove a user's game experience, even after the game has ended. This allows for the creation of intangible value, such as proof of professionalism, enthusiasm, and effort in a particular field. This can lead to additional value creation when certain game services become widely known and the achievements of users who played them are highly valued.
    
### Using fSBT to limit user behavior: 
fSBT can be used like a yellow or red card in soccer, limiting the number of content a user can access or the behavior of users who have caused problems such as cheating.

   
