<%@ page import="main.java.loginMgt.UserManager" %>
<%@ page import="main.java.loginMgt.User" %>
<%@ page import="main.java.loginMgt.exception.UserExistException" %>
<%@ page import="main.java.model.DataElement" %>
<%@ page import="main.java.loginMgt.DataElemsReader" %>
<%@ page import="java.util.List" %>
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


</head>
<body>
<section id="services-sec">
    <div class="container">
        <div class="row ">
            <% List<DataElement> listofSelectElems = Participant.getInstance().getDataElemList();
                for (DataElement currDE : listofSelectElems) {
                    if (currDE.isPreSelected()) {
                        String sensitivityVal = String.valueOf(currDE.getSensitivity());
                        String visibilityVal = request.getParameter(currDE.getDataElemName());
            %>
            <li>You have preSelected <%=currDE.getDataElemName()%> with a sensitivity <%= sensitivityVal%> and a visibility <%= visibilityVal%>
            </li>
            <%
                        if (visibilityVal != null) {

                            currDE.setVisibility(Integer.parseInt(visibilityVal));
                        }

                    }
                }


            %>
            <h2><strong>Select Data Items</strong></h2>
            <h6>How related do you do you think the data items are to the purpose of this application?</h6>

            <%
                for (int iterator = 0; iterator < listofSelectElems.size(); iterator++) {
                    DataElement currDataElem = listofSelectElems.get(iterator);
                    if (currDataElem.isPreSelected()) {%>
            </br></br>
            <form id="form" action="privacyRiskView.jsp" onsubmit="return myFunction()" method="post">
                <%String currDataElemName = currDataElem.getDataElemName();%>
                <li><%=currDataElemName %>
                </li>
                <input type="radio" name=<%= currDataElemName%>
                        value="5"/> Highly Related
                <input type="radio" name=<%= currDataElemName%>
                        value="4"/> Somewhat Related
                <input type="radio" name=<%= currDataElemName%>
                        value="3"/> Moderately Related
                <input type="radio" name=<%= currDataElemName%>
                        value="2"/> Not much Related
                <input type="radio" name=<%= currDataElemName%>
                        value="1"/> Mot at all Related

                <%
                        }

                    }
                %>


                <div class="buttonHolder">
                    <button class="button" type="submit" form="form"
                            value="Submit">Next >>
                    </button>
                </div>

                <%!
                    boolean myFunction() {
                        return true;
                    }
                %>
            </form>
        </div>
    </div>
</section>
</body>
</html>
