setBatchMode(true)
nRois=roiManager("count");

	for (n=1; n<=nSlices; n++){
	setSlice(n);
	//run("Measure");
		for (i=0; i<nRois; i++){
			selectWindow("ROI Manager");
			roiManager("select", i);


			//column, row, value
			getStatistics(area, mean);
			setResult("roi "+i+1, n-1, mean);
			//updateResults();
	
	run("Next Slice [>]");
	}
}