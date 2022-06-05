.PHONY: all clean blink_cu upload

clean:
	\rm -f *.vcd *.blif *.asc *.bin *.json

blink_cu:
	yosys -p "synth_ice40 -top top -blif blink_cu.blif" blink_cu.v
	yosys -p "synth_ice40 -json firmware.json" blink_cu.v
	nextpnr-ice40 --hx8k --json firmware.json --asc firmware.asc --package cb132 --pcf pinmap.pcf --freq 100
	icepack firmware.asc firmware.bin

upload:
	iceprog firmware.bin

timing:
	icetime -tmd hx8k firmware.asc