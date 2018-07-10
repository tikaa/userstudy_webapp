<%@ page import="main.java.loginMgt.ParticipantIDGene" %>
<%@ page import="main.java.loginMgt.Participant" %>
<%@ page import="main.java.model.DataElement" %>
<%@ page import="java.util.List" %>
<%@ page import="main.java.util.EmailSender" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>User Study - University of New South Wales</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <![endif]-->
    <title>Research Survey - University of New South Wales, Australia </title>
    <!--REQUIRED STYLE SHEETS-->
    <!-- BOOTSTRAP CORE STYLE CSS -->
    <link href="style/css/bootstrap.css" rel="stylesheet"/>
    <!-- FONTAWESOME STYLE CSS -->
    <link href="style/css/font-awesome.min.css" rel="stylesheet"/>
    <!--ANIMATED FONTAWESOME STYLE CSS -->
    <link href="style/css/font-awesome-animation.css" rel="stylesheet"/>
    <!-- CUSTOM STYLE CSS -->
    <link href="style/css/style.css" rel="stylesheet"/>
    <!-- GOOGLE FONT -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

    <%
        Participant currParticipant = Participant.getInstance();
        if (request.getParameter("better")!= null) {
            currParticipant.setDecideBetter(Integer.parseInt(request.getParameter("better")));
        }
        if(request.getParameter("interesting")!= null) {
            currParticipant.setInteresting(Integer.parseInt(request.getParameter("interesting")));
        }if(request.getParameter("ease")!= null) {
        currParticipant.setEaseOfInteraction(Integer.parseInt(request.getParameter("ease")));
        }
        if(request.getParameter("quickly")!= null) {
        currParticipant.setDecideQuickly(Integer.parseInt(request.getParameter("quickly")));
        }
        if(request.getParameter("informed")!= null) {
        currParticipant.setPrivacyInformed(Integer.parseInt(request.getParameter("informed")));
        }
        if(request.getParameter("likely")!= null) {
        currParticipant.setHowLikelyToUse(Integer.parseInt(request.getParameter("likely")));
        }
        if(request.getParameter("skills")!= null) {
        currParticipant.setNecessarySkills(Integer.parseInt(request.getParameter("skills")));
        }
        if(request.getParameter("ease")!= null) {
        currParticipant.setEaseOfInteraction(Integer.parseInt(request.getParameter("ease")));
        }
        if(request.getParameter("enjoyable")!= null) {
        currParticipant.setEnjoyable(Integer.parseInt(request.getParameter("enjoyable")));
        }
        if(request.getParameter("clear")!= null) {
        currParticipant.setClarity(Integer.parseInt(request.getParameter("clear")));
        }
        if(request.getParameter("effort") != null) {
            currParticipant.setMentalEffort(Integer.parseInt(request.getParameter("effort")));
        }
        //response.sendRedirect("data_selection_page.jsp");
    // send the email with the participants response
        EmailSender emailSender = new EmailSender();
        emailSender.sendEmail();
    %>;



</head>
<body>





<div id="home-sec">


    <div class="container" id="home">
        <div class="row text-center">
            <div class="col-md-12">
                <h2 class="head-sub-main">Survey on Privacy Concerned Software Development</h2>
                <h3 class="head-last"> <p></p>
                    Thank you for participating in our survey. </h3>

                <img src="style/img/unsw_small_logo.png" width="350" height="200">
                <img src="style/img/data61_logo.jpg" width="350" height="200">


            </div>
        </div>
    </div>
</div>

<br><br>


</body>
</html>
