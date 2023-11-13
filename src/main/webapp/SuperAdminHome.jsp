<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
	String superAdminUsername = (String) session.getAttribute("SuperAdmin");
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
<link rel="stylesheet" type="text/css" href="SuperAdminHome.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>Super Admin Dashboard</title>
</head>
<body>  
	<h1>Super Admin Dashboard</h1>
	<button type="submit" class="btn btn-primary btn-router" style="display: block; margin: 0 auto;" onClick="window.location.href='<%= request.getContextPath() %>/SuperAdminProfile.jsp';">View Super Admin Profile</button><br>
    <div class="center-container">
        <div class="card-group">
            <div class="card">
            <img src="https://previews.123rf.com/images/ylivdesign/ylivdesign2004/ylivdesign200402733/144989837-global-admin-icon-outline-global-admin-vector-icon-for-web-design-isolated-on-white-background.jpg" class="card-img-top" alt="Admin" width="20" height="200">
            <div class="card-body">
                <h5 class="card-title">Admin</h5>
                <p class="card-text">Split the Workload? Why not hire an Admin?</p>
            </div>
            <div class="card-footer">
                <small class="text-muted">Last updated eons ago</small>
                <p><b>Create Admin</b></p>
                <button class="btn btn-primary btn-center" id="createAdmin" onClick="window.location.href='<%= request.getContextPath() %>/createAdmin.jsp';">Create an Admin</button>
                <br>
                <p><b>View All Admin</b></p>
                <button class="btn btn-secondary btn-center" id="viewAdmin" onClick="window.location.href='<%= request.getContextPath() %>/viewAdmins.jsp';">View Admin</button>
            </div>
            </div>
            <div class="card">
            <img src="https://www.gethow.org/wp-content/uploads/2014/01/classes.jpg" class="card-img-top" alt="Batches" width="20" height="200">
            <div class="card-body">
                <h5 class="card-title">Batches</h5>
                <p class="card-text">Share your knowledge? Why not monetized it?</p>
            </div>
            <div class="card-footer">
                <small class="text-muted">Last updated eons ago</small>
                <p><b>Create a Batch</b></p>
                <button class="btn btn-primary btn-center" id="createBatch" onClick="window.location.href='<%= request.getContextPath() %>/createBatch.jsp';">Create Batch</button>
                <br>
                <p><b>View All Batches</b></p>
                <button class="btn btn-secondary btn-center" id="viewBatch" onClick="window.location.href='<%= request.getContextPath() %>/viewBatches.jsp';">View Batches</button>
            </div>
            </div>
            <div class="card">
            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/800px-User_icon_2.svg.png" class="card-img-top" alt="User" width="20" height="200">
            <div class="card-body">
                <h5 class="card-title">Users</h5>
                <p class="card-text">Spread your passion? Let the world knows what you are doing!</p>
            </div>
            <div class="card-footer">
                <small class="text-muted">Last updated eons ago</small>
                <p><b>Create a User</b></p>
                <button class="btn btn-primary btn-center" id="createUser" onClick="window.location.href='<%= request.getContextPath() %>/createUser.jsp';">Create User</button>
                <br>
                <p><b>View All Users</b></p>
                <button class="btn btn-secondary btn-center" id="viewUser" onClick="window.location.href='<%= request.getContextPath() %>/viewUsers.jsp';">View Users</button>
            </div>
            </div>
        </div>
    </div>
</body>
</html>