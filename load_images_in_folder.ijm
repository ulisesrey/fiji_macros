//Ulises Rey Zimmer Lab 2022



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
        //roiManager("Select", i);
        waitForUser("Select a roi", "~");
        roiManager("Add");
        roiManager("Select", i);
        roiManager("rename", filename[i])
        close("*");
        


}