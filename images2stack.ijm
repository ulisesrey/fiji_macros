path = getDirectory("Choose a Directory");
filename = getFileList(path);
Array.sort(filename);

//Array.print(filename);


//setBatchMode(true);

for (i=0; i<filename.length; i++) {

        open(path+filename[i]);

}
run("Images to Stack", "name=Stack title=[] use");

//want to save?
//newDir = path + "Output" + File.separator;
//File.makeDirectory(newDir);
//saveAs("tiff", newDir + "Result of " + filename[i-1]);
print("end");