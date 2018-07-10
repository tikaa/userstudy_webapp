<%@ page import="main.java.model.DataElement" %>
<%@ page import="javax.xml.crypto.Data" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="main.java.model.DataItems" %>
<%@ page import="main.java.loginMgt.DataElements" %>
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
    <script>
        function validateForm() {
            var checked=false;
            var elements = document.getElementsByName("check");
            for(var i=0; i < elements.length; i++){
                if(elements[i].checked) {
                    checked = true;
                }
            }
            if (!checked) {
                alert('At least one data item should be selected for the application design');
            }
            return checked;

        }
    </script>

</head>
<body>

<div id="home-sec">
    <div class="container" id="home">
        <div class="row text-center">
            <div class="col-md-12">
                <h2 class="head-sub-main">Survey on Privacy Concerned Software Development</h2>
            </div>
        </div>
    </div>
</div>
    <section id="services-sec">
        <div class="container">
            <div class="row ">
                <h1 class="head-last">

                    Select the Data elements from an end user you would consider collecting (to store in the app, or to
                    share with third parties) for the
                    application scenario : </h1>
                <FORM name="selectionform" ACTION="purpose_identification_page.jsp" METHOD="post" onsubmit="return validateForm()">
                    <table id="customers">

                        <%
                            for (DataItems dataElem : DataItems.values()) {
                                String dataName = dataElem.toString();
                        %>
                        <tr>
                            <td><%=dataName %>
                            </td>
                            <td><INPUT TYPE="CHECKBOX" NAME="check" style="width: 300px;" VALUE=<%=dataName %>>

                        </tr>
                        <BR><%}%>
                       </table> <br><br>
                    <INPUT TYPE="SUBMIT" class="btn btn-danger btn-lg head-btn-one" VALUE="Continue >>">
                </FORM>


            </div>
        </div>
    </section>
</body>
</html>
