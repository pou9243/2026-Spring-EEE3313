# Check file required for this script exists
proc checkRequiredFiles { origin_dir} {
  set status true
  set files [list \
   "../src/decoder_2to4.v" \
   "../src/decoder_3to8.v" \
   "../src/encoder_BCD.v" \
   "../src/decoder_1to2.v" \
   "../src/encoder_2to1.v" \
   "../src/encoder_4to2.v" \
   "../src/encoder_8to3.v" \
   "../src/decoder_BCDto7SEG.v" \
   "../tb/decoder_3to8_tb.v" \
   "../tb/encoder_BCD_tb.v" \
   "../tb/encoder_8to3_tb.v" \
   "../tb/decoder_BCDto7SEG_tb.v" \
   "../tb/encoder_4to2_tb.v" \
   "../tb/decoder_2to4_tb.v" \
   "../tb/decoder_1to2_tb.v" \
   "../tb/encoder_2to1_tb.v" \
  ]
  foreach ifile $files {
    if { ![file isfile $ifile] } {
      puts " Could not find remote file $ifile "
      set status false
    }
  }

  return $status
}
# Set the reference directory for source file relative paths (by default the value is script directory path)
set origin_dir "."

# Use origin directory path location variable, if specified in the tcl shell
if { [info exists ::origin_dir_loc] } {
  set origin_dir $::origin_dir_loc
}

# Set the project name
set _xil_proj_name_ "encoder_decoder"

# Use project name variable, if specified in the tcl shell
if { [info exists ::user_project_name] } {
  set _xil_proj_name_ $::user_project_name
}

variable script_file
set script_file "encoder_decoder.tcl"

# Help information for this script
proc print_help {} {
  variable script_file
  puts "\nDescription:"
  puts "Recreate a Vivado project from this script. The created project will be"
  puts "functionally equivalent to the original project for which this script was"
  puts "generated. The script contains commands for creating a project, filesets,"
  puts "runs, adding/importing sources and setting properties on various objects.\n"
  puts "Syntax:"
  puts "$script_file"
  puts "$script_file -tclargs \[--origin_dir <path>\]"
  puts "$script_file -tclargs \[--project_name <name>\]"
  puts "$script_file -tclargs \[--help\]\n"
  puts "Usage:"
  puts "Name                   Description"
  puts "-------------------------------------------------------------------------"
  puts "\[--origin_dir <path>\]  Determine source file paths wrt this path. Default"
  puts "                       origin_dir path value is \".\", otherwise, the value"
  puts "                       that was set with the \"-paths_relative_to\" switch"
  puts "                       when this script was generated.\n"
  puts "\[--project_name <name>\] Create project with the specified name. Default"
  puts "                       name is the name of the project from where this"
  puts "                       script was generated.\n"
  puts "\[--help\]               Print help information for this script"
  puts "-------------------------------------------------------------------------\n"
  exit 0
}

if { $::argc > 0 } {
  for {set i 0} {$i < $::argc} {incr i} {
    set option [string trim [lindex $::argv $i]]
    switch -regexp -- $option {
      "--origin_dir"   { incr i; set origin_dir [lindex $::argv $i] }
      "--project_name" { incr i; set _xil_proj_name_ [lindex $::argv $i] }
      "--help"         { print_help }
      default {
        if { [regexp {^-} $option] } {
          puts "ERROR: Unknown option '$option' specified, please type '$script_file -tclargs --help' for usage info.\n"
          return 1
        }
      }
    }
  }
}

# Set the directory path for the original project from where this script was exported
set orig_proj_dir "[file normalize "$origin_dir/../work/encoder_decoder"]"

# Check for paths and files needed for project creation
set validate_required 1
if { $validate_required } {
  if { [checkRequiredFiles $origin_dir] } {
    puts "Tcl file $script_file is valid. All files required for project creation is accesable. "
  } else {
    puts "Required file(s) not found. Please ensure you are running this script from the 'work' directory. "
    return
  }
}

# Create project
create_project ${_xil_proj_name_} ./${_xil_proj_name_} -part xcvc1802-viva1596-1LHP-i-L

# Set the directory path for the new project
set proj_dir [get_property directory [current_project]]

# Set project properties
set obj [current_project]
set_property -name "default_lib" -value "xil_defaultlib" -objects $obj
set_property -name "enable_vhdl_2008" -value "1" -objects $obj
set_property -name "ip_cache_permissions" -value "read write" -objects $obj
set_property -name "ip_output_repo" -value "$proj_dir/${_xil_proj_name_}.cache/ip" -objects $obj
set_property -name "mem.enable_memory_map_generation" -value "1" -objects $obj
set_property -name "part" -value "xcvc1802-viva1596-1LHP-i-L" -objects $obj
set_property -name "sim.central_dir" -value "$proj_dir/${_xil_proj_name_}.ip_user_files" -objects $obj
set_property -name "sim.ip.auto_export_scripts" -value "1" -objects $obj
set_property -name "simulator_language" -value "Mixed" -objects $obj
set_property -name "webtalk.xsim_launch_sim" -value "45" -objects $obj

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Set 'sources_1' fileset object
set obj [get_filesets sources_1]
set files [list \
 [file normalize "${origin_dir}/../src/decoder_2to4.v"] \
 [file normalize "${origin_dir}/../src/decoder_3to8.v"] \
 [file normalize "${origin_dir}/../src/encoder_BCD.v"] \
 [file normalize "${origin_dir}/../src/decoder_1to2.v"] \
 [file normalize "${origin_dir}/../src/encoder_2to1.v"] \
 [file normalize "${origin_dir}/../src/encoder_4to2.v"] \
 [file normalize "${origin_dir}/../src/encoder_8to3.v"] \
 [file normalize "${origin_dir}/../src/decoder_BCDto7SEG.v"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sources_1' fileset file properties for remote files
# None

# Set 'sources_1' fileset file properties for local files
# None

# Set 'sources_1' fileset properties
set obj [get_filesets sources_1]
set_property -name "top" -value "decoder_3to8" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Set 'constrs_1' fileset object
set obj [get_filesets constrs_1]

# Empty (no sources present)

# Set 'constrs_1' fileset properties
set obj [get_filesets constrs_1]
set_property -name "target_part" -value "xcvc1802-viva1596-1LHP-i-L" -objects $obj

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -simset sim_1
}

# Set 'sim_1' fileset object
set obj [get_filesets sim_1]
set files [list \
 [file normalize "${origin_dir}/../tb/decoder_3to8_tb.v"] \
 [file normalize "${origin_dir}/../tb/encoder_BCD_tb.v"] \
 [file normalize "${origin_dir}/../tb/encoder_8to3_tb.v"] \
 [file normalize "${origin_dir}/../tb/decoder_BCDto7SEG_tb.v"] \
 [file normalize "${origin_dir}/../tb/encoder_4to2_tb.v"] \
 [file normalize "${origin_dir}/../tb/decoder_2to4_tb.v"] \
 [file normalize "${origin_dir}/../tb/decoder_1to2_tb.v"] \
 [file normalize "${origin_dir}/../tb/encoder_2to1_tb.v"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_1' fileset file properties for remote files
# None

# Set 'sim_1' fileset file properties for local files
# None

# Set 'sim_1' fileset properties
set obj [get_filesets sim_1]
set_property -name "hbs.configure_design_for_hier_access" -value "1" -objects $obj
set_property -name "top" -value "decoder_3to8_tb" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "xil_defaultlib" -objects $obj
