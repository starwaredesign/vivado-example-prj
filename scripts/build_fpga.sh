#!/usr/bin/env bash
#su vivado -c '\
#source ~/.profile \
#env && \
#pwd && \
#vivado -mode batch -source recreate_prj.tcl && \
#vivado -mode batch -source build_bitstream.tcl \
#'
source /home/vivado/.profile 
env
pwd
cd scripts
vivado -mode batch -source recreate_prj.tcl 
vivado -mode batch -source build_bitstream.tcl 
cd ..

 
