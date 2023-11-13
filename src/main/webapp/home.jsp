<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="home.css">
<script src="login.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>Home</title>
</head>
<body>
	<h1><b>Home</b></h1>
	<div class="center-container">
		        <div id="success" class="success-message">
	            <%
	            String successMessage = (String) session.getAttribute("successMessage");
	            if (successMessage != null) {
	            %>
	                <span style='color: green; font-weight: bold;'><%= successMessage %></span>
	            <%
	            }
	            %>
	        </div>
		<h3><u>Login Details</u></h3>
		<div class="form-group">
			<form action="CommonLogin" method="post">
				<label for="username"><b>Username:</b></label>
                <input type="text" class="form-control" id="username" name="username" placeholder="Enter Your Username" value="<%= (request.getParameter("username") != null) ? request.getParameter("username") : "" %>" required>
                <label for="password"><b>Password:</b></label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Enter Your Password" value="<%= (request.getParameter("password") != null) ? request.getParameter("password") : "" %>" required>
                <label for="showPassword"><b>Show Password</b></label>
    			<input type="checkbox" id="showPassword" name="showPassword" onclick="togglePasswordVisibility('showPassword', 'password')"><br>
                <input type="submit" id="loginButton" class="form-control form-control-color" value="LOGIN">
			</form>
			<div id="error" class="error-message">
                <%
                String errorMessage = (String) session.getAttribute("errorMessage");
                if (errorMessage != null) {
                %>
                    <span style='color: red; font-weight: bold;'><%= errorMessage %></span>
                <%
                }
                %>
            </div>
		</div>
	</div>
    <br>
	<div class="ctr-container"> 
        <p class="center-paragraph"><i><b>Not a Registered Member yet?</b></i></p>
        <form action="register.jsp" method="post">
        	<input type="submit" id="loginButton" class="form-control form-control-color" value="REGISTER">
        </form>
    </div>
</body>
</html>
