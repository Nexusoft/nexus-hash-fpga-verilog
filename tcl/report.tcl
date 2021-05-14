source ${FPGADir}/${project}/tcl/config.tcl

open_run impl_1
report_utilization -file ${FPGADir}/${project}/VivadoProject/PostBuildUtilization.rpt
report_utilization -hierarchical -hierarchical_depth 15 -file ${FPGADir}/${project}/VivadoProject/PostBuildHierarchialUtilization.rpt
report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose -max_paths 1000 -nworst 25 -input_pins -routable_nets -file ${FPGADir}/${project}/VivadoProject/PostBuildTimingSummary.rpt
