path = getDirectory("Choose a Directory");
filename = getFileList(path);

setBatchMode(true);

for (i=0; i<filename.length; i++) {

        open(path+filename[i]);

}
run("Images to Stack", "name=Stack title=[] use");
run("AVI... ", "compression=JPEG frame=10 save=/groups/zimmer/Ulises/wbfm/chemotaxis_assay/20191114_cal01/control/worm1/rec1/data/mCherry/new_Stack.avi");
