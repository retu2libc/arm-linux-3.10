# arm-linux-3.10 Dockerfile
I find myself writing this Dockerfile over and over again so I decided to throw it up here. It builds linux 3.10 for 32 bit arm with software float support.
## Steps To Compile
I'm going to assume you have `git`, `pip` and `docker` here.
### Setup
```
git clone --recurse-submodules https://github.com/christheyankee/arm-linux-3.10.git
pip install scuba
cd arm-linux-3.10
```
### Build the Docker Image
```
docker build . -t 3.10
```
### Build Linux
```
scuba --image 3.10 make -C linux ARCH=arm defconfig
scuba --image 3.10 make -C linux ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- -j`nproc`
```
