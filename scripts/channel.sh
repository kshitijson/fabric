export CORE_PEER_TLS_ENABLED=true
export ORDERER_CA=${PWD}/../artifacts/crypto-config/ordererOrganizations/evidence-vault.com/orderers/orderer.evidence-vault.com/msp/tlscacerts/tlsca.evidence-vault.com-cert.pem
export PEER0_ORG1_CA=${PWD}/../artifacts/channel/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
export PEER0_ORG2_CA=${PWD}/../artifacts/channel/crypto-config/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt
export FABRIC_CFG_PATH=${PWD}/../artifacts/config/


export ORDERER_ADMIN_TLS_SIGN_CERT=${PWD}/../artifacts/crypto-config/ordererOrganizations/evidence-vault.com/orderers/orderer.evidence-vault.com/tls/server.crt
export ORDERER_ADMIN_TLS_PRIVATE_KEY=${PWD}/../artifacts/crypto-config/ordererOrganizations/evidence-vault.com/orderers/orderer.evidence-vault.com/tls/server.key


CHANNEL_NAME='mainchannel'

channelJoinOrderer(){
    osnadmin channel join --channelID $CHANNEL_NAME \
    --config-block ../channel-artifacts/${CHANNEL_NAME}.block -o localhost:7053 \
    --ca-file $ORDERER_CA \
    --client-cert $ORDERER_ADMIN_TLS_SIGN_CERT \
    --client-key $ORDERER_ADMIN_TLS_PRIVATE_KEY 
}

channelJoinOrderer