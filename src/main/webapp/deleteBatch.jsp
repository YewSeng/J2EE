<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="com.Caltech.pojo.Batch" %>
<%@ page import="com.Caltech.pojo.Admin" %>
<%@ page import="com.Caltech.dao.BatchDao" %>
<%
    // Check if the user has Super Admin privileges
    if (session.getAttribute("SuperAdmin") == null) { 
        String errorMessage = "You do not have Super Admin Privilege! Unauthorized Access!";
        session.setAttribute("errorMessage", errorMessage);
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
    crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="editAdmin.css">
<title>Delete Batch</title>
</head>
<body>
    <%
	    int batchId = Integer.parseInt(request.getParameter("batchId"));
		
	    // Fetch user details from the database based on userId
	    BatchDao batchDao = new BatchDao();
	    Batch batch = batchDao.getBatch(batchId);
	
	    // Set the user object in the session for other operations
	    session.setAttribute("batch", batch);
    %>
    <h1>Delete Batch</h1>
    <button type="submit" class="btn btn-primary btn-center btn-router" onClick="window.location.href='<%= request.getContextPath() %>/viewBatches.jsp';">View Batches</button>
    <br>
    <!-- Display the adminId as needed or perform the delete operation -->
    <div class="center-container">
        <div class="form-group">
            <form action="deleteBatchController.jsp" method="post">
                <label for="id"><b>BATCH ID:</b></label><br>
                <input type="number" name="id" placeholder="Batch ID" value="<%= batch.getBatchId() %>" readonly><br>
				<label for="username"><b>Tutor:</b></label><br>
                <input type="text" name="username" placeholder="Admin's Username" value="<%= batch.getAdmin().getAdminUsername() %>" readonly><br><br> 
                <label for="classTiming"><b>Day of Class:</b></label><br>
                <input type="text" name="classTiming" placeholder="Day of Class Conduct" value="<%= batch.getClassTiming() %>" readonly><br><br>    
                <label for="preference"><b>Preference of Week:</b></label><br>
                <input type="text" name="preference" placeholder="Preference of Day of Class Conduct" value="<%= batch.getPreference() %>" readonly><br><br>    
                <label for="classStart"><b>Class Start Timing:</b></label><br>
                <input type="text" name="classStart" placeholder="Class Start" value="<%= batch.getClassStartTime() %>" readonly><br><br>    
                <label for="classEnd"><b>Class End Timing:</b></label><br>
                <input type="text" name="classEnd" placeholder="Class End" value="<%= batch.getClassEndTime() %>" readonly><br><br>  
                <input type="submit" id="deleteBatchButton" class="form-control form-control-color" value="Delete Batch">
            </form>
        </div>
    </div>
</body>
</html>
