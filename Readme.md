__Directory Structure__

.
├── base.yaml
├── chaincode
│   ├── evidenceVault-chaincode.js
│   |-- node_modules
│   ├── package.json
│   └── package-lock.json
├── channel-artifacts
│   ├── channel-artifacts-main
│   ├── config
│   │   ├── configtx.yaml
│   │   ├── core.yaml
│   │   └── orderer.yaml
│   ├── configtx.yaml
│   ├── ForensicDeptanchors.tx
│   ├── generate-artifacts.sh
│   ├── genesis.block
│   ├── mainchannel.tx
│   └── PoliceDeptanchors.tx
├── create-channel.sh
├── crypto-config
│   ├── crypto-config
│   │   ├── ordererOrganizations
│   │   │   └── evidence-vault.com
│   │   │       
│   │   │       └── users
│   │   │           └── Admin@evidence-vault.com
│   │   │               
│   │   └── peerOrganizations
│   │       ├── forensic.evidence-vault.com
│   │       │   ├── ca
│   │       │   │   ├── ca.forensic.evidence-vault.com-cert.pem
│   │       │   │   └── priv_sk
│   │       │   ├── msp
│   │       │   │   ├── admincerts
│   │       │   │   ├── cacerts
│   │       │   │   │   └── ca.forensic.evidence-vault.com-cert.pem
│   │       │   │   ├── config.yaml
│   │       │   │   └── tlscacerts
│   │       │   │       └── tlsca.forensic.evidence-vault.com-cert.pem
│   │       │   ├── peers
│   │       │   │   ├── peer0.forensic.evidence-vault.com
│   │       │   │   │   
│   │       │   │   └── peer1.forensic.evidence-vault.com
│   │       │   │       
│   │       │   └── users
│   │       │       
│   │       └── police.evidence-vault.com
│   │           
│   │           ├── peers
│   │           │   ├── peer0.police.evidence-vault.com
│   │           │   │  
│   │           │   └── peer1.police.evidence-vault.com
│   │           │       
│   │           └── users
│   │               ├──
│   └── crypto-config.yaml
├── docker-compose.yaml
└── Readme.md

243 directories, 901 files
