<%@ page import="main.java.util.EmailSender" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>User Study - University of New South Wales</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="style/css/main.css" rel="stylesheet">

    <%
        StringBuffer evalParams = new StringBuffer();
        if (request.getParameter("age")!= null) {
            evalParams.append("\n Participant's age" + Integer.parseInt(request.getParameter("age")));
        } if (request.getParameter("gender")!= null) {
            evalParams.append("\n Participant's gender" + Integer.parseInt(request.getParameter("gender")));
        } if (request.getParameter("occupation")!= null) {
            evalParams.append("\n Participant's occupation" + Integer.parseInt(request.getParameter("occupation")));
        } if (request.getParameter("experience")!= null) {
            evalParams.append("\n Participant's experience" + Integer.parseInt(request.getParameter("experience")));
        }
        EmailSender emailSender = new EmailSender();
        emailSender.sendEmail(session.getAttribute("emailBody_partI").toString() + evalParams.toString());
        //response.sendRedirect("data_selection_page.jsp");
        // send the email with the participants response
    %>;
</head>
<body>
<section id="banner">
    <h2 >
        Thank you for Participating in our survey!
    </h2>

    <img src="style/img/unsw_small_logo.png" width="350" height="200">
    <img src="style/img/data61_logo.jpg" width="350" height="200">


</section>

</body>
</html>
