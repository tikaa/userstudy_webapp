<%@ page import="main.java.model.DataElement" %>
<%@ page import="java.util.List" %>
<%@ page import="main.java.loginMgt.DataElemsReader" %>
<%@ page import="java.util.Arrays" %>
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
<body onload="noBack();"
      onpageshow="if (event.persisted) noBack();" onunload="">
<%
    List<DataElement> currDataElemList = Participant.getInstance().getDataElemList();
    String[] storeVals = request.getParameterValues("share");

    if (storeVals != null) {
        List storeList = Arrays.asList(storeVals);

        for (int i = 0; i < currDataElemList.size(); i++) {
            DataElement currDataElement = currDataElemList.get(i);
            if (storeList.contains(currDataElement.getDataElemName())) {
                currDataElement.setPreShared(true);
                String parameterHow = request.getParameter(currDataElement.getDataElemName() + "howshare");
                if (parameterHow != null && !parameterHow.isEmpty() && parameterHow != "") {
                    currDataElement.setHowPreShared(parameterHow);
                }

            }

        }

    }
%>


<section id="banner">
    <h2><strong>Select Data Items</strong></h2>
    <h6>How sensitive do you think the data you decided to collect would be to the end user?</h6>

</section>


<section id="services-sec">
    <div class="container">
        <div class="row ">
            <% for (int iterator = 0; iterator < currDataElemList.size(); iterator++) {
                if (currDataElemList.get(iterator).isPreSelected()) {
                    String currDataElemName = currDataElemList.get(iterator).getDataElemName();%>

            <li><%= currDataElemName%>
            </li>
            <form id="form" action="register.jsp" onsubmit="return myFunction()" method="post">

                <input type="radio"
                       name=<%=currDataElemName%>
                               value="5"/> Highly Sensitive
                <input type="radio"
                       name=<%=currDataElemName%>
                               value="4"/> Somewhat Sensitive
                <input type="radio"
                       name=<%=currDataElemName%>
                               value="3"/> Moderately Sensitive
                <input type="radio"
                       name=<%=currDataElemName%>
                               value="2"/> Not much Sensitive
                <input type="radio"
                       name=<%=currDataElemName%>
                               value="1"/> Mot at all Sensitive

                <%

                        }
                    }

                %>


                <div class="buttonHolder">
                    <button class="button" type="submit" form="form"
                            value="Submit">Next >>
                    </button>
                </div>

            </form>
        </div>
    </div>
</section>
</body>
</html>
