<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="com.Caltech.pojo.Batch" %>
<%@ page import="com.Caltech.pojo.User" %>
<%@ page import="com.Caltech.dao.UserDao" %>
<%
    // Check if the user has Super Admin privileges
    if (session.getAttribute("SuperAdmin") == null) { 
        String errorMessage = "You do not have Super Admin Privilege! Unauthorized Access!";
        session.setAttribute("errorMessage", errorMessage);
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
    crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="editAdmin.css">
<title>Delete User</title>
</head>
<body>
    <%
	    int userId = Integer.parseInt(request.getParameter("userId"));
	
	    // Fetch user details from the database based on userId
	    UserDao userDao = new UserDao();
	    User user = userDao.getUser(userId);
	
	    // Set the user object in the session for other operations
	    session.setAttribute("user", user);
    %>
    <h1>Delete Batch</h1>
    <button type="submit" class="btn btn-primary btn-center btn-router" onClick="window.location.href='<%= request.getContextPath() %>/viewUsers.jsp';">View Users</button>
    <br>
    <!-- Display the adminId as needed or perform the delete operation -->
    <div class="center-container">
        <div class="form-group">
            <form action="deleteUserController.jsp" method="post">
                <label for="id"><b>USER ID:</b></label><br>
                <input type="number" name="id" placeholder="user ID" value="<%= user.getUserId() %>" readonly><br>
				<label for="username"><b>Username:</b></label><br>
                <input type="text" name="username" placeholder="Username" value="<%= user.getUsername() %>" readonly><br>
                <label for="batch"><b>BATCH ID:</b></label><br>
                <input type="number" name="batch" placeholder="Batch ID" value="<%= user.getBatchId() %>" readonly><br>    
                <input type="submit" id="deleteUserButton" class="form-control form-control-color" value="Delete User">
            </form>
        </div>
    </div>
</body>
</html>
