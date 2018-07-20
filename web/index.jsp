<%@ page import="main.java.loginMgt.ParticipantIDGene" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>User Study - University of New South Wales</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="style/css/main.css" rel="stylesheet">
    <%
        String participantID = ParticipantIDGene.getInstance().idGenerator();
        request.setAttribute("id", participantID);

        //response.sendRedirect("data_selection_page.jsp");
        session.setAttribute("currParticipant", participantID);
    %>;


</head>
<body class="">
<!--begining of new css-->

<section id="banner">
    <h2 >
        Survey on Privacy Concerned Software Development
    </h2>

    <img src="style/img/unsw_small_logo.png" width="350" height="200">
    <img src="style/img/data61_logo.jpg" width="350" height="200">

</section>
<section class="wrapper special" id="one">
    <div class="inner narrow">
        <header>
            <h2 class="head-last">
                This survey is run by the University of New South Wales, Australia and Data61,
                CSIRO (Commonwealth Scientific and Industrial Research Organisation), Australia.
            </h2></header>
    </div>
    <div class="container">
        <div class="row ">
<h2>Information about the Study : </h2>
    <p >This user study explores how you, as a developer, make your decisions to collect and store user
        data when you design software applications as a software developer.

        You will be asked to perform simple tasks on selecting data items for a given application
        scenario.

        The study is expected to take approximately 30 minutes to complete. We do not collect you name
        or any other personally identifiable information from you. However, at the end of the survey
        you will be asked to fill out a demographic questionnaire which includes questions about
        your gender, age and experience as a developer. These data will be anonymized and hence cannot be traced back to you. The data will be stored in password protected
    computers within the university of New South Wales. Only the primary investigator and supervisors will have access to the data. The data will be retained for
    5 years following the use of data for publications and will be deleted and destroyed afterwards.</p>

    </br></br>
            <h2>Who Conduct the Study : </h2>

    <p>The primary researcher of this project is Awanthika Senarath, who is currently a PhD research
        student at the University of New South Wales. The project is being supervised by Dr. Nalin Asanka Gamagedara Arachchilage
        and Dr. Marthie Grobler. If you have any concerns about the content or conduct of this study please contact

        Dr. Nalin Asanka G.A via nalin.asanka@adfa.edu.au. Or
        Dr. Marthie Grobler via marthie.grobler@data61.csiro.au

        The results of this study will be written up as research papers (published in scientific journals and conferences) and also included in a PhD research
        thesis.

       </p>
            <h2>Risks Involved : </h2>
<p>
    The risks involved in participating in this study are minimal. The study has already received approval from the ethics committee at both
    the University of New South Wales and Dat61, CSIRO, Australia. </p>
            <h2>Participation : </h2>

            <p> If you are willing to participate please proceed by clicking the get started button below. By
                proceeding into the survey you give us consent to store and use the data you submit at the end of the survey.
                You can stop and exit the survey at any point by closing the web page, in which case we will not
                collect or store any data from you.

            <p>Your participant ID :<%= request.getAttribute("id") %></p>
        </div></div>
        </section>
            <section class="wrapper style2 special" id="two">
                <div class="inner">

                    <a href="introduction_page.jsp" class="button" style="vertical-align:middle" type="submit">Get started</a></header>
            </div>
</section>

</body>
</html>
