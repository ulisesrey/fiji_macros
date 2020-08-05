source_dir = getDirectory("Source Directory");
 
list=getFileList(source_dir);
setBatchMode(true);

for (i=0; i<list.length; i++) {
	run("Bio-Formats", "color_mode=Default rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT use_virtual_stack open="+source_dir+list[i]);
	print(source_dir+list[i]);
	run("AVI... ", "compression=JPEG frame=167  save="+source_dir+list[i]+".avi");
	run("Close All");
}



