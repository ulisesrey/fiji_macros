print("Be Careful! Importing with Bioformats ome.tiff files will load all the series, and sometimes not in the correct order.")
print("Might be better to use convert them first to big tiff file and then convert that to .avi using bigtiff2avi.ijm")

directory = "/groups/zimmer/Ulises/wbfm/chemotaxis_assay/2020_Only_behaviour/datasets/"
dataset=getFileList(directory);
for (i=0; i<dataset.length; i++) {
	print(dataset[i]);
	worm=getFileList(directory+dataset[i]);
	for (j=0; j<worm.length; j++) {
		print(worm[j]);
		ometif=getFileList(directory+dataset[i]+worm[j]);
		for (k=0; k<ometif.length; k++){
			if (endsWith(ometif[k], "MMStack.ome.tif")){
			print(ometif[k]);
			//this is the command you have from recording:
			run("Bio-Formats", "color_mode=Default open_all_series rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT use_virtual_stack open="+directory+dataset[i]+worm[j]+ometif[k]);
			
			
			//save as AVI part
			//
			filename=directory+dataset[i]+worm[j]+worm[j];
			id1=indexOf(filename,"/");
			id2=lastIndexOf(filename, "/");
			filename=substring(filename,id1,id2);
			print("filename:\n");
			print(filename);
			run("AVI... ", "compression=JPEG frame=167  save="+filename+".avi");
			print("avi saved");
			//close all
			//run("Close All");
			//run("Bio-Formats Macro Extensions");
			//Ext.openImagePlus(directory+dataset[i]+worm[j]+ometif[k]);
			//this is to open a big tiff, probably I wont need this
			//run("Bio-Formats", "color_mode=Default rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT use_virtual_stack open="+source_dir+list[i]);
			
			}
		}
		
	}
}
print("end")