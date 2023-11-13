<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.Caltech.pojo.*" %>
<%@ page import="com.Caltech.dao.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri='http://java.sun.com/jstl/core' prefix='c' %> 
    <%
    // Check if the user has Admin privileges
    if (session.getAttribute("Admin") == null) { 
        String errorMessage = "You do not have Admin Privilege! Unauthorized Access!";
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
<title>View Students</title>
</head>
<body>
	<h1 class="center-text">Students in Class <% int batchAdminId = Integer.parseInt(request.getParameter("batchId")); out.print(batchAdminId); %></h1>
	   <!-- Create a table to display students -->
	<div class="center-container">
    <table class="table table-hover" border="2" width="75%">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Student Name (Username)</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Retrieve students for a specific batch (adjust the batchId as needed)
                int batchId = Integer.parseInt(request.getParameter("batchId"));
                UserDao dao = new UserDao();
                List<User> students = dao.getUsersByBatch(batchId);
                request.setAttribute("user", students);   
            %>
            <c:forEach items="${requestScope.user}" var="u">
                <tr>
                    <th scope="row"><c:out value="${u.userId}"></c:out></th>
                    <td><c:out value="${u.username}"></c:out></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    </div>
    <button type="submit" class="btn btn-primary btn-router" style="display: block; margin: 0 auto;" onClick="window.location.href='<%= request.getContextPath() %>/AdminHome.jsp';">Admin Home</button><br>
</body>
</html>