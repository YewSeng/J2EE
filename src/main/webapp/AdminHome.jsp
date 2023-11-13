<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    // Check if the user has Super Admin privileges
    if (session.getAttribute("Admin") == null) { 
        String errorMessage = "You do not have Admin Privilege! Unauthorized Access!";
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
<title>Admin Dashboard</title>
</head>
<body>  
    <h1>Admin Dashboard</h1>
    <button type="submit" class="btn btn-primary btn-router" style="display: block; margin: 0 auto;" onClick="window.location.href='<%= request.getContextPath() %>/AdminProfile.jsp';">View Admin Profile</button><br>
    
    <!-- Use the container class to control the width -->
    <div class="container">
        <div class="center-container">
            <div class="card-group">
                <div class="card">
                    <img src="https://www.gethow.org/wp-content/uploads/2014/01/classes.jpg" class="card-img-top" alt="Batches" width="20" height="200">
                    <div class="card-body">
                        <h5 class="card-title">Batches</h5>
                        <p class="card-text">Share your knowledge? View your classes?</p>
                    </div>
                    <div class="card-footer">
                        <small class="text-muted">Last updated eons ago</small>
                        <p><b>View Your Batches</b></p>
                        <button class="btn btn-secondary btn-center" id="viewBatch" onClick="window.location.href='<%= request.getContextPath() %>/viewAdminBatch.jsp';">View Your Batch</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
