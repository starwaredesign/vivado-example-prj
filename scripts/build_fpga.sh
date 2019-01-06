#!/usr/bin/env bash
source /home/vivado/.profile 
vivado -mode batch -source scripts/recreate_prj.tcl 
vivado -mode batch -source scripts/build_bitstream.tcl 
 
