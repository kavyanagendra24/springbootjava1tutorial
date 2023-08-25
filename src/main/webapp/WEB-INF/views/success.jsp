<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-image: url('/images/background-image1.png');background-repeat: no-repeat;background-position: center;background-size: 1300px 900px;"> 

	<div align="center">
		<h1>Register Success!!</h1>
		<h3>The Details entered by you :</h3>
	</div>
	<div align="center">
		<h4><span>Username:</span></h4>
		 <span>${user.name}</span> <br /> 
		 <h4><span >Password:</span></h4>
		<span type="hidden">${user.password}</span><br/>
	<%-- 	<h4> <span>Date:</span></h4>
		 <span>${user.date}</span> --%>
		 <h4> <span>Date and Time:</span></h4>
		 <span>${user.datetimeField}</span>
		<br /><h4> <span>Designation:</span> </h4>
		<span>${user.designation}</span> <br/>
		<h4><span>WorkType:</span> </h4>
		<span>${user.worktype}</span> <br/>
		<h4><span>Day:</span></h4>
		<span>${user.day}</span> <br/>
		<h4>File:</h4>
		<span>${user.content}</span>
	</div>
    <a href="/users"><button>UsersList</button></a>
	<a href="/form"><button>Back</button></a>
</body>
</html>