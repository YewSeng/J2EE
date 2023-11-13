<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    <script src="editAdmin.js"></script>
    <title>Edit Admin</title>
    <style>
        .admin-details {
            display: flex;
            justify-content: space-between;
        }
        .admin-details .old-details,
        .admin-details .new-details {
            width: 65%; /* Adjust the width as needed */
        }
        .admin-details .old-details {
            padding: 10px;
        }
        .admin-details .new-details {
            padding: 10px;
        }
    </style>
</head>
<body>
    <h1><i>Edit Admin Page</i></h1>
    <button type="submit" class="btn btn-primary btn-center btn-router" onClick="window.location.href='<%= request.getContextPath() %>/viewAdmins.jsp';">View Admins</button>
    <h2>Admin Details</h2>
    <%
	    int adminId = Integer.parseInt(request.getParameter("adminId"));
		
	    // Fetch user details from the database based on userId
	    AdminDao adminDao = new AdminDao();
	    Admin admin = adminDao.getAdmin(adminId);
	
	    // Set the user object in the session for other operations
	    session.setAttribute("admin", admin);
    %>
    <div class="admin-details">
        <div class="old-details">
        	<h3>Old Details</h3>
        	<form>
                <label for="oldId"><b>ADMIN ID:</b></label><br>
                <input type="number" name="oldId" placeholder="Admin ID" value="<%= admin.getAdminId() %>" readonly><br>
                <label for="oldUsername"><b>OLD ADMIN USERNAME:</b></label><br>
                <input type="text" name="oldUsername" placeholder="Admin's New Username" value="<%= admin.getAdminUsername() %>" readonly><br>
                <label for="oldPassword"><b>OLD PASSWORD:</b></label><br>
                <input type="text" name="oldPassword" placeholder="Admin's New Password" value="NULL" readonly><br>
            </form>
        </div>
        <div class="new-details">
            <h3>New Details</h3>
            <form action="editAdminController.jsp" method="post">
                <label for="id"><b>ADMIN ID:</b></label><br>
                <input type="number" name="id" placeholder="Admin ID" value="<%= admin.getAdminId() %>" readonly><br>
                <label for="username"><b>Username:</b></label><br>
                <input type="text" class="form-control" name="username" id="username" aria-describedby="emailHelp" placeholder="Create Admin Username" required><br>
                <div id="usernameError" class="error-message text-danger"></div>
                <label for="password"><b>Password:</b></label><br>
                <input type="password" class="form-control" name="password" id="password" aria-describedby="emailHelp" placeholder="Create Admin password" required><br>
                <div id="passwordError" class="error-message text-danger"></div>
                <label for="showPassword"><b>Show Password</b></label>
                <input type="checkbox" id="showPassword" name="showPassword" onclick="togglePasswordVisibility('showPassword', 'password')"><br>
                <input type="submit" id="updateAdminButton" class="form-control form-control-color" value="Update Admin">
            </form>
        </div>
    </div>

    <!-- JavaScript function to toggle password visibility -->
    <script>
        function togglePasswordVisibility(checkboxId, passwordId) {
            var checkbox = document.getElementById(checkboxId);
            var passwordInput = document.getElementsByName(passwordId)[0];
            if (checkbox.checked) {
                passwordInput.type = "text";
            } else {
                passwordInput.type = "password";
            }
        }
    </script>
</body>
</html>