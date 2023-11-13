<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.Caltech.pojo.*" %>
<%@ page import="com.Caltech.dao.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri='http://java.sun.com/jstl/core' prefix='c' %> 
<%
    // Check if the user has Super Admin privileges
    if (session.getAttribute("SuperAdmin") == null) { 
        String errorMessage = "You do not have Super Admin Privilege! Unauthorized Access!";
        session.setAttribute("errorMessage", errorMessage);
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
	AdminDao dao = new AdminDao();
	List<Admin> admins = dao.retrieveAdmin();
	request.setAttribute("admin", admins);
	
	TimeOfDay[] classTimingValues = TimeOfDay.values();
	PreferenceDay[] preferenceValues = PreferenceDay.values();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
        crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="editAdmin.css">
    <script src="editBatch.js"></script>
    <title>Edit Batch</title>
    <style>
        .batch-details {
            display: flex;
            justify-content: space-between;
        }
        .batch-details .old-details,
        .batch-details .new-details {
            width: 65%; /* Adjust the width as needed */
        }
        .batch-details .old-details {
            padding: 10px;
        }
        .batch-details .new-details {
            padding: 10px;
        }
    </style>
</head>
<body>
    <h1><i>Edit Batch Page</i></h1>
    <button type="submit" class="btn btn-primary btn-center btn-router" onClick="window.location.href='<%= request.getContextPath() %>/viewBatches.jsp';">View Batches</button>
    <h2>Batch Details</h2>
    <%
	    int batchId = Integer.parseInt(request.getParameter("batchId"));
		
	    // Fetch user details from the database based on userId
	    BatchDao batchDao = new BatchDao();
	    Batch batch = batchDao.getBatch(batchId);
	
	    // Set the user object in the session for other operations
	    session.setAttribute("batch", batch);
    %>
    <div class="batch-details">
        <div class="old-details">
        	<h3>Old Details</h3>
        	<form>
                <label for="oldId"><b>BATCH ID:</b></label><br>
                <input type="number" name="oldId" placeholder="Admin ID" value="<%= batch.getBatchId() %>" readonly><br>
                <label for="oldUsername"><b>OLD ADMIN USERNAME:</b></label><br>
                <input type="text" name="oldUsername" placeholder="Admin's New Username" value="<%= batch.getAdmin().getAdminUsername() %>" readonly><br>
                <label for="classTiming"><b>Day of Class:</b></label><br>
                <input type="text" name="classTiming" placeholder="Day of Class Conduct" value="<%= batch.getClassTiming() %>" readonly><br><br>    
                <label for="preference"><b>Preference of Week:</b></label><br>
                <input type="text" name="preference" placeholder="Preference of Day of Class Conduct" value="<%= batch.getPreference() %>" readonly><br>   
                <label for="classStart"><b>Class Start Timing:</b></label><br>
                <input type="text" name="classStart" placeholder="Class Start" value="<%= batch.getClassStartTime() %>" readonly><br>   
                <label for="classEnd"><b>Class End Timing:</b></label><br>
                <input type="text" name="classEnd" placeholder="Class End" value="<%= batch.getClassEndTime() %>" readonly><br>
            </form>
        </div>
        <div class="new-details">
            <h3>New Details</h3>
            <form action="editBatchController.jsp" method="post">
                <label for="id"><b>BATCH ID:</b></label><br>
                <input type="number" name="id" placeholder="Batch ID" value="<%= batch.getBatchId() %>" readonly><br>
                <label for="adminUsername"><b>Admin:</b></label><br>
			    <select class="form-control" name="adminUsername" id="adminUsername" required>
			        <c:forEach items="${admin}" var="a">
			            <option value="<c:out value="${a.adminUsername}"></c:out>"><c:out value="${a.adminUsername}"></c:out></option>
			        </c:forEach>
			    </select><br>

                <label for="classTiming"><b>Class Timing:</b></label><br>
                <select class="form-control" name="classTiming" id="classTiming" required>
                    <%
                        for (TimeOfDay timing : classTimingValues) {
                    %>
                        <option value="<%= timing.name() %>"><%= timing.getCustomName() %></option>
                    <%
                        }
                    %>
                </select><br>

                <label for="preference"><b>Preference:</b></label><br>
                <select class="form-control" name="preference" id="preference" required>
                    <%
                        for (PreferenceDay pref : preferenceValues) {
                    %>
                        <option value="<%= pref.name() %>"><%= pref.getCustomName() %></option>
                    <%
                        }
                    %>
                </select><br>

                <label for="classStartTime"><b>Class Start Time:</b></label><br>
                <input type="datetime-local" class="form-control" name="classStartTime" id="classStartTime" required><br>
				
                <label for="classEndTime"><b>Class End Time:</b></label><br>
                <input type="datetime-local" class="form-control" name="classEndTime" id="classEndTime" required><br>
				<div id="classTimeError" class="error-message"></div>
                <input type="submit" id="updateBatchButton" class="form-control form-control-color" value="Update Batch">
            </form>
        </div>
    </div>  
</body>
</html>