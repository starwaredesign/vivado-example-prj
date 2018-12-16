#!/bin/bash 
#su vivado
cat ~/.bashrc && source ~/.bashrc && env && echo $PATH 
vivado -mode batch -source recreate_prj.tcl 
vivado -mode batch -source build_bitstream.tcl
exit 
