#/bin/bash/
cd openwrt
git pull
./scripts/feeds update -a && ./scripts/feeds install -a
make menuconfig
make -j8 download
make -j$(($(nproc) + 1)) V=s
