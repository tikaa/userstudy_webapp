<%@ page import="main.java.loginMgt.ParticipantIDGene" %>
<%@ page import="main.java.loginMgt.Participant" %>
<%@ page import="main.java.model.DataElement" %>
<%@ page import="java.util.List" %>
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
        currParticipant.setChangingDesign(true);
        List<DataElement> currDataElemList = Participant.getInstance().getDataElemList();
        //response.sendRedirect("login.jsp");
    %>;



</head>
<body>





<div id="home-sec">


    <div class="container" id="home">
        <div class="row text-center">
            <div class="col-md-12">
                <h2 class="head-sub-main">User Survey on Privacy Concerned Software Development</h2>
                <h3 class="head-last"> <p>Action :</p>
                    Record how you would change your decisions in data collection (to store in the app, or to share with third parties) for the
                    application scenario : </h3>
                <table>
                    <tr>
                        <th>Data Element</th>
                        <th>  Share </th>
                        <th>  How you share </th>
                        <th>  Store </th>
                        <th>  Where you store </th>
                        <th>  How you store </th>
                    </tr>

                    <FORM ACTION="eval_process.jsp" METHOD="post">
                            <%for (int i=0; i< currDataElemList.size();i++) {
                        String dataName = currDataElemList.get(i).getDataElemName();
                        String howShare = dataName + "howshare";
                        String howStore = dataName + "howstore";
                        String whereStore = dataName + "wherestore";
                    %>
                        <tr>
                                <td><%=dataName %></td>
                            <td> <INPUT TYPE="CHECKBOX" NAME="share" VALUE=<%=dataName %> ></td>
                            <td> <input type="text" name=<%=howShare %>  ><br></td>
                            <td> <INPUT TYPE="CHECKBOX" NAME="store" VALUE=<%=dataName %> ></td>
                            <td> <input type="text" name=<%=howStore %>  ><br></td>
                            <td> <input type="text" name=<%=whereStore %>  ><br></td>
                        </tr>
                        <BR>
                            <%}%> </table>
                <INPUT TYPE="SUBMIT" class="btn btn-danger btn-lg head-btn-one" VALUE="Submit">
                </FORM>


            </div>
        </div>
    </div>
</div>

<br><br>


</body>
</html>
