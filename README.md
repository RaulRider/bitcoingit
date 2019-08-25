# bitcoingit
Cosas de bitcoin

# BITCOIN INSTALLATION
Instruction from Stop&Decrypt 

```
sudo apt-get update;
sudo apt-get install git;
sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3;
sudo apt-get install libboost-all-dev;

mkdir -p bitcoin-source && cd bitcoin-source
git clone https://github.com/bitcoin/bitcoin.git;

wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz;
echo '12edc0df75bf9abd7f82f821795bcee50f42cb2e5f76a6a281b85732798364ef  db-4.8.30.NC.tar.gz' | sha256sum -c;
tar -xvf db-4.8.30.NC.tar.gz;
cd db-4.8.30.NC/build_unix;
mkdir -p build;
BDB_PREFIX=$(pwd)/build;
../dist/configure --disable-shared --enable-cxx --with-pic --prefix=$BDB_PREFIX;
sudo make install;
cd ../..;

sudo apt-get install libminiupnpc-dev;
sudo apt-get install libzmq3-dev;
sudo apt-get install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler;
sudo apt-get install libqrencode-dev;

cd bitcoin;
git checkout tags/v0.16.3;
./autogen.sh;
./configure CPPFLAGS="-I${BDB_PREFIX}/include/ -O2" LDFLAGS="-L${BDB_PREFIX}/lib/" --with-gui;
make;
sudo make install;
```
# LND INSTALLATION 
Instructions from https://github.com/lightningnetwork/lnd/blob/master/docs/INSTALL.md

Para Linux (x86-64)
```
wget https://dl.google.com/go/go1.12.3.linux-amd64.tar.gz
sha256sum go1.12.3.linux-amd64.tar.gz | awk -F " " '{ print $1 }'
# check 3924819eed16e55114f02d25d03e77c916ec40b7fd15c8acb5838b63135b03df
tar -C /usr/local -xzf go1.12.3.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

# Execute but We recommend placing the above in your .bashrc as well
export GOPATH=~/gocode
export PATH=$PATH:$GOPATH/bin

# Installation itself
go get -d github.com/lightningnetwork/lnd
cd $GOPATH/src/github.com/lightningnetwork/lnd
make && make install

```

Para Linux (ARMv6) / RASPBERRY
```
wget https://dl.google.com/go/go1.12.3.linux-armv6l.tar.gz
sha256sum go1.12.3.linux-armv6l.tar.gz | awk -F " " '{ print $1 }'
#check efce59fac5ebc7302263ca1093fe2c3252c1b936f5b1ae08afc328eea0403c79
tar -C /usr/local -xzf go1.12.3.linux-armv6l.tar.gz
export PATH=$PATH:/usr/local/go/bin

# Execute but We recommend placing the above in your .bashrc as well
export GOPATH=~/gocode
export PATH=$PATH:$GOPATH/bin

# Installation itself
go get -d github.com/lightningnetwork/lnd
cd $GOPATH/src/github.com/lightningnetwork/lnd
make && make install

```
Updating
To update your version of lnd to the latest version run the following commands:
```
cd $GOPATH/src/github.com/lightningnetwork/lnd
git pull
make clean && make && make install

```

# METODOS BITCOIN-CLI
```
bitcoin-cli walletpassphrase <passphrase> <timeoutinseconds> 
```

Command line (cURL): You can also send commands and see results using cURL or some other command-line HTTP-fetching utility; for example:
```
curl --data-binary '{"jsonrpc":"1.0","id":"curlbtcp","method":"getblockchaininfo","params":[]}' -H 'content-type:text/plain;' http://<use>:<password>@192.168.1.203:8332/

curl --data-binary '{"jsonrpc":"1.0","id":"curlbtcp","method":"getblockchaininfo","params":[]}' -H 'content-type:text/plain;' http://<use>:<password>@127.0.0.1:8332/
```
You will be prompted for your rpcpassword, and then will see something like:
```
  {"result":{"balance":0.000000000000000,"blocks":59952,"connections":48,"proxy":"","generate":false,
     "genproclimit":-1,"difficulty":16.61907875185736},"error":null,"id":"curltest"}
```
# METODOS ECLAIR
Ejemplo:
```
eclair-cli open 03933884aaf1d6b108397e5efe5c86bcf2d8ca8d2f700eda99db9214fc2712b134 14000000 0
```
OJO PARA CAMBIAR LOS FEES DE LOS CANALES
Relay fee changes in eclair.conf will only apply to new channels. To change relay fees for existing channels you need yo use the updaterelayfee API call
```
eclair-cli updaterelayfee <channelId>, <feeBaseMsat>, <feeProportionalMillionths> 	
```


Examples
Example 1: open a channel with eclair-cli / Your node listens on 8081. You want to open a 140 mBTC channel (140mBTC = 14.000.000 satoshi).
First connect to the endurance node / then / Then open a channel with endurance:
```
eclair-cli connect 03933884aaf1d6b108397e5efe5c86bcf2d8ca8d2f700eda99db9214fc2712b134@endurance.acinq.co:9735
eclair-cli open 03933884aaf1d6b108397e5efe5c86bcf2d8ca8d2f700eda99db9214fc2712b134 14000000 0
```
You can do it with cRUL: 
```
curl -X POST -H 'content-type: application/json' -u :<api_password> \
-d '{"jsonrpc": "2.0" , "id":"curleclair" , "method": "channels" , "params": [] }' http://127.0.0.1:8080
```
Your node listens on 8080. You want to open a 140 mBTC channel with endurance.acinq.co on Testnet with a 30 mBTC push

1st Connect
```
curl -X POST -H 'content-type: application/json' -u :<api_password> -d '{ "jsonrpc": "2.0", "method": "connect", \
    "params": [ "03933884aaf1d6b108397e5efe5c86bcf2d8ca8d2f700eda99db9214fc2712b134@endurance.acinq.co:9735" ] }' \
  http://127.0.0.1:8080
```

2nd Open Channel
```
curl -X POST -H 'content-type: application/json' -u :<api_password> -d '{ "jsonrpc": "2.0", "method": "open", \
    "params": [ "03933884aaf1d6b108397e5efe5c86bcf2d8ca8d2f700eda99db9214fc2712b134",14000000, 3000000000 ] }' \
  http://127.0.0.1:8080
```

Example 3: generate a payment request for 1 mBTC (1mBTC = 100,000 satoshi <> 100,000,000 milisatosi)

```
eclair-cli receive 100000000 "my first invoice"
>>>> lntb1m1pdthhh0pp5063r.............w7udrt2sdsvjf3rawdqcpas9mah
```
You can check this invoice with the checkinvoice command:
```
eclair-cli parseinvoice  lntb1m1pdthhh0pp506.......dywuw7udrt2sdsvjf3rawdqcpas9mah
```
Example 4: list local channels in NORMAL state
```
eclair-cli channels | jq '.[] | select(.state == "NORMAL")'
```
Example 5: compute your total balance across all channels (We divide by 1000 because we want satoshis, not millisatoshis).
```
eclair-cli channels | jq '.[] | .channelId' | xargs -L 1 ./eclair-cli channel | jq  -s 'map(.balanceMsat / 1000) | add'
```

# List of methods (incomplete)
https://github.com/ACINQ/eclair#json-rpc-api


LND
```      
[main]

[test]
```
