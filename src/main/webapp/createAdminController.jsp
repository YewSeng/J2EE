<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.Caltech.pojo.Admin" %>
    <%@ page import="com.Caltech.dao.AdminDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Admin Controller</title>
</head>
<body>
	<%
		AdminDao dao = new AdminDao();
		Admin admin =new Admin();
		admin.setAdminUsername(request.getParameter("username"));
		admin.setAdminPassword(request.getParameter("password"));
		if(dao.insertAdmin(admin) > 0){
			session.setAttribute("Admin", admin);
	        String successMessage = "[Admin]"+ admin.getAdminUsername() + " have been created by [SuperAdmin] " + session.getAttribute("SuperAdmin");
	        session.setAttribute("successMessage", successMessage);
			response.sendRedirect("viewAdmins.jsp");
		}  else {
		    // Create failed, provide error feedback and redirect
		    String errorMessage = "Admin creation failed. Please try again.";
		    session.setAttribute("errorMessage", errorMessage);
		    response.sendRedirect("viewAdmins.jsp"); // Redirect back to the edit page or an appropriate location
		}
	%>
</body>
</html>