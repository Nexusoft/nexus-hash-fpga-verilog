source ${FPGADir}/${project}/tcl/config.tcl

create_ip_run [get_files -of_objects [get_fileset sources_1] ${FPGADir}/${project}/VivadoProject/NXSMinerCLI.srcs/sources_1/ip/MMCM600/MMCM600.xci]
launch_runs -jobs 10 MMCM600_synth_1
