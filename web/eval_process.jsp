<%--
  Created by IntelliJ IDEA.
  User: Awanthika
  Date: 7/4/2018
  Time: 8:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>
        <%@ page import="main.java.loginMgt.ParticipantIDGene" %>
        <%@ page import="main.java.loginMgt.Participant" %>
        <%@ page import="main.java.model.DataElement" %>
        <%@ page import="java.util.List" %>
        <%@ page import="java.util.Arrays" %>
        <%@ page import="java.util.ArrayList" %>
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
                List<DataElement> changeDataElemList = Participant.getInstance().getDataElemList();
                String[] shareVals = request.getParameterValues("share");
                String[] storeVals = request.getParameterValues("share");

                if (storeVals != null) {
                    List storeList = Arrays.asList(storeVals);
                    for (int i = 0; i < changeDataElemList.size(); i++) {
                        DataElement currDataElement = changeDataElemList.get(i);
                        if (storeList.contains(currDataElement.getDataElemName())) {
                            currDataElement.setPostStored(true);
                            String parameterHow = request.getParameter(currDataElement.getDataElemName() + "howstore");
                            if (parameterHow != null && parameterHow != "" && !parameterHow.isEmpty()) {
                                currDataElement.setHowPostStored(parameterHow);
                            }
                            String parameterWhere = request.getParameter(currDataElement.getDataElemName() + "wherestore");
                            if (parameterWhere != null && !parameterWhere.isEmpty() && parameterWhere != "") {
                                currDataElement.setWherePostStored(parameterWhere);
                            }
                        }

                    }
                }

                if (shareVals != null) {
                    List shareList = Arrays.asList(shareVals);

                    for (int i = 0; i < changeDataElemList.size(); i++) {
                        DataElement currDataElement = changeDataElemList.get(i);
                        if (shareList.contains(currDataElement.getDataElemName())) {
                            currDataElement.setPostStored(true);
                            String parameterHow = request.getParameter(currDataElement.getDataElemName() + "howshare");
                            if (parameterHow != null && parameterHow != "" && !parameterHow.isEmpty()) {
                                currDataElement.setHowPostShared(parameterHow);
                            }

                        }

                    }
                }

                //response.sendRedirect("login.jsp");
            %>;


        </head>
<body>


<div id="home-sec">


    <div class="container" id="home">
        <div class="row text-center">
            <div class="col-md-12">
                <h2 class="head-sub-main">User Survey on Privacy Concerned Software Development</h2>
                <h3 class="head-last"><p>Action :</p>
                    Share you thoughts on the process you followed to understand the privacy risk of data elements.
                </h3>
                <form id="form" action="thankyou.jsp" onsubmit="return myFunction()" method="post">
                    <li>This process helped me to make my decisions on data collection, storage and sharing quickly</li>
                    <input type="radio" name="quickly"
                           value="5"/> Strongly Agree
                    <input type="radio" name="quickly"
                           value="4"/> Somewhat Agree
                    <input type="radio" name="quickly"
                           value="3"/> Somewhat Disagree
                    <input type="radio" name="quickly"
                           value="2"/> Strongly Disagree

                    <li>This process helped me to make my decisions on data collection, storage and sharing better</li>
                    <input type="radio" name="better"
                           value="5"/> Strongly Agree
                    <input type="radio" name="better"
                           value="4"/> Somewhat Agree
                    <input type="radio" name="better"
                           value="3"/> Somewhat Disagree
                    <input type="radio" name="better"
                           value="2"/> Strongly Disagree

                    <li>After following this process, I'm better informed about user privacy concerns on data.</li>
                    <input type="radio" name="informed"
                           value="5"/> Strongly Agree
                    <input type="radio" name="informed"
                           value="4"/> Somewhat Agree
                    <input type="radio" name="informed"
                           value="3"/> Somewhat Disagree
                    <input type="radio" name="informed"
                           value="2"/> Strongly Disagree

                    <li>If I'm provided with the support I am likely use this process when I design software systems.
                    </li>
                    <input type="radio" name="likely"
                           value="5"/> Strongly Agree
                    <input type="radio" name="likely"
                           value="4"/> Somewhat Agree
                    <input type="radio" name="likely"
                           value="3"/> Somewhat Disagree
                    <input type="radio" name="likely"
                           value="2"/> Strongly Disagree

                    <li>I already have the necessary skills required to follow this process.</li>
                    <input type="radio" name="skills"
                           value="5"/> Strongly Agree
                    <input type="radio" name="skills"
                           value="4"/> Somewhat Agree
                    <input type="radio" name="skills"
                           value="3"/> Somewhat Disagree
                    <input type="radio" name="skills"
                           value="2"/> Strongly Disagree

                    <li>It was easy for me to interact with this process.</li>
                    <input type="radio" name="ease"
                           value="5"/> Strongly Agree
                    <input type="radio" name="ease"
                           value="4"/> Somewhat Agree
                    <input type="radio" name="ease"
                           value="3"/> Somewhat Disagree
                    <input type="radio" name="ease"
                           value="2"/> Strongly Disagree

                    <li>It was interesting to follow this process.</li>
                    <input type="radio" name="interesting"
                           value="5"/> Strongly Agree
                    <input type="radio" name="interesting"
                           value="4"/> Somewhat Agree
                    <input type="radio" name="interesting"
                           value="3"/> Somewhat Disagree
                    <input type="radio" name="interesting"
                           value="2"/> Strongly Disagree

                    <li>Following this process was enjoyable.</li>
                    <input type="radio" name="enjoyable"
                           value="5"/> Strongly Agree
                    <input type="radio" name="enjoyable"
                           value="4"/> Somewhat Agree
                    <input type="radio" name="enjoyable"
                           value="3"/> Somewhat Disagree
                    <input type="radio" name="enjoyable"
                           value="2"/> Strongly Disagree

                    <li>Following this process was clear and easy.</li>
                    <input type="radio" name="clear"
                           value="5"/> Strongly Agree
                    <input type="radio" name="clear"
                           value="4"/> Somewhat Agree
                    <input type="radio" name="clear"
                           value="3"/> Somewhat Disagree
                    <input type="radio" name="clear"
                           value="2"/> Strongly Disagree

                    <li>Following this process required little mental effort.</li>
                    <input type="radio" name="effort"
                           value="5"/> Strongly Agree
                    <input type="radio" name="effort"
                           value="4"/> Somewhat Agree
                    <input type="radio" name="effort"
                           value="3"/> Somewhat Disagree
                    <input type="radio" name="effort"
                           value="2"/> Strongly Disagree


                    <div class="buttonHolder">
                        <button class="button" type="submit" form="form"
                                value="Submit">Next >>
                        </button>
                    </div>


                </form>


            </div>
        </div>
    </div>
</div>

<br><br>


</body>


</html>