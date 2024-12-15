###################################################################

# Created by write_sdc on Thu Dec 12 03:57:15 2024

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -max_library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -min scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c -min_library scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c
set_wire_load_model -name tsmc13_wl10 -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports cin]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {a[1]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {a[0]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {b[1]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {b[0]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {alu_fun[1]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {alu_fun[0]}]
set_load -pin_load 0.5 [get_ports {out[2]}]
set_load -pin_load 0.5 [get_ports {out[1]}]
set_load -pin_load 0.5 [get_ports {out[0]}]
create_clock [get_ports clk]  -name ALU_CLK  -period 100  -waveform {0 50}
set_clock_latency 0  [get_clocks ALU_CLK]
set_clock_uncertainty -setup 0.25  [get_clocks ALU_CLK]
set_clock_uncertainty -hold 0.05  [get_clocks ALU_CLK]
set_clock_transition -max -rise 0.1 [get_clocks ALU_CLK]
set_clock_transition -min -rise 0.1 [get_clocks ALU_CLK]
set_clock_transition -max -fall 0.1 [get_clocks ALU_CLK]
set_clock_transition -min -fall 0.1 [get_clocks ALU_CLK]
group_path -name INOUT  -from [list [get_ports clk] [get_ports rst_n] [get_ports cin] [get_ports {a[1]}] [get_ports {a[0]}] [get_ports {b[1]}] [get_ports {b[0]}] [get_ports {alu_fun[1]}] [get_ports {alu_fun[0]}]]  -to [list [get_ports {out[2]}] [get_ports {out[1]}] [get_ports {out[0]}]]
group_path -name INREG  -from [list [get_ports clk] [get_ports rst_n] [get_ports cin] [get_ports {a[1]}] [get_ports {a[0]}] [get_ports {b[1]}] [get_ports {b[0]}] [get_ports {alu_fun[1]}] [get_ports {alu_fun[0]}]]
group_path -name REGOUT  -to [list [get_ports {out[2]}] [get_ports {out[1]}] [get_ports {out[0]}]]
set_input_delay -clock ALU_CLK  30  [get_ports cin]
set_input_delay -clock ALU_CLK  30  [get_ports {a[1]}]
set_input_delay -clock ALU_CLK  30  [get_ports {a[0]}]
set_input_delay -clock ALU_CLK  30  [get_ports {b[1]}]
set_input_delay -clock ALU_CLK  30  [get_ports {b[0]}]
set_input_delay -clock ALU_CLK  30  [get_ports {alu_fun[1]}]
set_input_delay -clock ALU_CLK  30  [get_ports {alu_fun[0]}]
set_output_delay -clock ALU_CLK  30  [get_ports {out[2]}]
set_output_delay -clock ALU_CLK  30  [get_ports {out[1]}]
set_output_delay -clock ALU_CLK  30  [get_ports {out[0]}]
