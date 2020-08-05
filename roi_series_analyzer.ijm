nRois=roiManager("count");
	for (i=0; i<nRois; i++){
	selectWindow("ROI Manager");
	roiManager("select", i);
		
		for (n=1; n<=nSlices; n++){
		setSlice(n);
		//run("Measure");


		//column, row, value
		getStatistics(area, mean);
		setResult("roi "+i+1, n-1, mean);
		//updateResults();
		
		run("Next Slice [>]");
		}
}
