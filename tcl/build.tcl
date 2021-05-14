source [pwd]/tcl/config.tcl
source [pwd]/tcl/project.tcl

# Synthesis
source [pwd]/tcl/mkip.tcl
source [pwd]/tcl/genip.tcl
launch_run synth_1 -jobs 8
wait_on_run synth_1

open_run synth_1
report_utilization -file ${FPGADir}/${project}/VivadoProject/PostSynthUtilization.rpt
report_utilization -hierarchical -hierarchical_depth 15 -file ${FPGADir}/${project}/VivadoProject/PostSynthHierarchialUtilization.rpt

# Implementation
launch_run impl_1 -jobs 8
wait_on_run impl_1

launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1

source [pwd]/tcl/report.tcl
