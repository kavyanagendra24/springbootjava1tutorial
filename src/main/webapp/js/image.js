var loadFile = function(event) {
	var file = event.target.files[0];
	var fileSize = file.size / 1024; // Calculate file size in KB

	if (fileSize > 200) {
		alert("File size exceeds the maximum limit of 100 KB.");
		return;
	}
	var output = document.getElementById('output');
	output.src = URL
		.createObjectURL(file);
	output.onload = function() {
		URL.revokeObjectURL(output.src) // free memory
	}
};



