setBatchMode(false);
path="/Users/ulises.rey/local_data/coiled_shapes/good_number/"
label_path=path+"label/"
print(label_path);
File.openSequence(label_path, " open");
run("Images to Stack", "use");
file_path=path+"Stack.tif";
print(file_path);
saveAs("Tiff", file_path);

print("done");
