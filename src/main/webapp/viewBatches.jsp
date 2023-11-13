<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
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
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
        crossorigin="anonymous">
       <link rel="stylesheet" type="text/css" href="viewAdmins.css">
    <title>SuperAdmin - View Batches</title>
</head>
<body>
    <h1 class="center-text">Batch List</h1>

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
	  

    <!-- Create a table to display admins -->
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
                <th scope="col">Edit Batch</th>
                <th scope="col">Delete Batch</th>
            </tr>
        </thead>
        <tbody>
            <%
                BatchDao dao = new BatchDao();
                List<Batch> batches = dao.retrieveBatches();
                request.setAttribute("batch", batches);   
            %>
            <c:forEach items="${requestScope.batch}" var="b">
            <tr>
                <th scope="row"><c:out value="${b.batchId}"></c:out></th>
                <td><c:out value="${b.admin.adminUsername}"></c:out></td>
                <td><c:out value="${b.classTiming}"></c:out></td>
                <td><c:out value="${b.preference}"></c:out></td>
                <td><c:out value="${b.classStartTime}"></c:out></td>
                <td><c:out value="${b.classEndTime}"></c:out></td>
                <td><c:out value="${b.currentSize}"></c:out></td>
                <td>
                	<c:set var="batch" value="${b}" scope="session" /> 
                    <a href="editBatch.jsp?batchId=<c:out value="${b.batchId}"></c:out>"
                        class="btn btn-warning btn-sm">Edit</a>
                </td>
                <td>
                 	<c:set var="batch" value="${b}" scope="session" />
                    <a href="deleteBatch.jsp?batchId=<c:out value="${b.batchId}"></c:out>"
                        class="btn btn-danger btn-sm">Delete</a>
                </td>
            </tr>
        </tbody>
        </c:forEach>
    </table>
	<button type="submit" class="btn btn-primary btn-router" style="display: block; margin: 0 auto;" onClick="window.location.href='<%= request.getContextPath() %>/SuperAdminHome.jsp';">Super Admin Home</button><br>
</body>
</html>
