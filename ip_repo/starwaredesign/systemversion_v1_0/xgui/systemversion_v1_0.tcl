# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "C_BOARD_REV_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_BOARD_TYPE_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_VER_MAJ" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_VER_MIN" -parent ${Page_0}


}

proc update_PARAM_VALUE.C_BOARD_REV_WIDTH { PARAM_VALUE.C_BOARD_REV_WIDTH } {
	# Procedure called to update C_BOARD_REV_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BOARD_REV_WIDTH { PARAM_VALUE.C_BOARD_REV_WIDTH } {
	# Procedure called to validate C_BOARD_REV_WIDTH
	return true
}

proc update_PARAM_VALUE.C_BOARD_TYPE_WIDTH { PARAM_VALUE.C_BOARD_TYPE_WIDTH } {
	# Procedure called to update C_BOARD_TYPE_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BOARD_TYPE_WIDTH { PARAM_VALUE.C_BOARD_TYPE_WIDTH } {
	# Procedure called to validate C_BOARD_TYPE_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXI_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_ADDR_WIDTH } {
	# Procedure called to update C_S_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_S_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXI_DATA_WIDTH { PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to update C_S_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_DATA_WIDTH { PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_VER_BUILD { PARAM_VALUE.C_VER_BUILD } {
	# Procedure called to update C_VER_BUILD when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_VER_BUILD { PARAM_VALUE.C_VER_BUILD } {
	# Procedure called to validate C_VER_BUILD
	return true
}

proc update_PARAM_VALUE.C_VER_MAJ { PARAM_VALUE.C_VER_MAJ } {
	# Procedure called to update C_VER_MAJ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_VER_MAJ { PARAM_VALUE.C_VER_MAJ } {
	# Procedure called to validate C_VER_MAJ
	return true
}

proc update_PARAM_VALUE.C_VER_MIN { PARAM_VALUE.C_VER_MIN } {
	# Procedure called to update C_VER_MIN when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_VER_MIN { PARAM_VALUE.C_VER_MIN } {
	# Procedure called to validate C_VER_MIN
	return true
}


proc update_MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH PARAM_VALUE.C_S_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_VER_MAJ { MODELPARAM_VALUE.C_VER_MAJ PARAM_VALUE.C_VER_MAJ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_VER_MAJ}] ${MODELPARAM_VALUE.C_VER_MAJ}
}

proc update_MODELPARAM_VALUE.C_VER_MIN { MODELPARAM_VALUE.C_VER_MIN PARAM_VALUE.C_VER_MIN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_VER_MIN}] ${MODELPARAM_VALUE.C_VER_MIN}
}

proc update_MODELPARAM_VALUE.C_VER_BUILD { MODELPARAM_VALUE.C_VER_BUILD PARAM_VALUE.C_VER_BUILD } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_VER_BUILD}] ${MODELPARAM_VALUE.C_VER_BUILD}
}

proc update_MODELPARAM_VALUE.C_BOARD_TYPE_WIDTH { MODELPARAM_VALUE.C_BOARD_TYPE_WIDTH PARAM_VALUE.C_BOARD_TYPE_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BOARD_TYPE_WIDTH}] ${MODELPARAM_VALUE.C_BOARD_TYPE_WIDTH}
}

proc update_MODELPARAM_VALUE.C_BOARD_REV_WIDTH { MODELPARAM_VALUE.C_BOARD_REV_WIDTH PARAM_VALUE.C_BOARD_REV_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BOARD_REV_WIDTH}] ${MODELPARAM_VALUE.C_BOARD_REV_WIDTH}
}

