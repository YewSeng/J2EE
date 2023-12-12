<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.Caltech.pojo.User" %>
    <%@ page import="com.Caltech.dao.UserDao" %>
    <%@ page import="com.Caltech.dao.BatchDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit User Controller</title>
</head>
<body>
	<%
		UserDao dao = new UserDao();
	 	User user = (User) session.getAttribute("user");
		int userId = Integer.parseInt(request.getParameter("id"));
		user.setUserId(userId);
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		int batchId = Integer.parseInt(request.getParameter("batch"));
		int oldBatchId = Integer.parseInt(request.getParameter("oldBatch"));
		user.setBatchId(batchId);
		if(dao.updateUser(user) > 0){
			BatchDao batchDao = new BatchDao();
			batchDao.increaseBatchSize(batchId);
			batchDao.decreaseBatchSize(oldBatchId);
			session.setAttribute("User", user);
	        String successMessage = "[User]"+ user.getUsername() + " have been updated by [SuperAdmin] " + session.getAttribute("SuperAdmin");
	        session.setAttribute("successMessage", successMessage);	        
			response.sendRedirect("viewUsers.jsp");
		}  else {
		    // Create failed, provide error feedback and redirect
		    String errorMessage = "User updation failed. Please try again.";
		    session.setAttribute("errorMessage", errorMessage);
		    response.sendRedirect("viewUsers.jsp"); // Redirect back to the edit page or an appropriate location
		}
	%>
</body>
</html>