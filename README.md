# fedora-packaging

## How to build:
docker build -t fedora-packaging . 

## How to run:
docker run --rm --privileged=true -v ~/.ssh/id_rsa:/home/build/.ssh/id_rsa -v ~/.ssh/id_rsa.pub:/home/build/.ssh/id_rsa.pub -v ~/tmp:/var/tmp -it fedora-packaging /bin/bash
