echo "##### Deleting existing files #####"
rm genesis.block
rm mainchannel.tx
rm PoliceDeptanchors.tx
rm ForensicDeptanchors.tx


SYS_CHANNEL="sys-channel"
CHANNEL_NAME="mainchannel"

echo ""
echo "##### Generating Genesis Block #####"
configtxgen -profile EvidenceVaultOrdererGenesis -channelID $SYS_CHANNEL -outputBlock ./genesis.block

echo ""
echo "##### Generating Channel Configuration Transaction #####"
configtxgen -profile EvidenceVaultChannel -outputCreateChannelTx ./mainchannel.tx -channelID $CHANNEL_NAME

echo ""
echo "##### Generating anchor peer update for PoliceDepartment #####"
configtxgen -profile EvidenceVaultChannel -outputAnchorPeersUpdate ./PoliceDeptanchors.tx -channelID $CHANNEL_NAME -asOrg PoliceDepartment

echo ""
echo "##### Generating anchor peer update for ForensicDepartment #####"
configtxgen -profile EvidenceVaultChannel -outputAnchorPeersUpdate ./ForensicDeptanchors.tx -channelID $CHANNEL_NAME -asOrg ForensicDepartment