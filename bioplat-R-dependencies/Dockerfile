from r-base:3.4.1
maintainer bioplat

run ["apt-get", "update"]
run ["apt-get", "install", "-y", "libcurl4-gnutls-dev","libxml2-dev"]


#third dependencies
add libs-to-install.r /r/libs-to-install.r

run ["Rscript", "/r/libs-to-install.r"]


