# Yosys Toolchain
## udev Rules
`ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6010", MODE="0660", GROUP="plugdev", TAG+="uaccess"`

## Ubuntu

```
sudo apt-get install build-essential clang bison flex \
	libreadline-dev gawk tcl-dev libffi-dev git \
	graphviz xdot pkg-config python3 libboost-system-dev \
	libboost-python-dev libboost-filesystem-dev zlib1g-dev \
	libboost-all-dev openocd
```

## Build and Install
Run `./install-tools.sh` to build and install the toolchain under the current user home directory.