<%@ page import="main.java.model.DataElement" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
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
    List<DataElement> currParticipantSelectList = Participant.getInstance().getDataElemList();
    String[] storeVals = request.getParameterValues("store");

    if (storeVals != null) {
        List storeList = Arrays.asList(storeVals);

        for (int i = 0; i < currParticipantSelectList.size(); i++) {
            DataElement currDataElement = currParticipantSelectList.get(i);
            if (storeList.contains(currDataElement.getDataElemName())) {
                currDataElement.setPreStored(true);
                String parameterHow = request.getParameter(currDataElement.getDataElemName() + "how");
                if (parameterHow != null && parameterHow != "" && !parameterHow.isEmpty() ) {
                    currDataElement.setHowPreStored(parameterHow);
                }
                String parameterWhere = request.getParameter(currDataElement.getDataElemName() + "where");
                if ( parameterWhere != null && !parameterWhere.isEmpty()  && parameterWhere != "") {
                    currDataElement.setWherePreStored(parameterWhere);
                }
            }

        }

    }


%>

<div id="home-sec">


    <div class="container" id="home">
        <div class="row text-center">
            <div class="col-md-12">
                    <h2 class="head-sub-main">User Survey on Privacy Concerned Software Development</h2>
                    <h3 class="head-last"><p>Action :</p>
                        Select the Data elements from an end user you would consider sharing (with other parties) for
                        the application scenario.
                    </h3>
                    <table>
                        <tr>
                            <th>Data Element</th>
                            <th>   </th>
                            <th>How you share</th>

                        </tr>
                        <FORM ACTION="login_finished.jsp" METHOD="post">
                                <%for (int i =0; i<currParticipantSelectList.size(); i++) {
                            String dataName = currParticipantSelectList.get(i).getDataElemName();
                            String howShare = dataName + "howshare";

                        %>
                            <tr><td> <INPUT TYPE="CHECKBOX" NAME="share" VALUE=<%=dataName %> ></td>
                                <td><%=dataName %></td>
                                <td> <input type="text" name=<%=howShare %>  ><br></td>


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
