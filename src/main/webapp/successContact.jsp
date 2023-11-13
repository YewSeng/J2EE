<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.Caltech.pojo.Contact" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Successful Contact</title>
</head>
<body>
    <h3><i>The record:</i></h3>
    
    <% 
        Contact contact = (Contact) session.getAttribute("contact");
    %>
    <br>
    <ul>
        <li><strong>Name:</strong> <%= contact.getName() %></li>
        <li><strong>Email:</strong> <%= contact.getEmail() %></li>
        <li><strong>Enquiry:</strong> <%= contact.getEnquiries() %></li>
    </ul>
    <br>
    <h3><i>has been successfully inserted!</i></h3>
    <button type="submit" class="btn btn-primary btn-center btn-router" onClick="<% response.sendRedirect(request.getContextPath() + "/home.jsp"); %>">Register</button>
</body>
</html>
