macro "Do things to Series Action Tool- C555T1d13BT9d13"{
setSlice(1);
for (n=0; n<nSlices; n++){
run("Measure");
run("Next Slice [>]");

}
}

macro "Do things to ROIs Action Tool- C555T1d13BT9d13"{

for (n=0; n<(roiManager("count")); n++){
roiManager("Select", n);
run("Measure");

}

macro "Do things for Directory - C555T1d13BT9d13"{
//improve to do it in every channel

path = getDirectory("Choose a Directory");
filename = getFileList(path);
newDir = path + "Measurements" + File.separator;
File.makeDirectory(newDir);

setBatchMode(true);

for (i=0; i<filename.length; i++) {

        open(path+filename[i]);
        //run("Gaussian Blur...", "sigma=1");
        //saveAs("tiff", newDir + "Result of " + filename[i]);
        //close();
        //selectWindow("ROI Manager");

		roiManager("select", i);
		run("Make Inverse");
        run("Measure");
        //close();
}

//selectWindow("Results");
//saveAs("Measurements", newDir + "Measurements"+".xls");
//run("Close");