SRC       = hello_world.sv
VCD       = hello_world.vcd
COUTPUT   = hello_world

COMPILER  = iverilog
SIMULATOR = vvp
VIEWER    = /Applications/gtkwave.app/Contents/Resources/bin/gtkwave

CFLAGS    = -g2012 -Wall
SFLAGS    =
VFLAGS    = view.gtkw

# Create the VCD
$(VCD) : $(COUTPUT)
	make run

# Create the compiled executable
$(COUTPUT) : $(SRC)
	$(COMPILER) $(CFLAGS) -o $(COUTPUT) $(SRC)

# Simulate the testbench
run : $(COUTPUT)
	$(SIMULATOR) $(SFLAGS) $(COUTPUT)

# View the waveform
view : $(VCD)
	$(VIEWER) $(VCD) $(VFLAGS) &

# Clean any created files
clean :
	@rm -f $(COUTPUT)
	@rm -f $(VCD)
