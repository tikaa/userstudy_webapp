<%@ page import="main.java.util.DataStorer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>User Study - University of New South Wales</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="style/css/main.css" rel="stylesheet">
    <%
        String sessionToken = session.getAttribute("csrf_token").toString();
        String formSubmittedToken = request.getParameter("_csrf");
        if(!sessionToken.equals(formSubmittedToken)) {
            session.invalidate();
            String redirectURL = "error_page.jsp";
            response.sendRedirect(redirectURL);
        }
        StringBuffer evalParams = new StringBuffer();
        if (request.getParameter("age")!= null) {
            evalParams.append("\n Participant's age" + request.getParameter("age"));
        } if (request.getParameter("gender")!= null) {
            evalParams.append("\n Participant's gender" + request.getParameter("gender"));
        } if (request.getParameter("occupation")!= null) {
            evalParams.append("\n Participant's occupation" + request.getParameter("occupation"));
        } if (request.getParameter("experience")!= null) {
            evalParams.append("\n Participant's experience" + request.getParameter("experience"));
        }
        StringBuffer techUsed = new StringBuffer();
        techUsed.append("\n Techniques Used by the Participant \n"
              + "risk_helped_" + request.getParameter("risk_helped")
              + "_anonymity_" + request.getParameter("anonymity_how")
                + ", \n" + "_pseudonimity_" + request.getParameter("pseudonimity_how")
                + ", \n" + "_encryption_" + request.getParameter("encryption_how")
                + ", \n" + "_unlinkability_" + request.getParameter("unlinkability_how")
                + ", \n" + "_obfuscation_" + request.getParameter("obfuscation_how")
                + ", \n" + "_undetectability_" + request.getParameter("undetectability_how")
                + ", \n" + "_unobservability_" + request.getParameter("unobservability_how"));
        java.util.Date date = new java.util.Date();
        String dateTime = date.toString();
        String emailContent = dateTime + session.getAttribute("emailBody_partI").toString() + evalParams.toString() + techUsed.toString();
        String participantID = session.getAttribute("currParticipant").toString();
//        EmailSender emailSender = new EmailSender();
//        emailSender.sendEmail(emailContent);
        DataStorer dataStorer = new DataStorer();
        dataStorer.fileWriter(participantID, emailContent);
        //response.sendRedirect("data_selection_page.jsp");
        // send the email with the participants response
        session.invalidate();
    %>;
</head>
<body>
<section id="banner">
    <h2 >
        Thank you for Participating in our survey!
    </h2>

    <img src="style/img/unsw_logo.jpg" width="350" height="200">
    <img src="style/img/data61_logo.jpg" width="350" height="200">


</section>

</body>
</html>
