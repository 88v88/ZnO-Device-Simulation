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

## Running Sentaurus Remotely
1. Sentaurus simulations may take hours and can be run while logged out of SSH using tmux. To create a tmux session:
`$ tmux new -s my_session`
Or to create a default tmux session with number 0, simply:
`$ tmux`
3. You are now inside the tmux session, run Sentaurus, for example, `sptopo3d` then kill the process with `Ctrl+C`:
`$ sptopo3d`
`$ ^C`
4. Create new Andrew File System (AFS) tokens that will not be destroyed when logged out, allowing Sentaurus to access your script remotely. To do so, enter your password in `kinit` then `aklog`. 
`$ kinit`
`$ aklog`
5. Navigate to and run your script. Use multithreading to make some simulation steps faster.
`$ sptopo3d --threads 24 my_script.tcl`
6. To detach from the session, type `Ctrl^B` then `d`. You can log out while the tmux session continues to run Sentaurus.
8. When you log back into the machine to check on your simulation, attach to your tmux session:
`$ tmux attach -t my_session`
9. If you want to kill your tmux session, type `Ctrl^B`, then `:`, then `kill-session`.

## Sentaurus Workbench
1. Run `swb` in your project directory:
`$ swb`
2. When prompted to *Choose STDB Directory,* enter your full project directory into *Selection*.
<img width="380" alt="image" src="https://github.com/user-attachments/assets/35b0126d-e6fc-4fa9-8234-5506dd916718">

3. Create a new project in the directory. For example, navigate to the menu on the top toolbar **Project > New > Traditional Project**.
4. Save the project through the menu **Project > Save** and enter the name of the project directory followed by the project name into *Selection* then click *OK*. This specific project will be stored in the new directory. Example: `/afs/andrew.cmu.edu/usr20/andrew/my_projects/this_project`
<img width="282" alt="image" src="https://github.com/user-attachments/assets/c20b8170-8f1f-465c-af76-2da755843e3e">

5. Under the *Project* tab, the first row of the spreadsheet shows *No Tools*. Right click on *No Tools* and click *Add* to add a tool, which brings up the *Add Tool* window.
<img width="572" alt="image" src="https://github.com/user-attachments/assets/a0e92e31-d8ab-41e3-8fc5-4e494d0d9e07">

6. Under the dropdown menu *Name*, choose a tool such as `sprocess` for Sentaurus Process or `sptopo3d` for Sentaurus Topography 3D. Modify the input and output file names and parallelization settings if desired. 
7. Click *OK*, then save the project to add the input and output files which are stored inside your project directory.
8. Navigate to your project directory and edit the input files pertaining to your specific simulation, especially the `.cmd` file that defines the simulation setup and steps.
9. Run the simulation. For example, use the menu **Project > Operations > Run**. While the project is running, the standard output is written to the output file with the extension `.out` which includes errors and estimated remaining time until completion. 
<img width="341" alt="image" src="https://github.com/user-attachments/assets/316ba5e0-c028-4884-8a38-2893c9e4c44a">

10. Add variables by right clicking the spreadsheet at the top bar, and add parameter sweeps through the menu **Parameter > Add Parameters/Values** and entering a variable name and space-delimited values. 
<img width="475" alt="image" src="https://github.com/user-attachments/assets/7dbcd5e4-b243-439b-be77-9dd9850fbcea">


## Sentaurus Visual
1. After running your simulation, run `svisual` to visualize the results using Sentaurus Visual:
`svisual`
2. Through the menu **File > Open**, navigate to your project directory and select the output file with the `.tdr` extension. From there on, plots can be edited and saved.
3. To hide plots temporarily, unselect the plot from the checklist at the bottom of the menu **Window**. To remove a plot and its corresponding data from Sentaurus Visual, go to **Data > View Info Loaded**, select the datasets from the list *Datasets*, then click *Remove*.
