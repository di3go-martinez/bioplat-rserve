from r-base
maintainer bioplat

run ["apt-get", "update"]
#para que instale RCurl --> inSilicoDb
run ["apt-get", "install", "-y", "libcurl4-gnutls-dev", "libxml2-dev"]



#third dependencies
add libs-to-install.r /r/libs-to-install.r

run ["Rscript", "/r/libs-to-install.r"]


