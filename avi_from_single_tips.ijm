path = getDirectory("Choose a Directory");
filename = getFileList(path);

setBatchMode(true);

//first run the Stack_extraction.ipynb to have a text file with the filenames in order
filestring=File.openAsString("/groups/zimmer/Ulises/wbfm/chemotaxis_assay/20191114_cal01/control/worm1/rec1/data/mCherry/out_14_16_f.txt");
filename=split(filestring, "\n")

for (i=0; i<filename.length; i++) {
		print(filename[i]);
        open(path+filename[i]);

}
run("Images to Stack", "name=Stack title=[] use");
saveAs("Tiff", "/groups/zimmer/Ulises/wbfm/chemotaxis_assay/20191114_cal01/control/worm1/rec1/data/mCherry/Stack1416.tif");
run("AVI... ", "compression=JPEG frame=10 save=/groups/zimmer/Ulises/wbfm/chemotaxis_assay/20191114_cal01/control/worm1/rec1/data/mCherry/new_Stack1416.avi");
