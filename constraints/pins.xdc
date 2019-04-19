set_property PACKAGE_PIN AB6 [get_ports {board_rev[0]}];  
set_property PACKAGE_PIN AB7 [get_ports {board_rev[1]}];  
set_property PACKAGE_PIN AA4 [get_ports {board_rev[2]}]; 
set_property PACKAGE_PIN Y4 [get_ports {board_rev[3]}]; 
set_property PACKAGE_PIN T6 [get_ports {board_type[0]}];   
set_property PACKAGE_PIN R6 [get_ports {board_type[1]}];   
set_property PACKAGE_PIN U4 [get_ports {board_type[2]}];   
set_property PACKAGE_PIN T4 [get_ports {board_type[3]}]; 

set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 13]];
set_property PULLDOWN TRUE [get_nets board_rev[*]];
set_property PULLDOWN TRUE [get_nets board_type[*]];
