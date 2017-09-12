#!/usr/bin/env Rscript


library(Rserve)
Rserve(debug=TRUE, port=6336, args="--save")

#option(error=function() NULL)
