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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="createAdmin.css">
    <script src="createAdmin.js"></script>
<title>SuperAdmin - Create Admin</title>
</head>
<body>
    <h1>Registration</h1>
    <button type="submit" class="btn btn-primary btn-center btn-router" onClick="window.location.href='<%= request.getContextPath() %>/SuperAdminHome.jsp';">Return to Admin Home Page</button>
    <br>
    <div class="ctr-container">
        <div class="form-group">
            <form action="createAdminController.jsp" method="post">
                <label for="username"><b>Username:</b></label><br>
                <input type="text" class="form-control" name="username" id="username" aria-describedby="emailHelp" placeholder="Create Admin Username" required><br>
                <div id="usernameError" class="error-message text-danger"></div>
                <label for="password"><b>Password:</b></label><br>
                <input type="password" class="form-control" name="password" id="password" aria-describedby="emailHelp" placeholder="Create Admin password" required><br>
                <div id="passwordError" class="error-message text-danger"></div>
                <label for="showPassword"><b>Show Password</b></label>
                <input type="checkbox" id="showPassword" name="showPassword" onclick="togglePasswordVisibility('showPassword', 'password')"><br>
                <input type="submit" id="createAdminButton" class="form-control form-control-color" value="Create Admin">
            </form>
        </div>
    </div>
</body>
</html>