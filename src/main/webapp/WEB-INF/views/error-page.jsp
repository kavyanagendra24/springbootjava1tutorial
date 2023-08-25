<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error</title>
</head>
<body>
    <h1>Error</h1>
    <p>An unexpected error occurred.</p>
    
    <input type="checkbox" id="checkbox1" onclick="handleCheckboxClick(this)">
    <label for="checkbox1">Checkbox 1</label><br>

    <input type="checkbox" id="checkbox2" onclick="handleCheckboxClick(this)">
    <label for="checkbox2">Checkbox 2</label><br>

    <input type="checkbox" id="checkbox3" onclick="handleCheckboxClick(this)">
    <label for="checkbox3">Checkbox 3</label><br>

    <input type="checkbox" id="checkbox4" onclick="handleCheckboxClick(this)">
    <label for="checkbox4">Checkbox 4</label><br>

    <input type="checkbox" id="checkbox5" onclick="handleCheckboxClick(this)">
    <label for="checkbox5">Checkbox 5</label><br>

    <script>
        function handleCheckboxClick(checkbox) {
            // Disable all other checkboxes
            var checkboxes = document.querySelectorAll('input[type="checkbox"]');
            checkboxes.forEach(function (cb) {
                if (cb !== checkbox) {
                    cb.disabled = checkbox.checked;
                }
            });
        }
    </script>
</body>
</html>