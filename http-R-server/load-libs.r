## Load libraries when R start 
list.of.packages <- c("survival","fpc","Rserve","R6","survivalROC","cgdsr",
 "affy","frma","inSilicoDb","limma","survcomp","hgu133afrmavecs","hgu133acdf","limma","GenomicFeatures",
 "AnnotationDbi","BioplatR")

for(lib in list.of.packages){
	print(paste("Loading: ",  lib))
	library(lib, character.only=TRUE)
}

