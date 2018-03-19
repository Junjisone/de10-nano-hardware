# Copyright (c) 2016 Intel Corporation
# SPDX-License-Identifier: MIT

package require -exact qsys 15.1


# 
# module conduit_remap
# 
set_module_property DESCRIPTION "Remap one conduit role to another role."
set_module_property NAME conduit_remap
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP "Reset Components/Adapters"
set_module_property AUTHOR RSF
set_module_property DISPLAY_NAME conduit_remap
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE false
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false
set_module_property ELABORATION_CALLBACK elaborate


# 
# file sets
# 


# 
# parameters
# 
add_parameter INPUT_CONDUIT_ROLE STRING
set_parameter_property INPUT_CONDUIT_ROLE DEFAULT_VALUE "input"
set_parameter_property INPUT_CONDUIT_ROLE DISPLAY_NAME "Role of input_sig conduit"
set_parameter_property INPUT_CONDUIT_ROLE TYPE STRING
set_parameter_property INPUT_CONDUIT_ROLE UNITS None
set_parameter_property INPUT_CONDUIT_ROLE GROUP "Input Conduit"
set_parameter_property INPUT_CONDUIT_ROLE DESCRIPTION "Enter the role that you want to assign the input_sig conduit input."
set_parameter_property INPUT_CONDUIT_ROLE HDL_PARAMETER false
set_parameter_property INPUT_CONDUIT_ROLE AFFECTS_VALIDATION true
set_parameter_property INPUT_CONDUIT_ROLE AFFECTS_ELABORATION true

add_parameter OUTPUT_CONDUIT_ROLE STRING
set_parameter_property OUTPUT_CONDUIT_ROLE DEFAULT_VALUE "output"
set_parameter_property OUTPUT_CONDUIT_ROLE DISPLAY_NAME "Role of output_sig conduit"
set_parameter_property OUTPUT_CONDUIT_ROLE TYPE STRING
set_parameter_property OUTPUT_CONDUIT_ROLE UNITS None
set_parameter_property OUTPUT_CONDUIT_ROLE GROUP "Output Conduit"
set_parameter_property OUTPUT_CONDUIT_ROLE DESCRIPTION "Enter the role that you want to assign the output_sig conduit output."
set_parameter_property OUTPUT_CONDUIT_ROLE HDL_PARAMETER false
set_parameter_property OUTPUT_CONDUIT_ROLE AFFECTS_VALIDATION true
set_parameter_property OUTPUT_CONDUIT_ROLE AFFECTS_ELABORATION true


# 
# display items
# 


# 
# connection point input_conduit
# 
add_interface input_conduit conduit end
set_interface_property input_conduit associatedClock ""
set_interface_property input_conduit associatedReset ""
set_interface_property input_conduit ENABLED true
set_interface_property input_conduit EXPORT_OF ""
set_interface_property input_conduit PORT_NAME_MAP ""
set_interface_property input_conduit CMSIS_SVD_VARIABLES ""
set_interface_property input_conduit SVD_ADDRESS_GROUP ""

add_interface_port input_conduit input_sig input Input 1


# 
# connection point output_conduit
# 
add_interface output_conduit conduit end
set_interface_property output_conduit associatedClock ""
set_interface_property output_conduit associatedReset ""
set_interface_property output_conduit ENABLED true
set_interface_property output_conduit EXPORT_OF ""
set_interface_property output_conduit PORT_NAME_MAP ""
set_interface_property output_conduit CMSIS_SVD_VARIABLES ""
set_interface_property output_conduit SVD_ADDRESS_GROUP ""

add_interface_port output_conduit output_sig output Output 1
set_port_property output_sig DRIVEN_BY input_sig


proc elaborate {} {
	set_port_property input_sig ROLE [ get_parameter_value INPUT_CONDUIT_ROLE ]
	set_port_property output_sig ROLE [ get_parameter_value OUTPUT_CONDUIT_ROLE ]
}

