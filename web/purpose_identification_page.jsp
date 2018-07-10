<%@ page import="main.java.model.DataElement" %>
<%@ page import="javax.xml.crypto.Data" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="main.java.model.DataItems" %>
<%@ page import="main.java.loginMgt.Participant" %>
<%@ page import="java.util.ArrayList" %>
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
    <%
        String[] selectVals = request.getParameterValues("check");
        List<DataElement> currParticipantDataElemList = new ArrayList<>();
        List selectList = null;
        if (true) {
            if (selectVals != null) {
                selectList = Arrays.asList(selectVals);
                for (int i = 0; i < selectList.size(); i++) {

                    DataElement currDataElem = new DataElement();
                    currDataElem.setDataElemName(String.valueOf(selectList.get(i)));
                    currDataElem.setPreSelected(true);
                    currParticipantDataElemList.add(currDataElem);
                }
                Participant.getInstance().setDataElemList(currParticipantDataElemList);
            }
        }
    %>
    <script>
        function validateForm() {
            <%  StringBuffer sb = new StringBuffer();
                sb.append("[");
            if (selectVals != null) {
                selectList = Arrays.asList(selectVals);
                for (int i = 0; i < selectList.size(); i++) {
                    //generating the json array for javascript function
                        sb.append("\"").append(String.valueOf(selectList.get(i))).append("\"");
                        if (i < selectList.size()) {
                            sb.append(",");
                        }

                }
                sb.append("]");
                }
                %>
            var listofItems = <%=sb%>
            var arrayLength = listofItems.length;
            for (var i = 0; i < arrayLength; i++) {
                var x = document.forms["purposeForm"][listofItems[i] + "purpose"].value;
                if (x == "") {
                    alert("Purpose for using the data item " + listofItems[i] + " must be filled out");
                    return false;
                }
            }

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
                Clearly identify the purpose for your decision to collect each of the data items you selected before
                :
            </h1>
            <table id="customers">
                <tr>
                    <th>Data Element</th>
                    <th> Purpose for Collection</th>
                </tr>

                <FORM name="purposeForm" ACTION="store_data_page.jsp" METHOD="post" onsubmit="return validateForm()">
                        <%
                    if(selectList != null) {
                    for (int i =0; i<selectList.size(); i++) {
                        String dataName = selectList.get(i).toString();
                        String purpose = dataName + "purpose";
                    %>
                    <tr>
                        <td><%=dataName %>
                        </td>
                        <td><input type="text" name=<%=purpose %>><br></td>
                    </tr>
                    <BR>
                        <%}
}%>
            </table>
            <INPUT TYPE="SUBMIT" class="btn btn-danger btn-lg head-btn-one" VALUE="Continue >>">
            </FORM>
        </div>
    </div>
</section>

<br><br>

</body>
</html>
