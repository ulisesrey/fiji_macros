%It's use is discouraged because it compresses in JPEG, or PNG.
%Better use tiff2avi python function (in centerline package) and select the compression codec (or None)


source_dir = getDirectory("Source Directory");
 
list=getFileList(source_dir);
setBatchMode(true);

for (i=0; i<list.length; i++) {
	run("Bio-Formats", "color_mode=Default rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT use_virtual_stack open="+source_dir+list[i]);
	print(source_dir+list[i]);
	run("AVI... ", "compression=JPEG frame=167  save="+source_dir+list[i]+".avi");
	run("Close All");
}



