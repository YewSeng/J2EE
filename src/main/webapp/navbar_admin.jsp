<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.Caltech.pojo.*" %>
    <%@ page import="com.Caltech.dao.*" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <title>NavBar Admin</title>
</head>
<body>

<%
	String username = (String) session.getAttribute("User");
	String adminUsername = (String) session.getAttribute("Admin");
	String superAdmin = (String) session.getAttribute("SuperAdmin");
%>
    <!-- Default Navigation bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
            	<c:choose>
    			<c:when test="${empty param.username and empty param.adminUsername and empty param.superAdmin}">
	                <li class="nav-item active">
	                    <a class="nav-link" href="/SimplilearnBackendProject/home.jsp" target="bottom" rel="noopener noreferrer">Home<span class="sr-only">(current)</span></a>
	                </li>
	                <li class="nav-item active">
	                    <a class="nav-link" href="/SimplilearnBackendProject/register.jsp" target="bottom" rel="noopener noreferrer">Register</a>
	                </li>
	                <li class="nav-item active">
	                    <a class="nav-link" href="/SimplilearnBackendProject/about-us.jsp" target="bottom" rel="noopener noreferrer">About Us</a>
	                </li>
	                <li class="nav-item active">
	                    <a class="nav-link" href="/SimplilearnBackendProject/contact-us.jsp" target="bottom" rel="noopener noreferrer">Contact Us</a>
	                </li>
	                <li class="nav-item">
		                <form class="form-inline my-2 my-lg-0" method="get" action="LogoutServlet">
		                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit" onClick="logout()">Logout</button>
		                </form>
	            	</li>
                </c:when>
                <c:when test="${empty param.username and empty param.adminUsername and not empty param.superAdmin}">
	                <li class="nav-item active">
	                    <a class="nav-link" href="/SimplilearnBackendProject/SuperAdminHome.jsp" target="bottom" rel="noopener noreferrer">Super Admin Home<span class="sr-only">(current)</span></a>
	                </li>
	                <li class="nav-item active">
	                    <a class="nav-link" href="/SimplilearnBackendProject/SuperAdminProfile.jsp" target="bottom" rel="noopener noreferrer">Super Admin Profile</a>
	                </li>
	                <li class="nav-item active">
	                    <a class="nav-link" href="/SimplilearnBackendProject/viewAdmins.jsp" target="bottom" rel="noopener noreferrer">View Admins</a>
	                </li>
	                <li class="nav-item active">
	                    <a class="nav-link" href="/SimplilearnBackendProject/viewBatches.jsp" target="bottom" rel="noopener noreferrer">View Batches</a>
	                </li>
	                <li class="nav-item active">
	                    <a class="nav-link" href="/SimplilearnBackendProject/viewUsers.jsp" target="bottom" rel="noopener noreferrer">View Users</a>
	                </li>
	                <li class="nav-item">
		                <form class="form-inline my-2 my-lg-0" method="get" action="LogoutServlet">
		                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit" onClick="logout()">Logout</button>
		                </form>
	            	</li>
            	</c:when>
            	<c:when test="${not empty param.adminUsername}">
	            	<li class="nav-item active">
	                    <a class="nav-link" href="/SimplilearnBackendProject/AdminHome.jsp" target="bottom" rel="noopener noreferrer">Admin Home<span class="sr-only">(current)</span></a>
	                </li>
	                <li class="nav-item active">
	                    <a class="nav-link" href="/SimplilearnBackendProject/AdminProfile.jsp" target="bottom" rel="noopener noreferrer">Admin Profile</a>
	                </li>
	                <li class="nav-item active">
	                    <a class="nav-link" href="/SimplilearnBackendProject/viewAdminBatch.jsp" target="bottom" rel="noopener noreferrer">Your Classes</a>
	                </li>
	                <li class="nav-item">
		                <form class="form-inline my-2 my-lg-0" method="get" action="LogoutServlet">
		                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit" onClick="logout()">Logout</button>
		                </form>
	            	</li>
	            </c:when>
	            <c:when test="${not empty param.username}">
		            <li class="nav-item active">
	                    <a class="nav-link" href="/SimplilearnBackendProject/UserHome.jsp" target="bottom" rel="noopener noreferrer">User Home<span class="sr-only">(current)</span></a>
	                </li>
	                <li class="nav-item active">
	                    <a class="nav-link" href="/SimplilearnBackendProject/UserProfile.jsp" target="bottom" rel="noopener noreferrer">User Profile</a>
	                </li>
	                <li class="nav-item active">
	                    <a class="nav-link" href="/SimplilearnBackendProject/viewUserClass.jsp" target="bottom" rel="noopener noreferrer">Your Class</a>
	                </li>
	                <li class="nav-item">
		                <form class="form-inline my-2 my-lg-0" method="get" action="LogoutServlet">
		                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit" onClick="logout()">Logout</button>
		                </form>
	            	</li>
	            </c:when>
	            <c:otherwise>
					<li class="nav-item active">
	                    <a class="nav-link" href="/SimplilearnBackendProject/AdminHome.jsp" target="bottom" rel="noopener noreferrer">Admin Home<span class="sr-only">(current)</span></a>
	                </li>
	                <li class="nav-item active">
	                    <a class="nav-link" href="/SimplilearnBackendProject/AdminProfile.jsp" target="bottom" rel="noopener noreferrer">Admin Profile</a>
	                </li>
	                <li class="nav-item active">
	                    <a class="nav-link" href="/SimplilearnBackendProject/viewAdminBatch.jsp" target="bottom" rel="noopener noreferrer">Your Classes</a>
	                </li>
	                <li class="nav-item">
		                <form class="form-inline my-2 my-lg-0" method="get" action="LogoutServlet">
		                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit" onClick="logout()">Logout</button>
		                </form>
	            	</li>
			    </c:otherwise>
	          </c:choose>
            </ul>
        </div>
    </nav>
</body>
</html>
