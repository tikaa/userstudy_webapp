<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Study - University of New South Wales</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="style/css/main.css" rel="stylesheet">
    <script language="javascript" type="text/javascript">
        window.history.forward();
    </script>
</head>
<body onload="noBack();"
      onpageshow="if (event.persisted) noBack();" onunload="">
<%
    String[] selectedDatalist = session.getAttribute("selectedData").toString().split(",");
    String[] storeVals = request.getParameterValues("share");
    StringBuffer share_how = new StringBuffer();
    if (storeVals != null) {
        List storeList = Arrays.asList(storeVals);

        for (int i = 0; i < selectedDatalist.length; i++) {
            String currDataElement = selectedDatalist[i];
            if (storeList.contains(currDataElement)) {
                share_how.append("_" + String.valueOf(i) + "_" + currDataElement);
                share_how.append("_" + "isPreShared");
                String parameterHow = request.getParameter(currDataElement+ "howshare");
                if (parameterHow != null && !parameterHow.isEmpty() && parameterHow != "") {
                    share_how.append("_" + "howPreshared" + "_" + parameterHow);
                }

            }

        }
        session.setAttribute("share_how", share_how.toString());

    }
%>
<script>
    function validateForm() {
        var checked= [];
        var i = 0;
        <%String[] list = selectedDatalist;
            for (String s : list) {%>
             var currId = "<%=s%>";
             checked[i] = false;
            var elements = document.getElementsByName(currId);
             for(var elemN=0; elemN < elements.length; elemN++){
            if(elements[elemN].checked) {
                checked[i] = true;
            }
        }
            i++;
    <%}%>
        for (var val in checked) {
            if (checked[val] != true) {
                alert('Please set sensitivity value for all data elements');
                return false;
            }
        }
        return true;
    }
</script>

<section class="wrapper style2 special" id="two">
    <div class="inner narrow">
        <header>
            <h2 class="head-last">
                How sensitive do you think the data items you chose to collect for the
                application would be for a user who uses the application?
            </h2></header>
    </div>
    <div class="container">
        <div class="row ">
            <p>Sensitivity implies the impact of loss of data to the user. Some data may have a higher impact of loss to the user while the loss of some data may not be
            very critical for the user. Sensitivity measures this aspect of data.</p>
            <form id="form" action="set_visibility_page.jsp" onsubmit="return validateForm()" method="post" >
                <% for (int iterator = 0; iterator < selectedDatalist.length; iterator++) {
                        String currDataElemName = selectedDatalist[iterator];%>
            <table id="customers">
               <tr><th>
                <%= currDataElemName%>
                </th></tr>
                <tr><td>

                    <input type="radio" name=<%= currDataElemName%>
                            value="3"/> Highly Sensitive
                    <input type="radio" name=<%= currDataElemName%>
                            value="2"/> Somewhat Sensitive
                    <input type="radio" name=<%= currDataElemName%>
                            value="1"/> Not at all Sensitive </td></tr>
                    <%
                        }
                    %>
                </table>  <br><br>
                    <button class="button" style="vertical-align:middle" type="submit" form="form"
                            value="Submit">Next >>
                    </button>
                </form>
            </div>
        </div>
</section>
</body>
</html>
