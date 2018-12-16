#!/bin/bash 
su - vivado -c '\
#echo "echo \"executing bashrc\"" >> /home/vivado/.bashrc \
whoami && cat ~/.bashrc && source ~/.bashrc && env && echo $PATH \ 
vivado -mode batch -source recreate_prj.tcl \
vivado -mode batch -source build_bitstream.tcl \
'
 
