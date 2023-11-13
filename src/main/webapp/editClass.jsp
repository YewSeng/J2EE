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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
        crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="editAdmin.css">
    <script src="editUser.js"></script>
    <title>Edit User</title>
    <style>
        .user-details {
            display: flex;
            justify-content: space-between;
        }
        .user-details .old-details,
        .user-details .new-details {
            width: 65%; /* Adjust the width as needed */
        }
        .user-details .old-details {
            padding: 10px;
        }
        .user-details .new-details {
            padding: 10px;
        }
    </style>
</head>
<body>
    <h1><i>Edit User Page</i></h1>
    <button type="submit" class="btn btn-primary btn-center btn-router" onClick="window.location.href='<%= request.getContextPath() %>/viewUserClass.jsp';">View Class</button>
    <h2>Batch Details</h2>
    <%
	    int batchId = Integer.parseInt(request.getParameter("batchId"));
		
	    // Fetch user details from the database based on userId
	    UserDao userDao = new UserDao();
	    User user = userDao.getUserByBatchId(batchId);
	
	    // Set the user object in the session for other operations
	    session.setAttribute("user", user);
    %>
    <div class="batch-details">
        <div class="old-details">
        	<h3>Old Details</h3>
        	<form>
                <label for="oldId"><b>USER ID:</b></label><br>
                <input type="number" name="oldId" placeholder="User ID" value="<%= user.getUserId() %>" readonly><br>
                <label for="oldUsername"><b>OLD USERNAME:</b></label><br>
                <input type="text" name="oldUsername" placeholder="Username" value="<%= user.getUsername() %>" readonly><br>
                <label for="oldPassword"><b>OLD PASSWORD:</b></label><br>
                <input type="text" name="oldPassword" placeholder="Admin's New Password" value="NULL" readonly><br>
                <label for="oldBatch"><b>BATCH ID:</b></label><br>
                <input type="number" name="oldBatch" placeholder="Old Batch ID" value="<%= user.getBatchId() %>" readonly><br><br>    
            </form>
        </div>
        <div class="new-details">
            <h3>New Details</h3>
            <form action="editClassController.jsp" method="post">
                <label for="id"><b>USER ID:</b></label><br>
                <input type="number" name="id" placeholder="User ID" value="<%= user.getUserId() %>" readonly><br>
                <label for="username"><b>NEW USERNAME:</b></label><br>
                <input type="text" name="username" placeholder="Enter new username" required><br>
                <div id="usernameError" class="error-message text-danger"></div>
                <label for="password"><b>Password:</b></label><br>
                <input type="password" class="form-control" name="password" id="password" aria-describedby="emailHelp" placeholder="Create User password" required><br>
                <div id="passwordError" class="error-message text-danger"></div>
                <label for="showPassword"><b>Show Password</b></label>
                <input type="checkbox" id="showPassword" name="showPassword" onclick="togglePasswordVisibility('showPassword', 'password')"><br>
                <label for="batch"><b>BATCH:</b></label>
			    <select class="form-control" id="batch" name="batch" required>
	                <c:forEach items="${batch}" var="b">
	                    <option value="<c:out value="${b.batchId}"></c:out>">
	                    	<c:out value="${b.batchId} - ${b.admin.adminUsername} - ${b.classTiming} - ${b.preference} - ${b.classStartTime} - ${b.classEndTime} - ${b.currentSize}"></c:out>
	                    </option>
	                </c:forEach>
	            </select>
	            <label for="oldBatch"><b>BATCH ID:</b></label><br>
                <input type="number" name="oldBatch" placeholder="Old Batch ID" value="<%= user.getBatchId() %>" readonly><br><br>    
                <input type="submit" id="updateUserButton" class="form-control form-control-color" value="Update User">
            </form>
        </div>
    </div>  
    
       <!-- JavaScript function to toggle password visibility -->
    <script>
        function togglePasswordVisibility(checkboxId, passwordId) {
            var checkbox = document.getElementById(checkboxId);
            var passwordInput = document.getElementsByName(passwordId)[0];
            if (checkbox.checked) {
                passwordInput.type = "text";
            } else {
                passwordInput.type = "password";
            }
        }
    </script>
</body>
</html>