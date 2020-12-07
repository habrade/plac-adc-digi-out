VSTD=-2008

XILINX_LIB_PATH=/opt/Questasim/10.7c/xilinx_lib_2019.2
UVVM_UTIL_DIR=/opt/UVVM/UVVM/uvvm_util/sim/uvvm_util


sim_vhdl_or_verilog=1
ifeq ($(sim_vhdl_or_verilog), 0)
	FIRMWARE_SRC_DIR=../src
	comp_tool=vcom
	SRCS=\
		${FIRMWARE_SRC_DIR}/comp6.vhd \
		${FIRMWARE_SRC_DIR}/comp14.vhd \
		${FIRMWARE_SRC_DIR}/comp15.vhd \
		${FIRMWARE_SRC_DIR}/test.vhd
else
	FIRMWARE_SRC_DIR=../src/verilog-src
	comp_tool=vlog
	VSTD=-93
	SRCS=\
		${FIRMWARE_SRC_DIR}/test.v
endif
	

TB_DIR= tb
TB_TOP=tb_test
TB_SRCS= \
	${TB_DIR}/${TB_TOP}.vhd


all: sim

comp_logic: 
	${comp_tool} -work work ${VSTD} ${SRCS}

comp_tb:
	vcom -work work -2008 ${TB_SRCS}

map_uvvm_util:
	vmap uvvm_util ${UVVM_UTIL_DIR}

sim: map_uvvm_util comp_logic comp_tb
	vsim -fsmdebug -voptargs=+acc -t 1ps work.${TB_TOP} -do add_wave.do

sim_nogui: map_uvvm_util comp_logic comp_tb
	vsim -voptargs=+acc -t 1ps -c work.${TB_TOP} -do add_wave.do

.PHONY: clean
clean:
	rm -rf work 
realclean:
	rm -rf work transcript _Alert.txt _Log.txt
