<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="contact-us.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <title>Contact</title>
</head>
<body>
    <h1>Contact Us</h1>
    <br>
    <p><i><b>Have any burning questions unanswered? Contact us now!</b></i></p>
    <div class="center-container">
        <div class="form-group">
            <form action="contactController.jsp" method="post">
                <b><label for="name">Name:</label></b><br>
                <input type="text" name="name" id="name" placeholder="Enter Your Name" required><br>
                <b><label for="email">Email:</label></b><br>
                <input type="email" name="email" id="email" placeholder="Enter Your Email" required><br>
                <b><label for="request">Enquiries:</label></b><br>
                <b><textarea name="request" id="request" cols="60" rows="5" class="no-resize" required>Lorem Ipsum</textarea></b><br>
                <input type="submit" id="contactButton" class="form-control form-control-color" value="Enquire Now">
            </form>
        </div>
    </div>  
</body>
</html>
