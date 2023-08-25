<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>OTP Verification</title>
</head>
<body style="background-color:#a0daa9;">
<div align="center">
    <h1>OTP Verification</h1>
    <form action="/verify-otp" method="post">
        <label for="otp">Enter OTP:</label>
        <input type="text" id="otp" name="otp" required>
        <button type="submit">Verify</button>
    </form>
    </div>
</body>
</html>
