<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<script>
$(document).ready(function(){
  
  $(".btn2").click(function(){
    $("p").show();
  });
});
</script>
<script>
$(document).ready(function(){
  
  $(".btn1").click(function(){
    $("p").hide();
  });
});
</script>
</head>
<body style="background-color: #e0ebeb;">

<header>
		<div class="header-top" align="center">
			<h1 align="center">Welcome to Website</h1>
			<div class="container" style="background-color: #85adad;">
				<a href="Menu" style="padding-right: 65px; font-size:120%;">Menu</a> |
				<a href="about" style="padding-right: 65px; font-size:120%;">About</a> |
					<a href="contact" style="padding-right: 65px; font-size:120%;">Contact</a> |
					<a href="Login" style="padding-right: 65px; font-size:120%;">Login</a>|
			</div>
		</div>
	</header>
<main>
<p style="display:none;">A company profile introduces a business's mission, goals, vision, and history</p>
<p style="display:none;">In most cases, a profile includes an 'About Us' section that narrates </p>
<p style="display:none">how the company was founded</p>


 <button class="btn1">hide</button>

<button class="btn2">Show</button></main>

</body>
</html>