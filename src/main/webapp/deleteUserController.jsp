<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.Caltech.pojo.*" %>
    <%@ page import="com.Caltech.dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete User Controller</title>
</head>
<body>
<%
		UserDao dao = new UserDao();
		User user = (User) session.getAttribute("user");
		int userId = Integer.parseInt(request.getParameter("id"));
		user.setUserId(userId);
		String username = request.getParameter("username");
		user.setUsername(username);
		int batchId = Integer.parseInt(request.getParameter("batch"));
		user.setBatchId(batchId);
		if(dao.deleteUser(userId) > 0){
			session.setAttribute("User", user);
			BatchDao batchDao = new BatchDao();
			batchDao.decreaseBatchSize(batchId);
	        String successMessage = "[User]" + user.getUsername() + " have been deleted by [SuperAdmin] " + session.getAttribute("SuperAdmin");
	        session.setAttribute("successMessage", successMessage);
			response.sendRedirect("viewUsers.jsp");
		} else {
		    // Update failed, provide error feedback and redirect
		    String errorMessage = "User deletion failed. Please try again.";
		    session.setAttribute("errorMessage", errorMessage);
		    response.sendRedirect("viewUsers.jsp"); // Redirect back to the edit page or an appropriate location
		}
	%>
</body>
</html>