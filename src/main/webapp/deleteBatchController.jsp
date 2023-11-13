<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.Caltech.pojo.*" %>
    <%@ page import="com.Caltech.dao.BatchDao" %>
    <%@ page import="com.Caltech.dao.AdminDao" %>
    <%@ page import="java.time.LocalDateTime" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Batch Controller</title>
</head>
<body>
<%
		BatchDao dao = new BatchDao();
		Batch batch = (Batch) session.getAttribute("batch");
		String adminUsername = request.getParameter("username");
		AdminDao adminDao = new AdminDao();
        Admin admin = adminDao.getAdminByUsername(adminUsername); 
		int batchId = Integer.parseInt(request.getParameter("id"));
		batch.setBatchId(batchId);
		batch.setAdmin(admin);
		batch.setClassTiming(TimeOfDay.valueOf(request.getParameter("classTiming")));
		batch.setPreference(PreferenceDay.valueOf(request.getParameter("preference")));
		batch.setClassStartTime(LocalDateTime.parse(request.getParameter("classStart")));
		batch.setClassEndTime(LocalDateTime.parse(request.getParameter("classEnd")));
		if(dao.deleteBatch(batchId) > 0){
			session.setAttribute("Batch", batch);
	        String successMessage = "[Batch]"+batch.getBatchId() + " | Tutor: " +  batch.getAdmin().getAdminUsername() + " | " + batch.getClassTiming() + " | " + batch.getPreference() + " | " + batch.getClassStartTime() + " | " + batch.getClassEndTime() + " have been deleted by [SuperAdmin] " + session.getAttribute("SuperAdmin");
	        session.setAttribute("successMessage", successMessage);
			response.sendRedirect("viewBatches.jsp");
		} else {
		    // Update failed, provide error feedback and redirect
		    String errorMessage = "Batch deletion failed. Please try again.";
		    session.setAttribute("errorMessage", errorMessage);
		    response.sendRedirect("viewBatches.jsp"); // Redirect back to the edit page or an appropriate location
		}
	%>
</body>
</html>