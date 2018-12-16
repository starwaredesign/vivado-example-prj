#!/usr/bin/env bash
su - vivado -c '\
pwd && \
vivado -mode batch -source recreate_prj.tcl && \
vivado -mode batch -source build_bitstream.tcl \
'
 
