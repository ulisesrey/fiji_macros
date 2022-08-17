//Ulises Rey Zimmer Lab 2022
//This script loops through the images in a folder and through the ROIs in the ROI manager and allows to delete non matching ROIs

deleted_rois_counter=0;

//Select Directory
path = getDirectory("Choose a Directory");
filename = getFileList(path);

//print(path);

//Sort files
Array.sort(filename);
//Close any file
close("*");
//deselect any ROI
roiManager("deselect")
//Set bacth mode
setBatchMode(false);
//var done = false
print("now entering the loop")
for (i=0; i<filename.length; i++) {
		if (i<13){ continue;}

		//some printing
		print(i);
		print(filename[i]);

		//Open file
        open(path+filename[i]);
        run("In [+]");
		run("In [+]");
		run("In [+]");
		roi_index=i+deleted_rois_counter;
		print(roi_index);
        roiManager("Select", roi_index);
        roiManager("rename", filename[i])

        roiManager("Add");
        //waitForUser("Select a roi", "~");
        Dialog.create("Reorganize ROIs")

		Dialog.addCheckbox("Delete Current Roi", false)
		Dialog.show();
		choice =  Dialog.getCheckbox();
		
		if (choice==1){
			print("Current Roi will be deleted");
			roiManager("delete");
			deleted_rois_counter=deleted_rois_counter+1;
			roi_index=i+deleted_rois_counter;
			print(roi_index);
        	roiManager("Select", roi_index);
	        roiManager("rename", filename[i])
		}
		waitForUser("Check things", "~");
        //close("*");
        //print("image closed");
        


}


