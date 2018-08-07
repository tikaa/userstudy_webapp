<%@ page import="main.java.util.DataStorer" %>
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
                + request.getParameter("anonymity") + "how : " + request.getParameter("anonymity_how")
                + ", \n" + request.getParameter("pseudonimity")+ "how : " + request.getParameter("pseudonimity_how")
                + ", \n" + request.getParameter("encryption")+ "how : " + request.getParameter("encryption_how")
                + ", \n" + request.getParameter("unlinkability")+ "how : " + request.getParameter("unlinkability_how")
                + ", \n" + request.getParameter("obfuscation")+ "how : " + request.getParameter("obfuscation_how")
                + ", \n" + request.getParameter("undetectability")+ "how : " + request.getParameter("undetectability_how")
                + ", \n" + request.getParameter("unobservability")+ "how : " + request.getParameter("unobservability_how"));
        String emailContent = session.getAttribute("emailBody_partI").toString() + evalParams.toString() + techUsed.toString();
        String participantID = session.getAttribute("currParticipant").toString();
//        EmailSender emailSender = new EmailSender();
//        emailSender.sendEmail(emailContent);
        DataStorer dataStorer = new DataStorer();
        dataStorer.fileWriter(participantID, emailContent);
        //response.sendRedirect("data_selection_page.jsp");
        // send the email with the participants response
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
