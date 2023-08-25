<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Employee</title>
</head>
<body>
    <h1>Edit Employee</h1>
    <form action="/update" method="POST">
        <input type="hidden" name="id" value="${user.id}" />
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="${user.name}" required /><br><br>
       <%--  <label for="designation">Designation:</label>
        <input type="text" id="designation" name="designation" value="${user.designation}" required /><br><br> --%>
        <label for="password">Password:</label>
        <input type="text" id="password" name="password" value="${user.password}" required /><br><br>
        <label for="dateTime">Date:</label>
        <input type="datetime-local" id="dateTime" name="dateTime"  value="${user.datetimeField}" required /><br><br>
        <label for="designation">Designation:</label>
        <select id="designation" name="designation" required>
			<option value="HR" ${user.designation eq 'HR' ? 'selected' : ''}>HR</option>
			<option value="JavaDeveloper"
				${user.designation eq 'JavaDeveloper' ? 'selected' : ''}>JavaDeveloper</option>
			<option value="Tester"
				${user.designation eq 'Tester' ? 'selected' : ''}>Tester</option>
			<option value="Manager"
				${user.designation eq 'Manager' ? 'selected' : ''}>Manager</option>
		</select><br> <br> <label for="worktype">WorkType:</label>
        <input type="radio" id="fulltime" name="worktype" value="Fulltime" class="check" onclick="check()" ${user.worktype == 'Fulltime' ? 'checked' : '' } required />
        <label for="fulltime">Fulltime</label>
        <input type="radio" id="parttime" name="worktype" value="Parttime" class="uncheck" onclick="uncheck()" ${user.worktype == 'Parttime' ? 'checked' : ''} required />
        <label for="parttime">Parttime</label><br><br>
        
        <label>Day:</label>
               
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
       
        <input type="submit" value="Update" />
    </form>
    <br>
    <a href="/users">Back to Employee List</a>
</body>
</html>