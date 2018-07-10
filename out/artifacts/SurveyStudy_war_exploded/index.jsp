<%@ page import="main.java.loginMgt.ParticipantIDGene" %>
<%@ page import="main.java.loginMgt.Participant" %>
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
        String participantID = ParticipantIDGene.getInstance().idGenerator();
        request.setAttribute("id", participantID);

        Participant currParticipant = Participant.getInstance();
        currParticipant.setParticipantID(participantID);
        //response.sendRedirect("data_selection_page.jsp");
        request.setAttribute("currParticipant", currParticipant);
    %>;


</head>
<body>
<div id="home-sec">
    <div class="container" id="home">
        <div class="row text-center">
            <div class="col-md-12">
                <img src="style/img/unsw_small_logo.png" width="350" height="200">
                <img src="style/img/data61_logo.jpg" width="350" height="200">
                <h2 class="head-sub-main">Survey on Privacy Concerned Software Development</h2>
                <h3 class="head-last"><p>This survey is run by the University of New South Wales, Australia and Data61,
                    CSIRO (Commonwealth Scientific and Industrial Research Organisation), Australia.</p>

                    <p >This user study explores how you, as a developer, make your decisions to collect and store user
                        data when you design
                        software applications as a software developer.

                        You will be asked to perform simple tasks on selecting data items for a given application
                        scenario.

                        The study is expected to take approximately 30 minutes to complete. We do not collect you name
                        or any other personally
                        identifiable information from you.

                        We will collect some background information such as your age and experience to help us better
                        analyze
                        your data, however, these will be anonymized and hence cannot be traced back to you.</p>

                    </br></br>

                    <p>If you have any concerns about the content or conduct of this study please contact

                        Dr. Nalin Asanka G.A via nalin.asanka@adfa.edu.au. Or
                        Dr. Marthie Grobler via marthie.grobler@data61.csiro.au

                        If you are willing to participate please proceed by clicking the get started button below. By
                        proceeding into
                        the survey you give us consent to store and use the data you submit at the end of the survey.
                        You can stop and exit the survey at any point by closing the web page, in which case we will not
                        collect or store any data from you.</p>

                    </br><br></h3>


                <p>Please note your participant ID :<%= request.getAttribute("id") %>
                </p>

                <a href="introduction_page.jsp" class="btn btn-danger btn-lg head-btn-one" type="submit">Get started</a>
            </div>
        </div>
    </div>
</div>


</body>
</html>
