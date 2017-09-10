#!/usr/bin/env Rscript


library(Rserve)
Rserve(debug=TRUE, port=6336, args="--save --RS-enable-remote")

option(error=function() NULL)
