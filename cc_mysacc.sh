CHAINCODE_NAME=mysacc2
VERSION=v1.0.0
CC_SRC_PATH=github.com/mysacc2

docker exec cli peer chaincode install -n $CHAINCODE_NAME -v $VERSION -p $CC_SRC_PATH
docker exec cli peer chaincode instantiate -n $CHAINCODE_NAME -v $VERSION -C mychannel -c '{"Args":[]}' -P 'OR ("Org1MSP.member","Org2MSP.member","Org3MSP.member")'

docker exec cli peer chaincode invoke -n $CHAINCODE_NAME -C mychannel -c '{"Args":["set","b","200"]}'
sleep 3
docker exec cli peer chaincode query -n $CHAINCODE_NAME -C mychannel -c '{"Args":["get","b"]}'
docker exec cli peer chaincode query -n $CHAINCODE_NAME -C mychannel -c '{"Args":["getAllKeys"]}'
