set ncpu [exec nproc]
set project_file [glob -directory vivado *.xpr]
open_project ${project_file}
launch_runs impl_1 -to_step write_bitstream -jobs ${ncpu}
wait_on_run impl_1
namespace import ::tclapp::xilinx::designutils::report_failfast
open_run [current_run -implementation -quiet]
report_failfast -csv -transpose -no_header -file utilisation.csv
close_design
