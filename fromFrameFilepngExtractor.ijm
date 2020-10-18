
//PNG Extractor

DIR_PATH=getDirectory("Select a directory");
OUTPUT_DIR = DIR_PATH + "/" + "results";
File.makeDirectory(OUTPUT_DIR);

frame_string=File.openAsString("/groups/zimmer/Ulises/code/deeplabcut_projects/frames_to_extract.txt");
string_name=split(frame_string
 "\n")

for (i=0; i<string_name.length; i++) {
		print(string_name[i]);
		setSlice(string_name[i]);
		if (lengthOf(string_name[i])==5){
		filename="img0"+string_name[i]+".png";
		saveAs("PNG", OUTPUT_DIR+ "/" +filename);
		}else{
		filename="img"+string_name[i]+".png";
		saveAs("PNG", OUTPUT_DIR+ "/" +filename);
		}

}