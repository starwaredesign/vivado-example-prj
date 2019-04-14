set_property PACKAGE_PIN F22 [get_ports {board_rev[0]}];  
set_property PACKAGE_PIN G22 [get_ports {board_rev[1]}];  
set_property PACKAGE_PIN H22 [get_ports {board_rev[2]}]; 
set_property PACKAGE_PIN F21 [get_ports {board_rev[3]}]; 
set_property PACKAGE_PIN H19 [get_ports {board_type[0]}];   
set_property PACKAGE_PIN H18 [get_ports {board_type[1]}];   
set_property PACKAGE_PIN H17 [get_ports {board_type[2]}];   
set_property PACKAGE_PIN M15 [get_ports {board_type[3]}]; 

set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 35]];
  
