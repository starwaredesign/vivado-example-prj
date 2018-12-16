#!/usr/bin/env bash
source /home/vivado/.profile 
cd scripts
vivado -mode batch -source recreate_prj.tcl 
vivado -mode batch -source build_bitstream.tcl 
cd ..

 
