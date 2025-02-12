###################################################################

# Created by write_sdc on Mon Dec 16 03:03:19 2024

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -max_library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -min scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c -min_library scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c
set_wire_load_model -name tsmc13_wl10 -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports rst_n]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {Sa[1]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {Sa[0]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {Sb[1]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {Sb[0]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {Sc[1]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {Sc[0]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {Sd[1]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {Sd[0]}]
set_load -pin_load 0.5 [get_ports {Ta[2]}]
set_load -pin_load 0.5 [get_ports {Ta[1]}]
set_load -pin_load 0.5 [get_ports {Ta[0]}]
set_load -pin_load 0.5 [get_ports {Tb[2]}]
set_load -pin_load 0.5 [get_ports {Tb[1]}]
set_load -pin_load 0.5 [get_ports {Tb[0]}]
set_load -pin_load 0.5 [get_ports {Tc[2]}]
set_load -pin_load 0.5 [get_ports {Tc[1]}]
set_load -pin_load 0.5 [get_ports {Tc[0]}]
set_load -pin_load 0.5 [get_ports {Td[2]}]
set_load -pin_load 0.5 [get_ports {Td[1]}]
set_load -pin_load 0.5 [get_ports {Td[0]}]
create_clock [get_ports clk]  -name TRAFFIC_CONTROLLER_CLK  -period 100  -waveform {0 50}
set_clock_latency 0  [get_clocks TRAFFIC_CONTROLLER_CLK]
set_clock_uncertainty -setup 0.25  [get_clocks TRAFFIC_CONTROLLER_CLK]
set_clock_uncertainty -hold 0.05  [get_clocks TRAFFIC_CONTROLLER_CLK]
set_clock_transition -max -rise 0.1 [get_clocks TRAFFIC_CONTROLLER_CLK]
set_clock_transition -min -rise 0.1 [get_clocks TRAFFIC_CONTROLLER_CLK]
set_clock_transition -max -fall 0.1 [get_clocks TRAFFIC_CONTROLLER_CLK]
set_clock_transition -min -fall 0.1 [get_clocks TRAFFIC_CONTROLLER_CLK]
group_path -name INOUT  -from [list [get_ports clk] [get_ports rst_n] [get_ports {Sa[1]}] [get_ports {Sa[0]}] [get_ports {Sb[1]}] [get_ports {Sb[0]}] [get_ports {Sc[1]}] [get_ports {Sc[0]}] [get_ports {Sd[1]}] [get_ports {Sd[0]}]]  -to [list [get_ports {Ta[2]}] [get_ports {Ta[1]}] [get_ports {Ta[0]}] [get_ports {Tb[2]}] [get_ports {Tb[1]}] [get_ports {Tb[0]}] [get_ports {Tc[2]}] [get_ports {Tc[1]}] [get_ports {Tc[0]}] [get_ports {Td[2]}] [get_ports {Td[1]}] [get_ports {Td[0]}]]
group_path -name INREG  -from [list [get_ports clk] [get_ports rst_n] [get_ports {Sa[1]}] [get_ports {Sa[0]}] [get_ports {Sb[1]}] [get_ports {Sb[0]}] [get_ports {Sc[1]}] [get_ports {Sc[0]}] [get_ports {Sd[1]}] [get_ports {Sd[0]}]]
group_path -name REGOUT  -to [list [get_ports {Ta[2]}] [get_ports {Ta[1]}] [get_ports {Ta[0]}] [get_ports {Tb[2]}] [get_ports {Tb[1]}] [get_ports {Tb[0]}] [get_ports {Tc[2]}] [get_ports {Tc[1]}] [get_ports {Tc[0]}] [get_ports {Td[2]}] [get_ports {Td[1]}] [get_ports {Td[0]}]]
set_input_delay -clock TRAFFIC_CONTROLLER_CLK  30  [get_ports rst_n]
set_input_delay -clock TRAFFIC_CONTROLLER_CLK  30  [get_ports {Sa[1]}]
set_input_delay -clock TRAFFIC_CONTROLLER_CLK  30  [get_ports {Sa[0]}]
set_input_delay -clock TRAFFIC_CONTROLLER_CLK  30  [get_ports {Sb[1]}]
set_input_delay -clock TRAFFIC_CONTROLLER_CLK  30  [get_ports {Sb[0]}]
set_input_delay -clock TRAFFIC_CONTROLLER_CLK  30  [get_ports {Sc[1]}]
set_input_delay -clock TRAFFIC_CONTROLLER_CLK  30  [get_ports {Sc[0]}]
set_input_delay -clock TRAFFIC_CONTROLLER_CLK  30  [get_ports {Sd[1]}]
set_input_delay -clock TRAFFIC_CONTROLLER_CLK  30  [get_ports {Sd[0]}]
set_output_delay -clock TRAFFIC_CONTROLLER_CLK  30  [get_ports {Ta[2]}]
set_output_delay -clock TRAFFIC_CONTROLLER_CLK  30  [get_ports {Ta[1]}]
set_output_delay -clock TRAFFIC_CONTROLLER_CLK  30  [get_ports {Ta[0]}]
set_output_delay -clock TRAFFIC_CONTROLLER_CLK  30  [get_ports {Tb[2]}]
set_output_delay -clock TRAFFIC_CONTROLLER_CLK  30  [get_ports {Tb[1]}]
set_output_delay -clock TRAFFIC_CONTROLLER_CLK  30  [get_ports {Tb[0]}]
set_output_delay -clock TRAFFIC_CONTROLLER_CLK  30  [get_ports {Tc[2]}]
set_output_delay -clock TRAFFIC_CONTROLLER_CLK  30  [get_ports {Tc[1]}]
set_output_delay -clock TRAFFIC_CONTROLLER_CLK  30  [get_ports {Tc[0]}]
set_output_delay -clock TRAFFIC_CONTROLLER_CLK  30  [get_ports {Td[2]}]
set_output_delay -clock TRAFFIC_CONTROLLER_CLK  30  [get_ports {Td[1]}]
set_output_delay -clock TRAFFIC_CONTROLLER_CLK  30  [get_ports {Td[0]}]
