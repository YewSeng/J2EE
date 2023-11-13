<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.Caltech.pojo.*" %>
<%@ page import="com.Caltech.dao.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri='http://java.sun.com/jstl/core' prefix='c' %> 
<%
    // Check if the user has Super Admin privileges
    if (session.getAttribute("User") == null) { 
        String errorMessage = "You do not have User Privilege! Unauthorized Access!";
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
    <link rel="stylesheet" type="text/css" href="viewAdmins.css">
    <title>User - View Class</title>
</head>
<body>
    <h1 class="center-text">[<% out.print(session.getAttribute("User")); %>] Your Class Schedule List</h1>

    <!-- Display success message if available -->
    <div class="center-container">
        <div id="success" class="success-message center-text">
            <%
            String successMessage = (String) session.getAttribute("successMessage");
            if (successMessage != null) {
            %>
                <span style='color: green; font-weight: bold;'><%= successMessage %></span>
            <%
            }
            %>
        </div>
        <div id="error" class="error-message center-text">
            <%
            String errorMessage = (String) session.getAttribute("errorMessage");
            if (errorMessage != null) {
            %>
                <span style='color: red; font-weight: bold;'><%= errorMessage %></span>
            <%
            }
            %>
        </div>
    </div><br>      
    <!-- Create a table to display user's class -->
    <table class="table table-hover" border="2" width="75%">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Batch Instructor</th>
                <th scope="col">Class Timing</th>
                <th scope="col">Preference Day</th>
                <th scope="col">Class Start Time</th>
                <th scope="col">Class End Time</th>
                <th scope="col">Class Size</th>
                <th scope="col">Change Class</th>
            </tr>
        </thead>
        <tbody>
            <%
            	String username = (String) session.getAttribute("User");
            	UserDao userDao = new UserDao();
            	User user = userDao.getUserByUsername(username);

            	// Get the user's batch
            	BatchDao batchDao = new BatchDao();
            	Batch userBatch = batchDao.getBatch(user.getBatchId());
            	request.setAttribute("userBatch", userBatch);   
            %>
            <tr>
                <th scope="row"><c:out value="${userBatch.batchId}"></c:out></th>
                <td><c:out value="${userBatch.admin.adminUsername}"></c:out></td>
                <td><c:out value="${userBatch.classTiming}"></c:out></td>
                <td><c:out value="${userBatch.preference}"></c:out></td>
                <td><c:out value="${userBatch.classStartTime}"></c:out></td>
                <td><c:out value="${userBatch.classEndTime}"></c:out></td>
                <td><c:out value="${userBatch.currentSize}"></c:out></td>
                <td>
                	<c:set var="userBatch" value="${userBatch}" scope="session" />
                    <a href="editClass.jsp?batchId=<c:out value="${userBatch.batchId}"></c:out>"
                        class="btn btn-info btn-sm">Change Class</a>
                </td>
            </tr>
        </tbody>
    </table>
    <button type="submit" class="btn btn-primary btn-router" style="display: block; margin: 0 auto;" onClick="window.location.href='<%= request.getContextPath() %>/UserHome.jsp';">User Home</button><br>
</body>
</html>
