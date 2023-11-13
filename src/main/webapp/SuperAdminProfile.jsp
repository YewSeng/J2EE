<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<link rel="stylesheet" type="text/css" href="SuperAdminProfile.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>Super Admin Profile</title>
</head>
<body>
	<div>
        <h1><b>Super Admin Profile</b></h1>
        <h2><%= session.getAttribute("SuperAdmin") %></h2>
        <br>
        <img src="https://upload.wikimedia.org/wikipedia/commons/6/63/Simplilearn_logo.png" alt="SuperAdmin" width="250" height="300"><br>
        <b><a href="/SimplilearnBackendProject/viewAdmins.jsp">Manage Admin</a></b><br>
        <b><a href="/SimplilearnBackendProject/viewBatches.jsp">Manage Batches</a></b><br>
        <b><a href="/SimplilearnBackendProject/viewUsers.jsp">Manage Users</a></b><br>
        <br>
        <button type="submit" class="btn btn-primary btn-router" style="display: block; margin: 0 auto;" onClick="window.location.href='<%= request.getContextPath() %>/SuperAdminHome.jsp';">Super Admin Home</button><br>
    </div>
</body>
</html>