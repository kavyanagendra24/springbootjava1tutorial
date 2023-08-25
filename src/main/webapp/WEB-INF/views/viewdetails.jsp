<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body >
<input type="file" id="attachProfiles" accept="image/*,.pdf" name="attachProfiles" onchange="loadFile(event)">
<div id="output"></div>
<label class="text-muted" style="font-size: 12px;">Upload only .pdf file and maximum of 100 KB to be selected.</label>

<script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.11.338/pdf.min.js"></script>
<script>
  var loadFile = function(event) {
    var file = event.target.files[0];
    var fileType = file.type; // Get the file type

    if (!fileType.includes('image') && fileType !== 'application/pdf') {
      alert("Only image and PDF files are allowed.");
      return;
    }

    var fileSize = file.size / 1024; // Calculate file size in KB

    if (fileSize > 200) {
      alert("File size exceeds the maximum limit of 100 KB.");
      return;
    }

    var output = document.getElementById('output');

    if (fileType.includes('image')) {
      output.innerHTML = ''; // Clear previous content
      var img = document.createElement('img');
      img.src = URL.createObjectURL(file);
      img.onload = function() {
        URL.revokeObjectURL(img.src); // Free memory
      };
      output.appendChild(img);
    } else if (fileType === 'application/pdf') {
      output.innerHTML = ''; // Clear previous content
      var reader = new FileReader();
      reader.onload = function(e) {
        var pdfData = new Uint8Array(e.target.result);
        PDFJS.getDocument({ data: pdfData }).promise.then(function(pdf) {
          pdf.getPage(1).then(function(page) {
            var scale = 1.5;
            var viewport = page.getViewport({ scale: scale });
            var canvas = document.createElement('canvas');
            var context = canvas.getContext('2d');
            canvas.height = viewport.height;
            canvas.width = viewport.width;

            var renderContext = {
              canvasContext: context,
              viewport: viewport
            };

            page.render(renderContext).promise.then(function() {
              output.appendChild(canvas);
            });
          });
        });
      };
      reader.readAsArrayBuffer(file);
    }
  };
</script>



</body>
</html>