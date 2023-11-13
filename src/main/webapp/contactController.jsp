<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.Caltech.pojo.Contact" %>
    <%@ page import="com.Caltech.dao.ContactDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Results</title>
</head>
<body>
	<%
		ContactDao dao = new ContactDao();
		Contact contact=new Contact();
		contact.setName(request.getParameter("name"));
		contact.setEmail(request.getParameter("email"));
		contact.setEnquiries(request.getParameter("request"));
		if(dao.insertEnquiries(contact) > 0){
			session.setAttribute("contact", contact);
	        String successMessage = "[User]"+ contact.getName() + " enquiries have been recorded";
	        session.setAttribute("successMessage", successMessage);
			response.sendRedirect("successContact.jsp");
		}
	%>
</body>
</html>