path = getDirectory("Choose a Directory");
filename = "MAX_worm111_w2conf-Cherry-GFP-C_t1138.stk - C=R.tif";
newDir = path + "Results" + File.separator;
File.makeDirectory(newDir);

measure=0;


var LOWER_T = 61;
var UPPER_T = 255;

//setBatchMode(true);D


process=0;

if (process==1){
run("Duplicate...", "duplicate");
run("8-bit");
run("Gaussian Blur...", "sigma=2 stack");
}

run("Duplicate...", "duplicate");
setSlice(1);


for (n=1; n<=nSlices; n++){
setSlice(n);
print(n+"\n");
setThreshold(LOWER_T, UPPER_T, "B&W");
run("Convert to Mask", "method=Default background=Dark only black");
setOption("BlackBackground", true);
run("Analyze Particles...", "size=30-10000 pixel show=Masks display clear include summarize add in_situ slice");
print("run analyze particles for " + n + "\n");
nRois=roiManager("count");
print("number of Rois is: " + nRois + "\n");
	if (roiManager("count")>0){
		
		roiManager("Select", newArray(0));
		run("Select All");
		
		if (roiManager("count")>1){
			print("entered");
			roiManager("Combine");
			roiManager("Deselect");
			roiManager("Delete");
			roiManager("Add");
		}
		roiManager("Select", 0);
		roiManager("rename",n+".zip")
		roiManager("save selected", newDir + filename + "_Roi" + n + ".zip")
	}else{
		makeOval(399, 233, 88, 88);
		roiManager("Add");
		roiManager("Select", 0);
		roiManager("rename",n+".zip")
		roiManager("save selected", newDir + filename + "_Roi" + n + ".zip")
	}
	
roiManager("Delete");	
run("Next Slice [>]");

}



//saveAs("tiff", newDir + "Result of " + filename);


if (measure==1){
i=0;
run("Clear Results");
for (i=0; i<=nSlices; i++){
	    selectWindow("ROI Manager");
		roiManager("select", i);
		run("Measure");

}
}
if (measure==1){
i=0;
run("Clear Results");
for (i=0; i<=nSlices; i++){
	    selectWindow("ROI Manager");
		roiManager("select", i);
		run("Make Inverse");
		run("Measure");

}
}
if (measure==1){
i=1;
run("Clear Results");
for (i=1; i<=nSlices; i++){
		
	    selectWindow("ROI Manager");
		roiManager("select", 0);
		setSlice(i);
		run("Measure");

}
}