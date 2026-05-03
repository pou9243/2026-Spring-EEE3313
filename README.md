This repository is created to manage the Vivado project files and Tcl scripts that were used during the EEE3313 - Digital Circuit and Logic Design Labs course.

----
Each project directory has the same basic structure: 

**scripts** directory where Tcl script file is located to import the project to Vivado,

**src** directory where all the design source files are located,

**tb** directory where all the testbench source files are located,

(FPGA project only) **xdc** directory where all the constraints files are located.

----
To import the project to your own Vivado environment, please follow the instructions below.

1. `git clone` the repository to your desired location. 
2. Create 'work' directory under the project directory you wish to import.
3. Open Vivado, move to 'work' directory you've just created in your Vivado Tcl console.
4. Run the command `source ../scripts/your_desired_Tcl_script.tcl` in your Vivado Tcl console.

----
To export your own Vivado project to Tcl script, run the command below in your Vivado Tcl console.

`write_project_tcl -force /your/desired/path/your_Tcl_script_name.tcl`

---- 
All the Vivado projects and Tcl script files were created using Vivado 2020.2 version. Whether the projects run well on other Vivado versions is not tested.

----
If you have any copyright concerns regarding the code in this repository, please contact me at parkonyou9243@yonsei.ac.kr.
