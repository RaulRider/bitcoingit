# BITCOIN PPA
sudo add-apt-repository ppa:bitcoin/bitcoin
sudo apt update
sudo apt install bitcoin-qt bitcoind

# INSTALL GO
wget https://dl.google.com/go/go1.13.linux-amd64.tar.gz
sha256sum go1.13.linux-amd64.tar.gz | awk -F " " '{ print $1 }'

The final output of the command above should be 68a2297eb099d1a76097905a2ce334e3155004ec08cdea85f24527be3c48e856. 

tar -C /usr/local -xzf go1.13.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

# INSTALL LND
export GOPATH=~/gocode
export PATH=$PATH:$GOPATH/bin

go get -d github.com/lightningnetwork/lnd
cd $GOPATH/src/github.com/lightningnetwork/lnd
make && make install


# CONFIGURACION DE bitcoin.conf y eclair.conf

#BITCOIN

```
#testnet=1
server=1
daemon=1
txindex=1
addresstype=p2sh-segwit
deprecatedrpc=signrawtransaction

#rpcport=8332
#rpcallowip=192.168.1.45 PARA UNA IP DETERMINADA DE LA LAN O WAN
rpcallowip=0.0.0.0/0    
#PARA QUE PUEDAN TODAS EN LA MISMA LAN

rpcuser=XXXXX
rpcpassword=XXXXX

zmqpubrawblock=tcp://127.0.0.1:29000
zmqpubrawtx=tcp://127.0.0.1:29001
```




#ECLAIR

```
# SERVER & NODE ##########
eclair.server.public-ips = ["83.45.182.4"]
#DEFAULT eclair.server.binding-ip="0.0.0.0"
#DEFAULT eclair.server.port=9735

eclair.node-alias=_Venus_
eclair.node-color=ff00ff
eclair.gui.unit=sat

# BITCOIND ###########
eclair.chain=mainnet
eclair.bitcoind.rpcport=8332
eclair.bitcoind.rpcuser=XXXXXXXXXXXX
eclair.bitcoind.rpcpassword=XXXXXXXXXXXX
eclair.bitcoind.zmqblock ="tcp://127.0.0.1:29000"
eclair.bitcoind.zmqtx="tcp://127.0.0.1:29001"

# ECLAIR API PARA eclair-cli ###########
eclair.api.enabled=true
eclair.api.password=XXXXXXXXXXXX
#DEFAULT eclair.api.binding-ip="127.0.0.1"
#DEFAULT eclair.api.port=8080


# PARAMETROS para nuevos canales creados ####
eclair.htlc-minimum-msat=1
eclair.fee-base-msat=500
eclair.fee-proportional-millionths=500
#DEFAULT eclair.htlc-minimum-msat=1
#DEFAULT eclair.fee-base-msat=1000
#DEFAULT eclair.fee-proportional-millionths=100

#eclair.chain : Which blockchain to use: regtest, testnet or mainnet testnet
#eclair.gui.unit : Unit in which amounts are displayed (possible values: msat, sat, bits, mbtc, btc) 	btc
```


#LND

```
bitcoin.active=1
bitcoin.mainnet=1 
debuglevel=debug
 
bitcoin.node=bitcoind

#bitcoind.rpchost=192.168.1.203
bitcoind.rpcuser=XXXXXX 
bitcoind.rpcpass=XXXXXXXX 
bitcoind.zmqpubrawblock=tcp://127.0.0.1:29000
bitcoind.zmqpubrawtx=tcp://127.0.0.1:29001 


no-macaroons=true
alias=_venus.LND_
color=#3399FF
```






#END
