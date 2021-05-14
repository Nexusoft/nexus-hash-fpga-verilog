source ${FPGADir}/${project}/tcl/config.tcl

create_ip -name clk_wiz -vendor xilinx.com -library ip -version 6.0 -module_name MMCM600
set_property -dict [list CONFIG.Component_Name {MMCM600} CONFIG.JITTER_SEL {Min_O_Jitter} CONFIG.PRIM_SOURCE {Differential_clock_capable_pin} CONFIG.PRIM_IN_FREQ {200.000} CONFIG.CLKIN1_UI_JITTER {0.001} CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {600.000} CONFIG.USE_LOCKED {false} CONFIG.USE_RESET {false} CONFIG.CLKIN1_JITTER_PS {5.0} CONFIG.MMCM_DIVCLK_DIVIDE {1} CONFIG.MMCM_BANDWIDTH {HIGH} CONFIG.MMCM_CLKFBOUT_MULT_F {7.875} CONFIG.MMCM_CLKIN1_PERIOD {5.000} CONFIG.MMCM_CLKIN2_PERIOD {10.0} CONFIG.MMCM_REF_JITTER1 {0.001} CONFIG.MMCM_CLKOUT0_DIVIDE_F {2.625} CONFIG.CLKOUT1_JITTER {65.353} CONFIG.CLKOUT1_PHASE_ERROR {71.120}] [get_ips MMCM600]
generate_target {instantiation_template} [get_files ${FPGADir}/${project}/VivadoProject/NXSMinerCLI.srcs/sources_1/ip/MMCM600/MMCM600.xci]
catch { config_ip_cache -export [get_ips -all MMCM600] }
export_ip_user_files -of_objects [get_files ${FPGADir}/${project}/VivadoProject/NXSMinerCLI.srcs/sources_1/ip/MMCM600/MMCM600.xci] -no_script -sync -force -quiet
