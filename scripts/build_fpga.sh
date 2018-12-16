#!/bin/bash 
su - vivado -c 'source ~/.bashrc && vivado -mode batch -source recreate_prj.tcl && vivado -mode batch -source build_bitstream.tcl'
