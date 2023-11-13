<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.Caltech.pojo.*" %>
<%@ page import="com.Caltech.dao.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://cdn.../bootstrap.min.css?v=1.0" integrity="..." crossorigin="anonymous">
 	<title>Index</title>
</head>
<body>

<!-- Include the navigation dynamically based on user roles -->
	<% if (session.getAttribute("SuperAdmin") != null) { %>
        <%@ include file="navbar_superadmin.jsp" %>
	<% } else if (session.getAttribute("Admin") != null) { %>
        <%@ include file="navbar_admin.jsp" %>
    <% } else if (session.getAttribute("User") != null) { %>
        <%@ include file="navbar_user.jsp" %>
    <% } else { %>
        <%@ include file="navbar.jsp" %>
    <% } %>
<!-- Set the initial content for the bottom iframe -->
<iframe src="home.jsp" name="bottom" id="bottom" title="Bottom Frame" width="100%" height="900" frameborder="0"></iframe>

</body>
</html>
