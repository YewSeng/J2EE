<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.Caltech.pojo.*" %>
<%@ page import="com.Caltech.dao.BatchDao" %>
<%@ page import="com.Caltech.dao.AdminDao" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Batch Controller</title>
</head>
<body>
    <%
        AdminDao adminDao = new AdminDao();
        String adminUsername = request.getParameter("adminUsername");
		Admin admin = adminDao.getAdminByUsername(adminUsername);
		
        BatchDao dao = new BatchDao();
        Batch batch = new Batch();

        if (admin != null) { // Check if admin is not null
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
            batch.setCurrentSize(0);

            if (dao.insertBatch(batch) > 0) {
                session.setAttribute("Batch", batch);
                String successMessage = "[Batch]" + batch.getClassStartTime() + " - " + batch.getClassEndTime() + " | "
                        + batch.getClassTiming() + " | " + batch.getPreference() + " is taught by "
                        + batch.getAdmin().getAdminUsername() + " have been created by [SuperAdmin] "
                        + session.getAttribute("SuperAdmin");
                session.setAttribute("successMessage", successMessage);
                response.sendRedirect("viewBatches.jsp");
            } else {
                // Create failed, provide error feedback and redirect
                String errorMessage = "Batch creation failed. Please try again.";
                session.setAttribute("errorMessage", errorMessage);
                response.sendRedirect("viewBatches.jsp"); // Redirect back to the edit page or an appropriate location
            }
        } else {
            // Handle the case where admin is null
            String errorMessage = "Admin not found. Please select a valid admin.";
            session.setAttribute("errorMessage", errorMessage);
            response.sendRedirect("viewBatches.jsp"); // Redirect back to the edit page or an appropriate location
        }
    %>
</body>
</html>
