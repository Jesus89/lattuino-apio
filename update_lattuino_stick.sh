#!/bin/bash

SRC=src_lattuino_stick
rm -rf $SRC
mkdir $SRC
mkdir $SRC/include
cd $SRC

apio init --board icestick

wget -nv https://github.com/INTI-CMNB/Lattuino_IP_Core/raw/master/FPGA/lattuino_stick_v_icestorm/lattuino_stick.pcf
wget -nv https://github.com/INTI-CMNB/Lattuino_IP_Core/raw/master/FPGA/lattuino_stick_v_icestorm/lattuino_stick.v
wget -nv https://github.com/INTI-CMNB/Lattuino_IP_Core/raw/master/FPGA/lattuino_stick_v_icestorm/cpuconfig.v
wget -nv https://github.com/INTI-CMNB/Lattuino_IP_Core/raw/master/Work/lattuino_1_bl_2s.v
wget -nv https://github.com/INTI-CMNB/Lattuino_IP_Core/raw/master/Work/lattuino_1_bl_2s.dat
wget -nv https://github.com/INTI-CMNB/MiniUART_IP_core/raw/master/miniuart.v
wget -nv https://github.com/INTI-CMNB/AVR_for_iCE40_IP_Core/raw/master/micros/attX5.v
wget -nv https://github.com/INTI-CMNB/AVR_for_iCE40_IP_Core/raw/master/devices/wb_ctrl.v
wget -nv https://github.com/INTI-CMNB/AVR_for_iCE40_IP_Core/raw/master/core/avr_constants.v
wget -nv https://github.com/INTI-CMNB/AVR_for_iCE40_IP_Core/raw/master/devices/portx.v
wget -nv https://github.com/INTI-CMNB/AVR_for_iCE40_IP_Core/raw/master/core/avr_ports.v
wget -nv https://github.com/INTI-CMNB/AVR_for_iCE40_IP_Core/raw/master/memory/dm_s.v
wget -nv https://github.com/INTI-CMNB/AVR_for_iCE40_IP_Core/raw/master/devices/irq.v
wget -nv https://github.com/INTI-CMNB/AVR_for_iCE40_IP_Core/raw/master/core/core.v
wget -nv https://github.com/INTI-CMNB/AVR_for_iCE40_IP_Core/raw/master/core/io_reg_file.v
wget -nv https://github.com/INTI-CMNB/AVR_for_iCE40_IP_Core/raw/master/core/cpu.v
wget -nv https://github.com/INTI-CMNB/AVR_for_iCE40_IP_Core/raw/master/core/reg_file.v
wget -nv https://github.com/INTI-CMNB/MiniUART_IP_core/raw/master/Rxunit.v
wget -nv https://github.com/INTI-CMNB/MiniUART_IP_core/raw/master/Txunit.v
wget -nv https://github.com/INTI-CMNB/MiniUART_IP_core/raw/master/utils.v

mv lattuino_1_bl_2s.dat include/lattuino_1_bl_2s.dat
mv avr_constants.v include/avr_constants.v
mv avr_ports.v include/avr_ports.v

sed -i -e 's:"../cpuconfig.v":"cpuconfig.v":' lattuino_stick.v
sed -i -e 's:"../../../Work/lattuino_1_bl_2s_v.dat":"include/lattuino_1_bl_2s.dat":' lattuino_1_bl_2s.v
sed -i -e 's:"../core/avr_constants.v":"include/avr_constants.v":' wb_ctrl.v
sed -i -e 's:"../core/avr_constants.v":"include/avr_constants.v":' portx.v
sed -i -e 's:"../core/avr_ports.v":"include/avr_ports.v":' portx.v
sed -i -e 's:"../core/avr_constants.v":"include/avr_constants.v":' irq.v
sed -i -e 's:"../core/avr_constants.v":"include/avr_constants.v":' io_reg_file.v
sed -i -e 's:"avr_constants.v":"include/avr_constants.v":' cpu.v
