<%@ page import="main.java.loginMgt.ParticipantIDGene" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
        <title>User Study - University of New South Wales</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!--[if lte IE 8]><script src="../pages/css/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="style/main.css" type="text/css"/>
        <!--[if lte IE 9]><link rel="stylesheet" href="css/css/ie9.css" /><![endif]-->
    <%
        String participantID = ParticipantIDGene.getInstance().idGenerator();
        request.setAttribute("id", participantID);
        //response.sendRedirect("login.jsp");
    %>;

    <title>View Articles</title>

</head>
<body >



<section id="banner">
    <h2><strong>User Survey on Privacy Concerned Software Development</strong> </h2>

    <header class="major">
        <h1>User Survey on Privacy Concerned Software Development</h1>
    </header>

</section>
<section id="one" class="wrapper special">
    <div class="inner">

        <p>This survey is run by the University of New South Wales, Canberra, Australia</p>

        <p>This user study explores how you make your decisions to collect and store user data when you design software applications as a software developer.

            You will be asked to perform simple tasks on selecting data items for a given application scenario.

            The study is expected to take approximately 2 hours. We do not collect you name or any other personally identifiable information from you.

            We will collect some background information such as your age and experience to help us better analyze your data, however, these will be anonymized

            and hence cannot be traced back to you.</p>

        <p>I am a PhD student at the University of New South Wales, Canberra with a scholarship from Data61,  CSIRO Australia.

            This survey is a part of my PhD research.

        </p></br></br>

        <p>If you have any concerns about the content or conduct of this study please contact

            Dr. Nalin Asanka G.A via nalin.asanka@adfa.edu.au.

            If you are willing to participate please record the participant ID below and proceed. By proceeding into the survey you give us consent to store and use

        the data you submit at the end of the survey. You can survey at any point, in which case we will not receive any data from you.</p>

        <li>Participant ID : </li><b><%= request.getAttribute("id") %></b>

        <div class="sD" style="width:55px;" id="CYearHold">

        </div>
        <ul class="actions">
            <li><a href="login.jsp" class="button special">Get started</a></li>
        </ul>
    </div>
</section>



</body>
</html>
