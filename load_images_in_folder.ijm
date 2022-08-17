//Ulises Rey Zimmer Lab 2021
//This script loops through the files in one directory and selects the i ROI from the ROI manager and Fills it.
//It is used in the context of preparing U-net training data.
//It overwrites the data!
//It could be adapted to do any other operation


//Select Directory
path = getDirectory("Choose a Directory");
filename = getFileList(path);

print(path);
//Sort files
Array.sort(filename);
//Close any file
close("*");
//deselect any ROI
roiManager("deselect")
//Set bacth mode
setBatchMode(false);
//var done = false
for (i=0; i<filename.length; i++) {
		//if (i<290){ continue;}

		//some printing
		print(i);
		print(filename[i]);

		//Open file
        open(path+filename[i]);
        run("In [+]");
		run("In [+]");
		run("In [+]");
        roiManager("Select", i);
        waitForUser("Select a roi", "~");
        roiManager("Add");
        close("*");
        


}