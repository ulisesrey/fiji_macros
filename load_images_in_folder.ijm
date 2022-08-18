//Ulises Rey Zimmer Lab 2022



//Select Directory of image and label (mask)
path = getDirectory("Choose the image Directory");
filename = getFileList(path);
print(path);
//Sort files
Array.sort(filename);

path2 = getDirectory("Select the label Directory");
filename2 = getFileList(path2);
print(path2);
//Sort files
Array.sort(filename2);


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
        open(path2+filename2[i]);
        run("Merge Channels...", "c1="+filename[i] + " c2="+filename2[i] + " create");
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