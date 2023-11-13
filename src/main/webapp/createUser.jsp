<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
		BatchDao batchDao = new BatchDao();
		List<Batch> batches = batchDao.retrieveOpenBatches();
		request.setAttribute("batch", batches);
		
		TimeOfDay[] classTimingValues = TimeOfDay.values();
		PreferenceDay[] preferenceValues = PreferenceDay.values();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="createUser.css">
    <script src="createUser.js"></script>
    <title>SuperAdmin - Create User</title>
</head>
<body>
<h1>Create User</h1>
<button type="submit" class="btn btn-primary btn-router" style="display: block; margin: 0 auto;" onClick="window.location.href='<%= request.getContextPath() %>/SuperAdminHome.jsp';">Super Admin Home</button><br>
<br>
<div class="ctr-container">
    <div class="form-group">
        <form action="createUserController.jsp" method="post">
            <label for="batch"><b>Batch:</b></label>
            <select class="form-control" id="batch" name="batch" required>
                <c:forEach items="${batch}" var="b">
                    <option value="<c:out value="${b.batchId}"></c:out>">
                    	<c:out value="${b.batchId} - ${b.admin.adminUsername} - ${b.classTiming} - ${b.preference} - ${b.classStartTime} - ${b.classEndTime} - ${b.currentSize}"></c:out>
                    </option>
                </c:forEach>
            </select>
            <label for="username"><b>Username:</b></label><br>
            <input type="text" class="form-control" id="username" name="username" placeholder="Create Your Username" required>
            <div id="usernameError" class="error-message text-danger"></div>
            <label for="password"><b>Password:</b></label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Create Your Password" value="<%= (request.getParameter("password") != null) ? request.getParameter("password") : "" %>" required>
            <div id="passwordError" class="error-message text-danger"></div>
            <label for="showPassword"><b>Show Password</b></label>
            <input type="checkbox" id="showPassword" name="showPassword" onclick="togglePasswordVisibility('showPassword', 'password')"><br>
            <input type="submit" id="createUserButton" class="form-control form-control-color" value="Create User">
        </form>
    </div>
</div>

<script>
    // Add a script to update the hidden field with the selected batchId
    document.getElementById("batch").addEventListener("change", function () {
        var selectedBatchId = this.value;
        document.getElementById("batchId").value = selectedBatchId;
    });
</script>

</body>
</html>
