// I think this just can't be done
// see: https://forum.image.sc/t/using-runmacro-on-a-macro-with-script-parameters/6401

function roi_series_analyzer(stack_path, roi_path, output_path){

    setBatchMode(true)

    // load stack
    open(stack_path)
    // load roi
    open(roi_path)
    nRois = roiManager("count");

    // set roi to have properties none, so they do not got to a specific frame when selected
    for (i=0; i < nRois; i++){

        selectWindow("ROI Manager");
        roiManager("select", i);
        RoiManager.setPosition(0);
    }



    for (n=1; n <= nSlices; n++){
        setSlice(n);

        for (i=0; i < nRois; i++){
            selectWindow("ROI Manager");
            roiManager("select", i);
            ROI_NAME = Roi.getName;
            // print(ROI_NAME);
            // column, row, value
            getStatistics(area, mean);
            setResult(ROI_NAME, n - 1, area * mean);
        }
    }
    // save results
    selectWindow("Results");
    saveAs("Results", output_path);
    // close things
    run("Close")
    selectWindow("ROI Manager");
    run("Close")
    close("*")

}