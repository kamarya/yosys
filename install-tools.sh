#!/usr/bin/sh

set -e

mkdir -p $HOME/opt
cd $HOME/opt

if [ ! -d yosys-done ];then
git clone --recursive --depth=1 https://github.com/YosysHQ/yosys
cd yosys
make -j 4
make install DESTDIR=$HOME/opt PREFIX=/
cd ..
mv yosys yosys-done
fi

if [ ! -d icestorm-done ];then
git clone --recursive --depth=1 https://github.com/YosysHQ/icestorm
cd icestorm
make -j 4
make install DESTDIR=$HOME/opt PREFIX=/
cd ..
mv icestorm icestorm-done
fi

if [ ! -d prjtrellis-done ];then
git clone --recursive https://github.com/YosysHQ/prjtrellis
cd prjtrellis/libtrellis
cmake -DCMAKE_INSTALL_PREFIX=$HOME/opt .
make -j 4
make install
cd ../../
mv prjtrellis prjtrellis-done
fi

if [ ! -d nextpnr-done ];then
git clone --recursive --depth=1 https://github.com/YosysHQ/nextpnr
cd nextpnr
cmake . -DARCH="ice40;ecp5" -DICESTORM_INSTALL_PREFIX=$HOME/opt -DTRELLIS_INSTALL_PREFIX=$HOME/opt -DCMAKE_INSTALL_PREFIX=$HOME/opt
make -j 4
make install
cd ..
mv nextpnr nextpnr-done
fi


rm -rf yosys-done
rm -rf icestorm-done
rm -rf prjtrellis-done
rm -rf nextpnr-done
