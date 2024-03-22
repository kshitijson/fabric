export CORE_PEER_TLS_ENABLED=true
export ORDERER_CA=${PWD}/../artifacts/crypto-config/ordererOrganizations/evidence-vault.com/orderers/orderer.evidence-vault.com/msp/tlscacerts/tlsca.evidence-vault.com-cert.pem
export FABRIC_CFG_PATH=${PWD}/../artifacts/config/

export ORDERER_ADMIN_TLS_SIGN_CERT=${PWD}/../artifacts/crypto-config/ordererOrganizations/evidence-vault.com/orderers/orderer.evidence-vault.com/tls/server.crt
export ORDERER_ADMIN_TLS_PRIVATE_KEY=${PWD}/../artifacts/crypto-config/ordererOrganizations/evidence-vault.com/orderers/orderer.evidence-vault.com/tls/server.key

CHANNEL_NAME='mainchannel'


channelJoinOrderer() {
    osnadmin channel join --channelID $CHANNEL_NAME \
    --config-block ../channel-artifacts/${CHANNEL_NAME}.block -o localhost:7053 \
    --ca-file $ORDERER_CA \
    --client-cert $ORDERER_ADMIN_TLS_SIGN_CERT \
    --client-key $ORDERER_ADMIN_TLS_PRIVATE_KEY 
}


anchorPeerJoinChannel() {
    # for PD100
    echo "###  Joining Anchor Peer PD100 to the mainchannel  ###"
    export CORE_PEER_LOCALMSPID="PoliceMSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../artifacts/crypto-config/peerOrganizations/police.evidence-vault.com/peers/PD100.police.evidence-vault.com/tls/ca.crt
    export CORE_PEER_MSPCONFIGPATH=${PWD}/../artifacts/crypto-config/peerOrganizations/police.evidence-vault.com/users/Admin@police.evidence-vault.com/msp
    export CORE_PEER_ADDRESS=localhost:7051

    peer channel join -b ../channel-artifacts/${CHANNEL_NAME}.block
    ##

    echo ""

    # for FD100
    echo "###  Joining Anchor Peer FD100 to the mainchannel  ###"
    sleep 3

    export CORE_PEER_LOCALMSPID="ForensicMSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../artifacts/crypto-config/peerOrganizations/forensic.evidence-vault.com/peers/FD100.forensic.evidence-vault.com/tls/ca.crt
    export CORE_PEER_MSPCONFIGPATH=${PWD}/../artifacts/crypto-config/peerOrganizations/forensic.evidence-vault.com/users/Admin@forensic.evidence-vault.com/msp
    export CORE_PEER_ADDRESS=localhost:9051

    peer channel join -b ../channel-artifacts/${CHANNEL_NAME}.block
    ##
}


peerJoinChannel() {
    ## for PD101
    echo "###  Joining Peer PD101 to the mainchannel  ###"
    export CORE_PEER_LOCALMSPID="PoliceMSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../artifacts/crypto-config/peerOrganizations/police.evidence-vault.com/peers/PD101.police.evidence-vault.com/tls/ca.crt
    export CORE_PEER_MSPCONFIGPATH=${PWD}/../artifacts/crypto-config/peerOrganizations/police.evidence-vault.com/users/Admin@police.evidence-vault.com/msp
    export CORE_PEER_ADDRESS=localhost:8051

    peer channel join -b ../channel-artifacts/${CHANNEL_NAME}.block
    ##

    echo ""

    # for FD100
    echo "###  Joining Peer FD101 to the mainchannel  ###"
    sleep 3

    export CORE_PEER_LOCALMSPID="ForensicMSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../artifacts/crypto-config/peerOrganizations/forensic.evidence-vault.com/peers/FD101.forensic.evidence-vault.com/tls/ca.crt
    export CORE_PEER_MSPCONFIGPATH=${PWD}/../artifacts/crypto-config/peerOrganizations/forensic.evidence-vault.com/users/Admin@forensic.evidence-vault.com/msp
    export CORE_PEER_ADDRESS=localhost:10051

    peer channel join -b ../channel-artifacts/${CHANNEL_NAME}.block
    ##
}


channelJoinOrderer

sleep 2
echo ""

anchorPeerJoinChannel

sleep 3
echo ""

peerJoinChannel