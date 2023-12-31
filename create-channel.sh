export CORE_PEER_TLS_ENABLED=true
export ORDERER_CA=${PWD}/crypto-config/crypto-config/ordererOrganizations/evidence-vault.com/orderers/orderer.evidence-vault.com/msp/tlscacerts/tlsca.evidence-vault.com-cert.pem
export PEER0_POLICE_CA=${PWD}/crypto-config/crypto-config/peerOrganizations/police.evidence-vault.com/peers/peer0.police.evidence-vault.com/tls/ca.crt
export PEER0_FORENSIC_CA=${PWD}/crypto-config/crypto-config/peerOrganizations/forensic.evidence-vault.com/peers/peer0.forensic.evidence-vault.com/tls/ca.crt
export FABRIC_CFG_PATH=${PWD}/channel-artifacts/config

export CHANNEL_NAME=mainchannel

# setGlobalsForOrderer(){
#     export CORE_PEER_LOCALMSPID="OrdererMSP"
#     export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/artifacts/channel/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
#     export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/ordererOrganizations/example.com/users/Admin@example.com/msp
    
# }

setGlobalsForPeer0Police(){
    export CORE_PEER_LOCALMSPID="PoliceMSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_POLICE_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/crypto-config/crypto-config/peerOrganizations/police.evidence-vault.com/users/Admin@police.evidence-vault.com/msp
    export CORE_PEER_ADDRESS=localhost:7051
}

# setGlobalsForPeer1Org1(){
#     export CORE_PEER_LOCALMSPID="Org1MSP"
#     export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_POLICE_CA
#     export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
#     export CORE_PEER_ADDRESS=localhost:8051
    
# }

# setGlobalsForPeer0Org2(){
#     export CORE_PEER_LOCALMSPID="Org2MSP"
#     export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_FORENSIC_CA
#     export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp
#     export CORE_PEER_ADDRESS=localhost:9051
    
# }

# setGlobalsForPeer1Org2(){
#     export CORE_PEER_LOCALMSPID="Org2MSP"
#     export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_FORENSIC_CA
#     export CORE_PEER_MSPCONFIGPATH=${PWD}/artifacts/channel/crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp
#     export CORE_PEER_ADDRESS=localhost:10051
    
# }

createChannel(){
    rm -rf ./channel-artifacts/channel-artifacts-main/*
    setGlobalsForPeer0Police
    
    peer channel create -o localhost:7050 -c $CHANNEL_NAME \
    --ordererTLSHostnameOverride orderer.evidence-vault.com \
    -f ./channel-artifacts/${CHANNEL_NAME}.tx \
    --outputBlock ./channel-artifacts/channel-artifacts-main/${CHANNEL_NAME}.block \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

# removeOldCrypto(){
#     rm -rf ./api-1.4/crypto/*
#     rm -rf ./api-1.4/fabric-client-kv-org1/*
#     rm -rf ./api-2.0/org1-wallet/*
#     rm -rf ./api-2.0/org2-wallet/*
# }


joinChannel(){
    setGlobalsForPeer0Org1
    peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
    # setGlobalsForPeer1Org1
    # peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
    # setGlobalsForPeer0Org2
    # peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
    # setGlobalsForPeer1Org2
    # peer channel join -b ./channel-artifacts/$CHANNEL_NAME.block
    
}

updateAnchorPeers(){
    setGlobalsForPeer0Org1
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
    
    # setGlobalsForPeer0Org2
    # peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c $CHANNEL_NAME -f ./artifacts/channel/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
    
}

# removeOldCrypto


createChannel
# joinChannel
# updateAnchorPeers