
########################### Define Top Module ############################
                                                   
set top_module Topmodule

##################### Define Working Library Directory ######################
                                                   
define_design_lib work -path ./work

######################################### set svf file
set_svf Topmodule.svf
################## Design Compiler Library Files #setup ######################

lappend search_path /home/IC/lab_dc/std_cells
lappend search_path /home/IC/lab_dc/rtl

set SSLIB "/home/IC/Labs/lab_dc/std_cells/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/IC/Labs/lab_dc/std_cells/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/IC/Labs/lab_dc/std_cells/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

## Standard Cell libraries 
set target_library [list $SSLIB $TTLIB $FFLIB]

## Standard Cell & Hard Macros libraries 
set link_library [list * $SSLIB $TTLIB $FFLIB]  

#echo "###############################################"
#echo "############# Reading RTL Files  ##############"
#echo "###############################################"

#alu File
set file_format verilog
read_file -format $file_format Topmodule.v

###################### Defining toplevel ###################################

current_design $top_module

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## Liniking All The Design Parts ########"
puts "###############################################"

link 

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## checking design consistency ##########"
puts "###############################################"

check_design

############################### Path groups ################################
puts "###############################################"
puts "################ Path groups ##################"
puts "###############################################"

group_path -name INREG -from [all_inputs]
group_path -name REGOUT -to [all_outputs]
group_path -name INOUT -from [all_inputs] -to [all_outputs]

#################### Define Design Constraints #########################
puts "###############################################"
puts "############ Design Constraints #### ##########"
puts "###############################################"

source -echo ./cons.tcl

###################### Mapping and optimization ########################
puts "###############################################"
puts "########## Mapping & Optimization #############"
puts "###############################################"

compile -map_effort high
set_svf -off
#############################################################################
# Write out Design after initial compile
#############################################################################
write_file -format verilog -hierarchy -output netlists/Topmodule_netlist.v
write_file -format ddc     -hierarchy -output netlists/Topmodule_netlist.ddc
write_sdc -nosplit SDC/Topmodule.sdc
write_sdf SDF/Topmodule.sdf
################# reporting #######################
report_area -hierarchy > reports/area.rpt
report_power -hierarchy > reports/power.rpt
report_timing -max_paths 100 -delay_type max > reports/setup.rpt
report_timing -max_paths 100 -delay_type min > reports/hold.rpt
report_clock -attributes > reports/clocks.rpt
report_constraint -all_violators > reports/constraints.rpt
################# starting graphical user interface #######################

gui_start
