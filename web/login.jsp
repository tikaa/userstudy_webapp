<%@ page import="main.java.model.DataElement" %>
<%@ page import="javax.xml.crypto.Data" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="main.java.loginMgt.DataElemsReader" %>
<%@ page import="main.java.model.DataItems" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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




        </head>
<body>
<%!
    boolean myFunction() {
        return true;
    }
%>

<div id="home-sec">


    <div class="container" id="home">
        <div class="row text-center">
            <div class="col-md-12">
                <h2 class="head-sub-main">User Survey on Privacy Concerned Software Development</h2>
                <h3 class="head-last"> <p>Action :</p>
                    Select the Data elements from an end user you would consider collecting (to store in the app, or to share with third parties) for the
                    application scenario : </h3>
                <table>
                    <tr>
                        <th>Data Element</th>
                        <th>   </th>
                    </tr>

                <FORM ACTION="storeData.jsp" METHOD="post">
                    <%for (DataItems dataElem : DataItems.values()) {
                        String dataName = dataElem.toString();
                    %>
                   <tr><td> <INPUT TYPE="CHECKBOX" NAME="check" VALUE=<%=dataName %> ></td>
                       <td><%=dataName %></td></tr>
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
