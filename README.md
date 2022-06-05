# Yosys Toolchain
## Ubuntu

```
sudo apt-get install build-essential clang bison flex \
	libreadline-dev gawk tcl-dev libffi-dev git \
	graphviz xdot pkg-config python3 libboost-system-dev \
	libboost-python-dev libboost-filesystem-dev zlib1g-dev \
	libboost-all-dev openocd
```
## Build and Install
Run `./install-tools.sh` to build and install the toolchain under the current user home directory. Add `PATH=$PATH:$HOME/opt/bin` to your profile or alternatively `export PATH=$PATH:$HOME/opt/bin` in the shell environment.
## udev
Add the following udev rule in `/etc/udev/rules.d/53-lattice-ftdi.rules` to give access right to the current user that is required for uploading the bitstream.
```
SUBSYSTEM!="usb|usb_device", GOTO="ft2232_rules_end"
ACTION!="add", GOTO="ft2232_rules_end"

ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6010", MODE="0666", GROUP="dialout"

LABEL="ft2232_rules_end"
```
Then add the current user to `dialout` group `sudo adduser $USER dialout`