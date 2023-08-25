<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body  style="background-image: url('/images/background1.jpg');background-repeat: no-repeat;background-position: center;background-size: 1300px 900px;"> 

	<header >
		<div class="header-top" align="center">
		    <div>
			<h1 align="center">Register Here!!</h1> <img src="/images/register.png" alt="register" width="50" height="50">
			</div>
			<nav>
			<div class="container"  align="center" style="background-color:Grey; ">
				<a href="Menu" style="padding-right: 65px; color:Black; font-size:120%;" >Menu</a> |
				<a href="about" style="padding-right: 65px; color:Black; font-size:120%;">About</a> |
				<a href="contact" style="padding-right:65px; color:Black; font-size:120%;">Contact</a>| 
				<a href="Login" style="padding-right: 65px; color:Black; font-size:120%;">Login</a>|
			</div>
			</nav>
		</div>
	</header>
	<br>
	<main >
		<div align="center">
			<form action="/Login" method="post" modelAttribute="user" enctype="multipart/form-data">
			
				<label>Username:</label> 
				<input type="text" name="name" placeholder="Enter full name" autocomplete="off" />
				 <br> <br>
				<label>Password:</label>
				<input type="password" name="password" placeholder="Enter the Password" autocomplete="off"/> 
				<br> <br> 
				<!-- <label>Date:</label> -->
				<input type="date" name="date" style="display:none;"/> 
				<br>
				
				<label for="dateTime">Date and Time:</label>
              <input type="datetime-local" id="dateTime" name="dateTime"  autocomplete="off"><br>
				<br> <label for="designation">Designation:</label> 
				<select	name="designation" id="designation">
				<option >Choose an option</option>
					<option value="JavaDeveloper">JavaDeveloper</option>
					<option value="Tester">Tester</option>
					<option value="HR">HR</option>
					<option value="Manager">Manager</option>
				</select>
				
				<br><br>
				<label>WorkType:</label>
				<input type="radio" name="worktype" id="Fulltime" value="Fulltime" class="check" onclick="check()"> 
                  <label for="Fulltime">FullTime</label>
    
                 <input type="radio" name="worktype" id="Parttime" value="Parttime" class="uncheck" onclick="uncheck()" > 
                  <label for="Parttime">PartTime</label>
               
              
                <br><br>
               <label>Day:</label>
                <!-- <input type="checkbox" id="All" name="All" value="All">
                <label for="All">All</label> -->
                <input type="checkbox" id="Mon" name="day" value="Mon">
                <label for="Mon">Mon</label>
                <input type="checkbox" id="Tue" name="day" value="Tue">
                 <label for="Tue">Tue</label>
                 <input type="checkbox" id="Wed" name="day" value="Wed">
                 <label for="Wed">Wed</label>
                 <input type="checkbox" id="Thu" name="day" value="Thu">
                 <label for="Thu">Thu</label>
                 <input type="checkbox" id="Fri" name="day" value="Fri">
                 <label for="Fri">Fri</label>
                 <input type="checkbox" id="Sat" name="day" value="Sat">
                 <label for="Sat">Sat</label>
                 <input type="checkbox" id="Sun" name="day" value="Sun">
                 <label for="Sun">Sun</label>
                  <script src="/js/check.js"></script>
                  
                 <br><br>
                 
                 
                 <br><br>
                 <div>
                 <label>AttachProfile:</label>

					<input type="file" id="fileInput" name="file" accept="image/*,.pdf"
						 onchange="loadFile(event)"> <img
						id="output" />
					
					<script src="/js/image.js"></script>
				
				</div> 
                 <br><br>
         
                <br><br>
                
				<button type="submit" style="background-color: Grey; color: #FFF;">Submit</button>
				
			</form>
			
		</div>

	</main>
	<a href="/form"><button >Back</button></a>
</body>
</html>