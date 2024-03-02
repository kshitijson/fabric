# echo "######   Deleting crypto-config     #######"
# rm -rf ./crypto-config

# echo ""
# echo "######   Generating crypto-config     #######"
# cryptogen generate --config=./crypto-config.yaml --output=./crypto-config

echo ""
echo "##### Deleting existing files #####"
rm ./artifacts/evidencevault-genesis.block
rm ./artifacts/mainchannel.tx
rm ./artifacts/Policeanchors.tx
rm ./artifacts/Forensicanchors.tx


SYS_CHANNEL="ordererchannel"
CHANNEL_NAME="mainchannel"

echo ""
echo "##### Generating Genesis Block #####"
configtxgen -profile EvidenceVaultOrdererGenesis -channelID $SYS_CHANNEL -outputBlock ./artifacts/genesis.block

echo ""
echo "##### Generating Channel Configuration Transaction #####"
configtxgen -profile EvidenceVaultChannel -outputCreateChannelTx ./artifacts/mainchannel.tx -channelID $CHANNEL_NAME

echo ""
echo "##### Generating anchor peer update for PoliceDepartment #####"
configtxgen -profile EvidenceVaultChannel -outputAnchorPeersUpdate ./artifacts/PoliceMSPanchors.tx -channelID $CHANNEL_NAME -asOrg PoliceMSP

echo ""
echo "##### Generating anchor peer update for ForensicDepartment #####"
configtxgen -profile EvidenceVaultChannel -outputAnchorPeersUpdate ./artifacts/ForensicMSPanchors.tx -channelID $CHANNEL_NAME -asOrg ForensicMSP