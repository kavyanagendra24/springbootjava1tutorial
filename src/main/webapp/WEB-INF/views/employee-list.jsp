<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Users List</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
   <script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>

     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
         .filter-form {
            margin-bottom: 10px;
        }
         .sort-icon {
            margin-left: 5px;
            cursor: pointer;
        }
        .pagination {
            margin-top: 10px;
            text-align: center;
        }

        .pagination a {
            display: inline-block;
            padding: 5px 10px;
            margin: 0 2px;
            border: 1px solid #ddd;
            color: #333;
            text-decoration: none;
            background-color: #f7f7f7;
            cursor: pointer;
        }

        .pagination.current {
            font-weight: bold;
            background-color: #4CAF50;
            color: white;
        }

        .pagination.disabled {
            color: #aaa;
            pointer-events: none;
            cursor: not-allowed;
        }        
    </style>
    
</head>
<body align="center">
    <h1>Users List</h1>
  
 <!--  search filter -->
	<form class="filter-form" action="/users" method="GET">
		<input type="text" name="search" placeholder="Search" id="search"
			value="${param.search}" autocomplete="off" list="suggestions"/> 
			
            <!-- suggestivesearch -->			
           <datalist id="suggestions"></datalist>
			<span id="invalidUser" class="error"></span>
             <script src="/js/suggestivesearch.js"></script>
             
            <!--  search for designation -->
			<input type="text" name="designation"
			placeholder="designation" value="${param.designation}" autocomplete="off"/>
			
			<!-- datefilter -->
    <input type="datetime-local" name="fromDateTime" placeholder="From Date and Time" value="${param.fromDateTime}"/>
    <input type="datetime-local" name="toDateTime" placeholder="To Date and Time" value="${param.toDateTime}" />
			
			
		<button type="submit">Search</button>
	</form>


	<a href="/users"><button>Clear</button></a>
	

	
  
    <table>  
        <tr style="background-color:Grey;">
            <th>ID</th>
            <th>Name
            
            </th>
            <th>
                Day
            </th>
           <!--  <th>Date
                <a href="/users?sort=date_asc" class="sort-icon"><i class="fa fa-caret-up" style="color:Black"></i></a>
                <a href="/users?sort=date_desc" class="sort-icon"><i class="fa fa-caret-down" style="color:Black"></i></a></th> -->
            <th>Date and Time</th>
            <th>Designation</th>
            <th>Password</th>
            <th>Worktype</th>
            <th>File</th>
             <th>Actions</th>
        </tr>
      
        <c:forEach items="${users}" var="user">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.day}</td>
                <%-- <td>${user.date}</td>
 --%>                <td>${user.datetimeField}</td>
                <td>${user.designation}</td>
                
                 <td >${user.password}</td>

                <td>${user.worktype}</td>
                <td><a href="/downloadFile?id=${user.id}"><i class="fa fa-download"></i></a>
                </td>
                <td>
                    <a href="/edit?id=${user.id}"><button>Edit</button></a>
                    <a href="/delete?id=${user.id}"><button>Delete</button></a>
                </td>
                
            </tr>
        </c:forEach>
    </table>
<a href="/Login"><button>Add</button></a>

<!-- Pagination -->
 
    <c:if test="${totalPages > 1}">
        <div class="pagination">
            <c:choose>
                <c:when test="${currentPage > 1}">
                    <a href="/users-list?page=${currentPage - 1}">Previous</a>
                </c:when>
                <c:otherwise>
                    <span class="disabled">Previous</span>
                </c:otherwise>
            </c:choose>

            <c:forEach begin="1" end="${totalPages}" varStatus="status">
                <c:choose>
                    <c:when test="${status.index + 1 == currentPage}">
                        <span class="current">${status.index + 1}</span>
                    </c:when>
                    <c:otherwise>
                        <a href="/users-list?page=${status.index + 1}">${status.index + 1}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:choose>
                <c:when test="${currentPage < totalPages}">
                    <a href="/users-list?page=${currentPage + 1}">Next</a>
                </c:when>
                <c:otherwise>
                    <span class="disabled">Next</span>
                </c:otherwise>
            </c:choose>
        </div>
    </c:if>


</body>
</html>