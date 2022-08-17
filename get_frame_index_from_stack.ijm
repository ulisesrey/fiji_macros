// This macro allows you to save the index of some frames you might find interesting from a stack

//Open stack manually
for (n=1; n<=nSlices; n++){
	setSlice(n);
	Dialog.create("Which frames do you want to delete?")
	Dialog.addCheckbox("Delete Current frame", false);
	Dialog.show();
	choice =  Dialog.getCheckbox();
	if (choice==1){
		print(n);
		
	}
	run("Next Slice [>]");
}

// save results manually