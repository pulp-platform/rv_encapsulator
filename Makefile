# Author:  Umberto Laghi
# Contact: umberto.laghi2@unibo.it
# Github:  @ubolakes

# commands for questa terminal
questa-cmd += -do 'project new . encapsulator'
questa-cmd += -do 'project addfile src/include/encap_pkg.sv'
questa-cmd += -do 'project addfile src/rtl/common_cells/src/counter.sv'
questa-cmd += -do 'project addfile src/rtl/fifo_v3.sv'
questa-cmd += -do 'project addfile src/rtl/atb_transmitter.sv'
questa-cmd += -do 'project addfile src/rtl/encapsulator.sv'
questa-cmd += -do 'project addfile src/rtl/slicer.sv'
questa-cmd += -do 'project addfile src/rtl/rv_encapsulator.sv'
questa-cmd += -do 'project addfile tb/tb_rv_encapsulator.sv'
questa-cmd += -do 'project compileall'
questa-cmd += -do 'vsim -voptargs=+acc work.tb_rv_encapsulator'
questa-cmd += -do 'log -r /*'
questa-cmd += -do 'run 200'

clean:
	rm -rf transcript
	rm -rf encapsulator.mpf
	rm -rf encapsulator.cr.mti
	rm -rf modelsim.ini
	rm -rf work
	rm -rf vsim.wlf

run:
	git submodule update --init --recursive
	questa-2022.3 vsim $(questa-cmd)
