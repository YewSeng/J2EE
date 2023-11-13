<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="com.Caltech.pojo.Admin" %>
<%@ page import="com.Caltech.dao.AdminDao" %>
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
<title>Delete Admin</title>
</head>
<body>
    <%
	    int adminId = Integer.parseInt(request.getParameter("adminId"));
		
	    // Fetch user details from the database based on userId
	    AdminDao adminDao = new AdminDao();
	    Admin admin = adminDao.getAdmin(adminId);
	
	    // Set the user object in the session for other operations
	    session.setAttribute("admin", admin);
    %>
    <h1>Delete Admin</h1>
    <button type="submit" class="btn btn-primary btn-center btn-router" onClick="window.location.href='<%= request.getContextPath() %>/viewAdmins.jsp';">View Admins</button>
    <br>
    <!-- Display the adminId as needed or perform the delete operation -->
    <div class="center-container">
        <div class="form-group">
            <form action="deleteAdminController.jsp" method="post">
                <label for="id"><b>ADMIN ID:</b></label><br>
                <input type="number" name="id" placeholder="Admin ID" value="<%= admin.getAdminId() %>" readonly><br>
				<label for="username"><b>ADMIN USERNAME:</b></label><br>
                <input type="text" name="username" placeholder="Admin's New Username" value="<%= admin.getAdminUsername() %>" readonly><br><br>         
                <input type="submit" id="deleteAdminButton" class="form-control form-control-color" value="Delete Admin">
            </form>
        </div>
    </div>
</body>
</html>
