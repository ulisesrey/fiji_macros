path = getDirectory("Choose a Directory");
filename = getFileList(path);

setBatchMode(true);

for (i=0; i<filename.length; i++) {

        open(path+filename[i]);
        //it saves as image.tiff.png ... this should be improved
        saveAs("PNG", path+filename[i]+".png");
		close();


}
