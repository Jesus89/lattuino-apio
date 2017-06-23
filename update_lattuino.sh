#!/bin/bash

SRC=src_lattuino
rm -rf $SRC
mkdir $SRC
mkdir $SRC/include
cd $SRC

apio init --board kefir

wget -nv https://github.com/INTI-CMNB/Lattuino_IP_Core/raw/master/FPGA/lattuino_1_v_icestorm/lattuino_1.in.pcf
wget -nv https://github.com/INTI-CMNB/Lattuino_IP_Core/raw/master/FPGA/lattuino_1_v/lattuino_1.v
wget -nv https://github.com/INTI-CMNB/Lattuino_IP_Core/raw/master/FPGA/lattuino_1_v/cpuconfig.v
wget -nv https://github.com/INTI-CMNB/Lattuino_IP_Core/raw/master/Work/lattuino_1_bl_8.v
wget -nv https://github.com/INTI-CMNB/Lattuino_IP_Core/raw/master/Work/lattuino_1_bl_8_v.dat
wget -nv https://github.com/INTI-CMNB/CapSense_IP_Core/raw/master/capsense_sys.v
wget -nv https://github.com/INTI-CMNB/CapSense_IP_Core/raw/master/capsense.v
wget -nv https://github.com/INTI-CMNB/Lattuino_IP_Core/raw/master/devices/ad_conv.v
wget -nv https://github.com/INTI-CMNB/SPI_IP_Core/raw/master/MCP300x/mcp300x.v
wget -nv https://github.com/INTI-CMNB/Lattuino_IP_Core/raw/master/devices/tm16b.v
wget -nv https://github.com/INTI-CMNB/Lattuino_IP_Core/raw/master/devices/tmcounter.v
wget -nv https://github.com/INTI-CMNB/MiniUART_IP_core/raw/master/miniuart.v
wget -nv https://github.com/INTI-CMNB/Lattuino_IP_Core/raw/master/FPGA/lattuino_1_v/wb_dev_intercon.v
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
wget -nv https://github.com/INTI-CMNB/AVR_for_iCE40_IP_Core/raw/master/devices/spi.v
wget -nv https://github.com/INTI-CMNB/SPI_IP_Core/raw/master/spi_master.v

mv lattuino_1_bl_8_v.dat include/lattuino_1_bl_8_v.dat
mv avr_constants.v include/avr_constants.v
mv avr_ports.v include/avr_ports.v

sed -i -e 's:"../../../Work/lattuino_1_bl_8_v.dat":"include/lattuino_1_bl_8_v.dat":' lattuino_1_bl_8.v
sed -i -e 's:"../core/avr_constants.v":"include/avr_constants.v":' wb_ctrl.v
sed -i -e 's:"../core/avr_constants.v":"include/avr_constants.v":' portx.v
sed -i -e 's:"../core/avr_ports.v":"include/avr_ports.v":' portx.v
sed -i -e 's:"../core/avr_constants.v":"include/avr_constants.v":' irq.v
sed -i -e 's:"../core/avr_constants.v":"include/avr_constants.v":' io_reg_file.v
sed -i -e 's:"avr_constants.v":"include/avr_constants.v":' cpu.v
sed -i -e 's:"../core/avr_constants.v":"include/avr_constants.v":' spi.v
