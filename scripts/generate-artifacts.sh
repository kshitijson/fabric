# echo "######   Deleting crypto-config     #######"
# rm -rf ../artifacts/crypto-config

# echo ""
# echo "######   Generating crypto-config     #######"
# cryptogen generate --config=../artifacts/crypto-config.yaml --output=../artifacts/crypto-config

# sleep 5

echo ""
echo "##### Deleting existing files #####"
rm ../channel-artifacts/mainchannel.block
# rm evidencevault-genesis.block
# rm mainchannel.tx
# rm Policeanchors.tx
# rm Forensicanchors.tx


# SYS_CHANNEL="ordererchannel"
# CHANNEL_NAME="mainchannel"

# echo ""
# echo "##### Generating Genesis Block #####"
# configtxgen -profile EvidenceVaultOrdererGenesis -channelID $SYS_CHANNEL -outputBlock evidencevault-genesis.block

# echo ""
# echo "##### Generating Channel Configuration Transaction #####"
# configtxgen -profile EvidenceVaultChannel -outputCreateChannelTx mainchannel.tx -channelID $CHANNEL_NAME

# echo ""
# echo "##### Generating anchor peer update for PoliceDepartment #####"
# configtxgen -profile EvidenceVaultChannel -outputAnchorPeersUpdate Policeanchors.tx -channelID $CHANNEL_NAME -asOrg Police

# echo ""
# echo "##### Generating anchor peer update for ForensicDepartment #####"
# configtxgen -profile EvidenceVaultChannel -outputAnchorPeersUpdate Forensicanchors.tx -channelID $CHANNEL_NAME -asOrg Forensic



# channel name defaults to "mychannel"
CHANNEL_NAME="mainchannel"

# Generate Channel Genesis block
configtxgen -profile EvidenceVaultOrdererGenesis -configPath ../artifacts/ -channelID $CHANNEL_NAME  -outputBlock ../channel-artifacts/$CHANNEL_NAME.block
