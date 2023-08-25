<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Email OTP</title>
</head>

<body style="background-color:#f7cac9;">
<div align="center">
    <h1>Email Verification</h1>

    <form action="/verify-email" method="post" >
         <label>Name</label>
        <input type="name" id="name" name="name" autocomplete="off"><br/>
        <br/>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" autocomplete="off" required>
        <br/>
        <br/>
        <button type="submit">Send Verification Code</button>
    </form>
    </div>
</body>
</html>