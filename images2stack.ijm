path = getDirectory("Choose a Directory");
filename = getFileList(path);
Array.sort(filename);

//Array.print(filename);

newDir = path + "Output" + File.separator;
File.makeDirectory(newDir);

setBatchMode(true);

for (i=0; i<filename.length; i++) {

        open(path+filename[i]);

}
run("Images to Stack", "name=Stack title=[] use");
saveAs("tiff", newDir + "Result of " + filename[i-1]);
print(“end")