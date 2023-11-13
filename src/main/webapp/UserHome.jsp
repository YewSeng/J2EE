<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    // Check if the user has Super Admin privileges
    if (session.getAttribute("User") == null) { 
        String errorMessage = "You do not have a User Privilege! Unauthorized Access!";
        session.setAttribute("errorMessage", errorMessage);
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="SuperAdminHome.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>User Home</title>
</head>
<body>  
	<h1>User Dashboard</h1>
	<button type="submit" class="btn btn-primary btn-router" style="display: block; margin: 0 auto;" onClick="window.location.href='<%= request.getContextPath() %>/UserProfile.jsp';">View User Profile</button><br>
    <div class="container">
    <div class="center-container">
        <div class="card-group">
            <div class="card">
            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/800px-User_icon_2.svg.png" class="card-img-top" alt="User" width="20" height="200">
            <div class="card-body">
                <h5 class="card-title">Users</h5>
                <p class="card-text">View your classes Here</p>
            </div>
            <div class="card-footer">
                <small class="text-muted">Last updated eons ago</small>
                <p><b>View Your class</b></p>
                <button class="btn btn-secondary btn-center" id="viewClass" onClick="window.location.href='<%= request.getContextPath() %>/viewUserClass.jsp';">View User Class</button>
            </div>
            </div>
        </div>
    </div>
    </div>
</body>
</html>