#!/usr/bin/env Rscript


library(Rserve)
Rserve(port=6336, args="--save")

#option(error=function() NULL)
