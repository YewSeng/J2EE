<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.Caltech.pojo.*" %>
    <%@ page import="com.Caltech.dao.BatchDao" %>
    <%@ page import="com.Caltech.dao.AdminDao" %>
    <%@ page import="java.time.LocalDateTime" %>  
    <%@ page import="java.time.format.DateTimeFormatter" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Batch Controller</title>
</head>
<body>
<%
		String adminUsername = request.getParameter("adminUsername");
		AdminDao adminDao = new AdminDao();
		Admin admin = adminDao.getAdminByUsername(adminUsername); 
		BatchDao dao = new BatchDao();
		Batch batch = (Batch) session.getAttribute("batch");
		int batchId = Integer.parseInt(request.getParameter("id"));
		batch.setBatchId(batchId);
		batch.setAdmin(admin);
		batch.setClassTiming(TimeOfDay.valueOf(request.getParameter("classTiming")));
		batch.setPreference(PreferenceDay.valueOf(request.getParameter("preference")));
        String classStartTimeString = request.getParameter("classStartTime");
        String classEndTimeString = request.getParameter("classEndTime");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        LocalDateTime classStartTime = LocalDateTime.parse(classStartTimeString, formatter);
        LocalDateTime classEndTime = LocalDateTime.parse(classEndTimeString, formatter);
        batch.setClassStartTime(classStartTime);
        batch.setClassEndTime(classEndTime);
		if(dao.updateBatch(batch) > 0){
			session.setAttribute("Batch", batch);
	        String successMessage = "[Batch]"+batch.getBatchId() + " | Tutor: " +  batch.getAdmin().getAdminUsername() + " | " + batch.getClassTiming() + " | " + batch.getPreference() + " | " + batch.getClassStartTime() + " | " + batch.getClassEndTime() + " have been updated by [SuperAdmin] " + session.getAttribute("SuperAdmin");
	        session.setAttribute("successMessage", successMessage);
			response.sendRedirect("viewBatches.jsp");
		} else {
		    // Update failed, provide error feedback and redirect
		    String errorMessage = "Batch update failed. Please try again.";
		    session.setAttribute("errorMessage", errorMessage);
		    response.sendRedirect("viewBatches.jsp"); // Redirect back to the edit page or an appropriate location
		}
	%>
</body>
</html>