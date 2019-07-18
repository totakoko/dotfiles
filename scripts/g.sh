#!/bin/bash -e

export GOPATH=$HOME/go
export GOROOT=$HOME/.go

mkdir -p $GOPATH/bin
wget -O $GOPATH/bin/g https://git.io/g-bin
chmod +x $GOPATH/bin/g

PATH=$GOPATH/bin:$PATH
g install latest
