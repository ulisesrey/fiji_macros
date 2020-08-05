path = getDirectory("Choose a Directory");
filename = getFileList(path);
newDir = path + "Output" + File.separator;
File.makeDirectory(newDir);

//setBatchMode(true);

for (i=0; i<filename.length; i++) {

        open(path+filename[i]);
        run("Split Channels");
        selectWindow(filename[i]+" (blue)");
		close();
        selectWindow(filename[i]+" (green)");
        saveAs("tiff", path + filename[i] + "_G");
		close();
       selectWindow(filename[i]+" (red)");
		saveAs("tiff", path + filename[i] + "_R");

        //run("Measure");
        //close();
}