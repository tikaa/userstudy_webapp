<%@ page import="main.java.model.DataElement" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="main.java.loginMgt.Participant" %>
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
<body onload="noBack();"
      onpageshow="if (event.persisted) noBack();" onunload="">
<%!


    boolean myFunction() {
        return true;
    }
%>

<%
    String[] selectVals = request.getParameterValues("check");
    List<DataElement> currParticipantDataElemList = new ArrayList<>();
    int numofSelectItems = 0;
request.getParameter("selectvals");
    if (true) {
        if (selectVals != null) {
            List selectList = Arrays.asList(selectVals);

            for (int i = 0; i < selectList.size(); i++) {

                numofSelectItems++;

                DataElement currDataElem = new DataElement();
                currDataElem.setDataElemName(String.valueOf(selectList.get(i)));
                currDataElem.setPreSelected(true);
                currParticipantDataElemList.add(currDataElem);

            }
           Participant.getInstance().setDataElemList(currParticipantDataElemList);
        }
        request.setAttribute("numOfSelectVals", numofSelectItems);
    }

%>

<div id="home-sec">


    <div class="container" id="home">
        <div class="row text-center">
            <div class="col-md-12">

                    <h2 class="head-sub-main">User Survey on Privacy Concerned Software Development</h2>
                    <h3 class="head-last"> <p>Action :</p>
                        Select the Data elements from an end user you would consider storing (in the app, cloud, user's device) for the
                        application scenario : </h3>
                <table>
                    <tr>
                        <th>Data Element</th>
                        <th>   </th>
                        <th>How to Store</th>
                        <th>Where to Store</th>
                    </tr>
                    <FORM ACTION="share.jsp" METHOD="post">
                        <%for (int i =0; i<currParticipantDataElemList.size(); i++) {
                            String dataName = currParticipantDataElemList.get(i).getDataElemName();
                            String howStore = dataName + "how";
                            String whereStore = dataName + "where";
                        %>
                        <tr><td> <INPUT TYPE="CHECKBOX" NAME="store" VALUE=<%=dataName %> ></td>
                            <td><%=dataName %></td>
                            <td> <input type="text" name=<%=howStore %>  ><br></td>
                            <td> <input type="text" name=<%=whereStore%><br></td></tr>

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
