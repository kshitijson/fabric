#!/bin/bash

echo "Creating Directory"
cd ~
mkdir -v hyperledger-fabric-bin

echo ""
echo "##########   Intsalling Hyperledger Fabric   ##########"
echo ""

curl -sSL https://bit.ly/2ysbOFE | bash -s

echo ""
echo "##########   Moving binaries away from the main folder   ##########"
echo ""

cd fabric-samples
mv -v bin ../hyperledger-fabric-bin

echo ""
echo "##########   Deleted Fabric Samples Folder, bcoz we only need the binaries ;)   ##########"
echo ""

cd ..
rm -rf fabric-samples

echo ""
echo "##########   Adding binaries to path   ##########  "
echo ""

echo 'export PATH=$PATH:/root/hyperledger-fabric-bin/bin' >> ~/.bashrc
sleep 3
source ~/.bashrc

echo "#################################"
echo ""
echo "###   Read below instruction before restarting your device   ###"
echo ""
echo "###   Added binaries to path try running 'peer' command after restarting and ensure it runs without error   ###"
echo ""