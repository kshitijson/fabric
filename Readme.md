I am trying to create a major project for college and for that I am using hyperledger fabric for that. It will be a multi host.
I have developed this project named EvidenceVault already for my previous semester,
This app securely stores evidence on IPFS and CID of that files on Blockchain. 
I used truffle, ganache and web3.js for this version. In the next version i want to add a private blockchain network and for that i am using hyperledger fabric.

github: https://github.com/kshitijson/Evidence-Vault.git
youtube: https://youtu.be/3dgjoDAunQ0

__Network Topology__

-I will have 2 orgs 1-Police Department 2-Forensic Department.  
-One channel, one orederer  
-I will have 4 nodes each of them on different machines  
-Each of my team member will host a peer on his machine


__Directory Structure__


Chaincode/  
    -evidenceVault-chaincode.js

channel-artifacts/  
    -channel-artifacts/  
    -config/  
        -configtx.yaml  
        -core.yaml  
        -orderer.yaml  
    -configtx.yaml  
    ForensicDeptanchors.tx  
    generate-artifacts.sh  
    genesis.block  
    mainchannel.tx  
    PoliceDeptanchors.tx  

crypto-config/  
    -crypto-config/  
        -OrdererOrganizations/  
            -evidence-vault.com/  
                -ca/  
                -msp/ ....  
        -peerOrganizations/  
            -forensic.evidence-vault.com/  
                -ca, msp ...  
            -police.evidence-vault.com/  
                -ca, msp ...  
    crypto-config.yaml  

base.yaml  
create-channel.sh  
docker-compose.yaml  
Readme.md  
