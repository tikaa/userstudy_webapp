<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="main.java.util.GenerateCSRFToken" %>
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
    function escapeHtml(unsafe) {
        return unsafe
            .replace(/&/g, "&amp;")
            .replace(/</g, "&lt;")
            .replace(/>/g, "&gt;")
            .replace(/"/g, "&quot;")
            .replace(/'/g, "&#039;");
    }

    function validateForm() {
        var checked= [];
        var i = 0;
        <%String[] list = selectedDatalist;
            for (String s : list) {%>
             var currId = escapeHtml("<%=s%>");
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
    <button id="show" class="button" >Show Application Scenario</button>

    <dialog id="window">
        <h3>Application Design Scenario</h3>
        <p align="left">
            This is a web-based health-care application that allows remote consultation with medical professionals,
            general practitioners and specialists, for a payment. Users should be able to browse through a registered
            list of medical professionals and chat (text/video) with them on their health problems for advice.
            Doctors and health-care professionals can register on the application to earn by providing their expertise to users.
            The application is to be freely available on-line (desktop/mobile). You can decide on,

        <li align="left">
            Collect user data and use them within the application to provide users with enhanced features
        </li><li align="left">
        Share data with third parties (hospitals, insurance providers and other health care providers) to gain profit from data.
    </li>
        <li align="left">
            Store and keep user data for future use.
        </li>
        </p>
        <button id="exit">Close Dialog</button>
    </dialog>
    <script>

        (function() {
            var dialog = document.getElementById('window');
            document.getElementById('show').onclick = function() {
                dialog.show();
            };
            document.getElementById('exit').onclick = function() {
                dialog.close();
            };
        })();
    </script>
    <div class="container">
        <div class="row ">
            <p>Sensitivity implies the impact of loss of data to the user. Some data may have a higher impact of loss to the user while the loss of some data may not be
            very critical for the user. Sensitivity measures this aspect of data.</p>
            <form id="form" action="set_visibility_page.jsp" onsubmit="return validateForm()" method="post" >
                <%GenerateCSRFToken generateCSRFToken = new GenerateCSRFToken();
                    String myToken = generateCSRFToken.generateCSRFToken();%>
                <input type="hidden" name="_csrf" value="<%=myToken%>" />
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
