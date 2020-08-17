run("Set Measurements...", "  redirect=None decimal=5");

video_name="worm11_w2dual2-GFP-mCherry-SD-DV--488Ex--561Ex_t55_10fps"

//this creates the output directory where the images will be saved.
//after the macro runs copy them into labeled data
DIR_PATH=getDirectory("Select a directory");
OUTPUT_DIR = DIR_PATH + "/" + "DLC-FIJI-OUTPUT-FOLDER";
File.makeDirectory(OUTPUT_DIR);

for (i=0; i< nResults; i++){

slice=getResult("Slice", i)-1;

if (slice<10){
	slice="00"+slice;
	}else if (slice<100){
	slice="0"+slice;
	}
	
filename="img"+slice+".png";
setResult("coords", i,  "labeled-data/" +video_name+"/"+filename);

//This part   saves the SLice as PNG in the output directyory
slice_n=getResult("Slice", i);
setSlice(slice_n);
saveAs("PNG", OUTPUT_DIR+ "/" +filename);

}
selectWindow("Results")
saveAs("Results", OUTPUT_DIR+ "/Results.csv");
