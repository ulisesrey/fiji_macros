setBatchMode(true)
nRois=roiManager("count");

	for (n=1; n<=nSlices; n++){
	setSlice(n);
	//run("Measure");
		for (i=0; i<nRois; i++){
			selectWindow("ROI Manager");
			roiManager("select", i);
			ROI_NAME= Roi.getName;
			// print(ROI_NAME);
			//column, row, value
			getStatistics(area, mean);
			setResult(ROI_NAME, n-1, area*mean);
			//updateResults();
	
	run("Next Slice [>]");
	}
}