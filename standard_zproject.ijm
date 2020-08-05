
path = getDirectory("Choose a Directory");
filename = getFileList(path);
newDir = path + "Output" + File.separator;
File.makeDirectory(newDir);

setBatchMode(true);

for (i=0; i<filename.length; i++) {

        open(path+filename[i]);
        
                
                run("Z Project...", "projection=[Max Intensity]");
                saveAs("tiff", newDir + "MAX_of_" + filename[i]);

                close();
                close();
}