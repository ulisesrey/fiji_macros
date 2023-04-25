#This script aims to run the macro roi_series_analyzer within python to be able to run it per folder.
# based on PReSens_Script.py

from ij import IJ

import os
import glob

# from natsort import natsorted


function open_roiset(path_to_roiset){
    open(path_to_roiset);
    roiManager("Add");
}

function open_stack(project_path, channel_extension){
    if (endsWith(path_to_green_channel, channel_extension)){
    print("you selected the green channel");
    open(path_to_green_channel);
}

open_project = """
print('macro is running')
path = getDirectory("Choose a Directory");
filename = getFileList(path);


//Loop over the files Open the important files: ROI, green and red channels

for (i=0; i<filename.length; i++) {
		//some printing
		print(i);
		print(filename[i]);

		// open ROI
		if (endsWith(filename[i], "roi")){
			print("you selected the roi");
			open(filename[i]);
			roiManager("Add");
			}
		// OPEN GREEN Channel
		if (endsWith(filename[i], "green.tiff")){
			print("you selected the green channel");
			open(filename[i]);
			}
		// OPEN Red Channel
		if (endsWith(filename[i], "red.tiff")){
			print("you selected the red channel");
			open(filename[i]);
			}

		}

// DO THE ACTION
// FOR THE GREEN CHANNEL
selectWindow("Stack_green.tiff");
roiManager("Select", 0);

for (n=1; n<=nSlices; n++){
	setSlice(n);

	getStatistics(area, mean);
	setResult("roi 1", n-1, mean);
	//updateResults();

	run("Next Slice [>]");
	}
saveAs("Results", path + "Results_green.csv");
run("Clear Results");

// FOR THE RED CHANNEL
selectWindow("Stack_red.tiff");
roiManager("Select", 0);

for (n=1; n<=nSlices; n++){
	setSlice(n);

	getStatistics(area, mean);
	setResult("roi 1", n-1, mean);
	//updateResults();

	run("Next Slice [>]");
	}
saveAs("Results", path + "Results_red.csv");
run("Clear Results");


// CLOSE THINGS
// close images
close("*")
// close ROI
selectWindow("ROI Manager");
run("Close");
"""

# project_path_list='/Users/ulises.rey/local_data/tests/*/*'
project_path_list = '/Volumes/scratch/zimmer/Tanja/project_food_aversion/sensing_foils/measurements/CO2/*/*/'
project_list = glob.glob(project_path_list)

print(project_list)
print(len(project_list))

# roiManager("open", file-path)

for idx, experiment in enumerate(project_list):
    print(idx, experiment)
    IJ.runMacro(open_project)
print('end')


