//Ulises Rey Zimmer Lab 2022
// helper script to annotate masks to generate training data for unet segmentation of coiled shapes

two_folders=true
annotate=false

//Select Directory of image and label (mask)
path = getDirectory("Choose the image Directory");
filename = getFileList(path);
print(path);
//Sort files
Array.sort(filename);


//if second folder uncomment code below
if (two_folders){
path2 = getDirectory("Select the label Directory");
filename2 = getFileList(path2);
print(path2);
//Sort files
Array.sort(filename2);
}


//Close any file
close("*");
//deselect any ROI
roiManager("deselect")
//Set bacth mode
setBatchMode(false);
//var done = false
for (i=0; i<filename.length; i++) {
		//if (i<139){
		//	print("ATTENTION, SKIPPING SOME FRAMES");
		//	continue;}

		//some printing
		print(i);
		print(filename[i]);

		//Open file
        open(path+filename[i]);
        // set image location
        setLocation(100, 200, 500, 400);

        
        //if two folders
        if (two_folders){
        open(path2+filename2[i]);
        
        // set image location
        setLocation(100, 600, 500, 400);
        
        //get title of filename2 in case it is repeated
        filename2_new=getTitle();
        run("Merge Channels...", "c6="+filename[i] + " c2="+filename2_new + " create keep");
        }
        //end of if two folders
        
        //run("In [+]");
		//run("In [+]");
		//run("In [+]");
		run("In [+]");
		//run("In [+]");
		//run("In [+]");
        waitForUser("Select a roi", "~");
		if (annotate){
        //roiManager("Select", i);

        roiManager("Add");
        roiManager("Select", i);
        roiManager("rename", filename[i])
		}
        close("*");
        


}