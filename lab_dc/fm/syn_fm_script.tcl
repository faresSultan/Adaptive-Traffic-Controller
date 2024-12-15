
############################  Search PATH ################################
set PROJECT_PATH /home/IC/Labs

lappend search_path $PROJECT_PATH/lab_dc/std_cells
lappend search_path $PROJECT_PATH/lab_dc/rtl
lappend search_path $PROJECT_PATH/lab_dc/syn
lappend search_path $PROJECT_PATH/lab_dc/syn/netlists

########################### Define Top Module ############################
                                                   
set top_module Topmodule

######################### Formality Setup File ###########################

set synopsys_auto_setup true

set_svf "../syn/$top_module.svf"

####################### Read Reference tech libs ########################
 

set SSLIB "/home/IC/Labs/lab_dc/std_cells/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/IC/Labs/lab_dc/std_cells/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/IC/Labs/lab_dc/std_cells/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

read_db -container Ref [list $SSLIB $TTLIB $FFLIB]

###################  Read Reference Design Files ######################## 
read_verilog -container Ref "Topmodule.v"

######################## set the top Reference Design ######################## 

set_reference_design Topmodule
set_top Topmodule

####################### Read Implementation tech libs ######################## 

read_db -container Imp [list $SSLIB $TTLIB $FFLIB]

#################### Read Implementation Design Files ######################## 

read_verilog -container Imp -netlist "Topmodule_netlist.v"

####################  set the top Implementation Design ######################

set_implementation_design Topmodule
set_top Topmodule


## matching Compare points
if {[match]} {
	echo "Matching Succeed"
}

## verify
set successful [verify]
if {!$successful} {
diagnose
analyze_points -failing
}

report_passing_points > "reports/passing_points.rpt"
report_failing_points > "reports/failing_points.rpt"
report_aborted_points > "reports/aborted_points.rpt"
report_unverified_points > "reports/unverified_points.rpt"


start_gui

