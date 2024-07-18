# Using Sentaurus at CMU ECE
Here is a guide on using Sentaurus for process simulation on CMU ECE's machines.
## Setting up Sentaurus
1. Log into one of the CMU ECE machines. If you are logging in using SSH, make sure you have an X11 client, such as [XQuartz](www.xquartz.org) for Mac or [MobaXterm](https://mobaxterm.mobatek.net/) for Windows, installed in order to use the GUI of Sentaurus Workbench, Visual, etc.
There are 32 machines from ece000 to ece031 that you can log into. 
Example: `$ ssh -X andrew@ece007.ece.local.cmu.edu`
 
 2. Sentaurus is installed in the directory `/afs/ece.cmu.edu/support/synopsys/synopsys.release/T-Foundation/sentaurus/`. Add the `bin` directory of the latest version to your PATH variable. Add these commands to your `.bashrc` file to set the environmental variables upon login. Example:
 `$ export "PATH=$PATH:/afs/ece.cmu.edu/support/synopsys/synopsys.release/T-Foundation/sentaurus/T-2022.03-SP1/bin"`
 3. Export the license variable for Synopsys:
`$ export SNPSLMD_LICENSE_FILE="/afs/ece/support/synopsys/license.dat"`
4. Navigate to a directory where you will store your Sentaurus project(s). Note the full directory using `pwd`. Example:
`$ pwd`
`/afs/andrew.cmu.edu/usr20/andrew/my_projects`

## Sentaurus Workbench
1. Run `swb` in your project directory:
`$ swb`
2. When prompted to *Choose STDB Directory,* enter your full project directory into *Selection*.
3. Create a new project in the directory. For example, navigate to the menu on the top toolbar **Project > New > Traditional Project**.
4. Save the project through the menu **Project > Save** and enter the name of the project directory followed by the project name into *Selection* then click *OK*. This specific project will be stored in the new directory. Example: `/afs/andrew.cmu.edu/usr20/andrew/my_projects/this_project`
5. Under the *Project* tab, the first row of the spreadsheet shows *No Tools*. Right click on *No Tools* and click *Add* to add a tool, which brings up the *Add Tool* window.
6. Under the dropdown menu, choose a tool such as `sprocess` for Sentaurus Process or `sptopo3d` for Sentaurus Topography 3D. Modify the input and output file names and parallelization settings if desired. 
7. Click *OK*, then save the project to add the input and output files which are stored inside your project directory.
8. Navigate to your project directory and edit the input files pertaining to your specific simulation, especially the `.cmd` file that defines the simulation setup and steps.
9. Run the simulation. For example, use the menu **Project > Operations > Run**. While the project is running, the standard output is written to the output file with the extension `.out` which includes errors and estimated remaining time until completion. 
10. Add variables, parameters, and experiments by right clicking the spreadsheet under the *Project* tab so that several simulations using preset parameters can automatically be scheduled together.

## Sentaurus Visual
1. After running your simulation, run `svisual` to visualize the results using Sentaurus Visual:
`svisual`
2. Through the menu **File > Open**, navigate to your project directory and select the output file with the `.tdr` extension. From there on, plots can be edited and saved.
3. To hide plots temporarily, unselect the plot from the checklist at the bottom of the menu **Window**. To remove a plot and its corresponding data from Sentaurus Visual, go to **Data > View Info Loaded**, select the datasets from the list *Datasets*, then click *Remove*.
