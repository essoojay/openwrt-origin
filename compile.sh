#/bin/bash/
cd openwrt
git pull
./scripts/feeds update -a && ./scripts/feeds install -a
make -j8 download
make -j$(($(nproc) + 1)) V=s
cd /home/openwrt/openwrt/bin/targets/x86/64
./getindex.sh
