source ${FPGADir}/${project}/tcl/config.tcl

create_project $project ${FPGADir}/${project}/VivadoProject -part $part -force

add_files [glob ${FPGADir}/${project}/rtl/*.v]

set_property top $top [current_fileset]
#set_property file_type SystemVerilog [get_files [glob ${FPGADir}/${project}/rtl/*.v]]
update_compile_order -fileset sources_1

add_files -fileset constrs_1 [glob ${FPGADir}/${project}/*.xdc]
#add_files -fileset sim_1 -norecurse ${project}/${top}.v
#set_property top ${top} [get_filesets sim_1]

set_property STEPS.SYNTH_DESIGN.ARGS.FLATTEN_HIERARCHY full [get_runs synth_1]
set_property STEPS.SYNTH_DESIGN.ARGS.RESOURCE_SHARING auto [get_runs synth_1]
set_property STEPS.SYNTH_DESIGN.ARGS.FSM_EXTRACTION one_hot [get_runs synth_1]
set_property STEPS.SYNTH_DESIGN.ARGS.NO_LC false [get_runs synth_1]
set_property STEPS.SYNTH_DESIGN.ARGS.DIRECTIVE AreaOptimized_medium [get_runs synth_1]
set_property STEPS.SYNTH_DESIGN.ARGS.CONTROL_SET_OPT_THRESHOLD 16 [get_runs synth_1]
set_property STEPS.SYNTH_DESIGN.ARGS.FANOUT_LIMIT 16 [get_runs synth_1]
set_property STEPS.SYNTH_DESIGN.ARGS.KEEP_EQUIVALENT_REGISTERS true [get_runs synth_1]


set_property STEPS.OPT_DESIGN.ARGS.DIRECTIVE Default [get_runs impl_1]
set_property -name {STEPS.OPT_DESIGN.ARGS.MORE OPTIONS} -value {-retarget -propconst -sweep -muxf_remap -carry_remap -control_set_merge -merge_equivalent_drivers -bufg_opt -shift_register_opt -remap} -objects [get_runs impl_1]
set_property STEPS.PLACE_DESIGN.ARGS.DIRECTIVE ExtraTimingOpt [get_runs impl_1]
set_property STEPS.PHYS_OPT_DESIGN.ARGS.DIRECTIVE Default [get_runs impl_1]
set_property -name {STEPS.PHYS_OPT_DESIGN.ARGS.MORE OPTIONS} -value {-fanout_opt -placement_opt -slr_crossing_opt -rewire -insert_negative_edge_ffs -critical_cell_opt -shift_register_opt -hold_fix -retime -critical_pin_opt} -objects [get_runs impl_1]
set_property STEPS.ROUTE_DESIGN.ARGS.DIRECTIVE NoTimingRelaxation [get_runs impl_1]
set_property -name {STEPS.ROUTE_DESIGN.ARGS.MORE OPTIONS} -value {-tns_cleanup} -objects [get_runs impl_1]
set_property STEPS.POST_ROUTE_PHYS_OPT_DESIGN.IS_ENABLED true [get_runs impl_1]
set_property STEPS.POST_ROUTE_PHYS_OPT_DESIGN.ARGS.DIRECTIVE Default [get_runs impl_1]
set_property -name {STEPS.POST_ROUTE_PHYS_OPT_DESIGN.ARGS.MORE OPTIONS} -value {-placement_opt -routing_opt -rewire -critical_cell_opt -retime -slr_crossing_opt -clock_opt} -objects [get_runs impl_1]

update_compile_order
