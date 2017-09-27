
cd $(dirname $0)
./stop-and-rm-container.sh dev
./build.sh dev
./run-http-r-service dev
