run("Set Measurements...", "  redirect=None decimal=5");

video_name="2020-07-01_13-21-00_chemotaxisl_worm1-channel-0-bigtiff_binary_th20"

//this creates the output directory where the images will be saved.
//after the macro runs copy them into labeled data
DIR_PATH=getDirectory("Select a directory");
OUTPUT_DIR = DIR_PATH + "/" + video_name;
File.makeDirectory(OUTPUT_DIR);

for (i=0; i< nResults; i++){

slice=getResult("Slice", i)-1;
//this does not work always, depending on the max number of frames more zeros need to be added
//This should be improved. For the time being post correct with the DLC_useful_functions.ipynb, section Annotation Add Zeros.
//Make sure to modify the all the images filenames as well as Collected_Data.csv.
if (slice<10){
	slice="00"+slice;
	}else if (slice<100){
	slice="0"+slice;
	}
//filename="img"+slice+".png";
filename="img"+slice+".tif";
setResult("coords", i,  "labeled-data/" +video_name+"/"+filename);

//This part   saves the SLice as PNG in the output directyory
slice_n=getResult("Slice", i);
setSlice(slice_n);
//I needed to add this duplicate (and therefore then close()) because there is some problem with the tiff writer on my data
run("Duplicate...", "use");
saveAs("Tiff", OUTPUT_DIR+ "/" +filename); //PNG
close();
}
selectWindow("Results")
saveAs("Results", OUTPUT_DIR+ "/Results.csv");
