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

    <script>
        function validateForm() {
            var checked=false;
            var elements = document.getElementsByName("store");
            for(var i=0; i < elements.length; i++){
                if(elements[i].checked) {
                    var howStore = document.getElementById(elements[i]+"how");
                    var whereStore = document.getElementById(elements[i]+"where");
                    if(howStore != null && whereStore != null) {
                        checked = true;
                    }else {
                        alert("Please select how and where you want to store " + elements[i])
                    }
                }
            }
            if (!checked) {
                alert('If you do not want to store any data item in the app, select the last option, I do not want to store any data item in the application');
            }
            return checked;

        }
    </script>
</head>
<body onload="noBack();"
      onpageshow="if (event.persisted) noBack();" onunload="">
<%
    List<DataElement> currParticipantDataElemList = Participant.getInstance().getDataElemList();
    for (int i = 0; i < currParticipantDataElemList.size(); i++) {
        DataElement currDataElement = currParticipantDataElemList.get(i);
        String parameterPurpose = request.getParameter(currDataElement.getDataElemName() + "purpose");
        currDataElement.setReasonForSelection(parameterPurpose);
    }
%>

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
                Select the Data elements from an end user you would consider storing, where you store data (third party
                database, cloud, user's
                device) and how you store data (anonymized, aggregated, encrypted etc. )
            </h1>
            <table id="customers">
                <tr>
                    <th>Data Element</th>
                    <th>Store?</th>
                    <th>How to Store</th>
                    <th>Where to Store</th>
                </tr>
                <FORM ACTION="share_data_page.jsp" METHOD="post" onsubmit="return validateForm()">
                        <%for (int i =0; i<currParticipantDataElemList.size(); i++) {
                            String dataName = currParticipantDataElemList.get(i).getDataElemName();
                            String howStore = dataName + "how";
                            String whereStore = dataName + "where";
                        %>
                    <tr>
                        <td><%=dataName %>
                        </td>
                        <td><INPUT TYPE="CHECKBOX" NAME="store" VALUE=<%=dataName %>></td>

                        <td><input type="text" name=<%=howStore %>><br></td>
                        <td><input type="text" name=<%=whereStore%><br></td>
                    </tr>

                    <BR>
                        <%}%>
            </table>
            I do not want to store any data item in the application  <td><INPUT TYPE="CHECKBOX" NAME="store" VALUE="noData"></td>
            <INPUT TYPE="SUBMIT" class="btn btn-danger btn-lg head-btn-one" VALUE="Continue >>">
            </FORM>


        </div>
    </div>
</section>
<br><br>

</body>
</html>
