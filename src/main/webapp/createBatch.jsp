<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.Caltech.pojo.Admin" %>
<%@ page import="com.Caltech.dao.AdminDao" %>
<%@ page import="com.Caltech.pojo.TimeOfDay" %>
<%@ page import="com.Caltech.pojo.PreferenceDay" %>
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="createBatch.css">
    <script src="createBatch.js"></script>
    <title>SuperAdmin - Create Batch</title>
</head>
<body>
    <h1>Create Batch</h1>
    <button type="submit" class="btn btn-primary btn-router" style="display: block; margin: 0 auto;" onClick="window.location.href='<%= request.getContextPath() %>/SuperAdminHome.jsp';">Super Admin Home</button><br>
    <br>
    <div class="ctr-container">
        <div class="form-group">
            <form action="createBatchController.jsp" method="post">
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
                <input type="submit" id="createBatchButton" class="form-control form-control-color" value="Create Batch">
            </form>
        </div>
    </div>
</body>
</html>
