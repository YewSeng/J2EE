<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.Caltech.pojo.Admin" %>
    <%@ page import="com.Caltech.dao.AdminDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Admin Controller</title>
</head>
<body>
<%
		AdminDao dao = new AdminDao();
		Admin admin = (Admin) session.getAttribute("admin");
		int adminId = Integer.parseInt(request.getParameter("id"));
		admin.setAdminId(adminId);
		admin.setAdminUsername(request.getParameter("username"));
		if(dao.deleteAdmin(adminId) > 0){
			session.setAttribute("Admin", admin);
	        String successMessage = "[Admin]"+ admin.getAdminUsername() + " have been deleted by [SuperAdmin] " + session.getAttribute("SuperAdmin");
	        session.setAttribute("successMessage", successMessage);
			response.sendRedirect("viewAdmins.jsp");
		} else {
		    // Update failed, provide error feedback and redirect
		    String errorMessage = "Admin deletion failed. Please try again.";
		    session.setAttribute("errorMessage", errorMessage);
		    response.sendRedirect("viewAdmins.jsp"); // Redirect back to the edit page or an appropriate location
		}
	%>
</body>
</html>