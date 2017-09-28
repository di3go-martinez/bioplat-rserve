#!/bin/bash

version=1.0-rc.$(date "+%Y%m%d")
prodfile=bioplatR-$version.tar.gz

cp bioplatR-dev.tar.gz $prodfile

ln -s $prodfile bioplatR-prod.tar.gz 
