<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="org.owasp.encoder.Encode" %>
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
    String sessionToken = session.getAttribute("csrf_token").toString();
    String[] selectedDatalist = session.getAttribute("selectedData").toString().split(",");
%>
<script>


    function validateForm() {
        var checked= [];
        var i = 0;
        <%String[] list = selectedDatalist;
            for (String s : list) {%>

             var currId = "<%=Encode.forJavaScript(s).replaceAll(" ","")%>";
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
                showError('Please set sensitivity value for all data elements');
                return false;
            }
        }
        return true;
    }

    function showError(errorMessage){
        document.getElementById("alertMessage").innerHTML = errorMessage;
        var alertBox =document.getElementById("notification");
        alertBox.show();
        document.getElementById('close').onclick = function () {
            alertBox.close();
        }
    }
</script>
</section>
<section class="wrapper style2 special" id="two">
    <div class="inner narrow">
        <header><h2>Step I : First determine how sensitive do you think the data items you chose to collect for the
            application would be for a user who uses the application.</h2>
          </header>
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
    <dialog id="notification">
        <div id="alertMessage">Please fill all fields and continue</div>
        <button id="close">Close Dialog</button>
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
            <p>Sensitivity is the impact of loss of data to the user. Some data may have a higher impact of loss to the user while the loss of some data may not be
            very critical for the user. </p>
            <form id="form" action="set_visibility_page.jsp" onsubmit="return validateForm()" method="post" >
                <input type="hidden" name="_csrf" value="<%=sessionToken%>" />
                <% for (int iterator = 0; iterator < selectedDatalist.length; iterator++) {
                        String currDataElemName = selectedDatalist[iterator];%>
            <table id="customers">
               <tr><th>
                <%= Encode.forHtml(currDataElemName)%>
                </th></tr>
                <tr><td>

                    <input type="radio" name=<%= Encode.forHtmlAttribute(currDataElemName)%>
                            value="3"/> Highly Sensitive
                    <input type="radio" name=<%= Encode.forHtmlAttribute(currDataElemName)%>
                            value="2"/> Somewhat Sensitive
                    <input type="radio" name=<%= Encode.forHtmlAttribute(currDataElemName)%>
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
<div id="footer" style="align-content: center">
    page 06
</div>
</body>
</html>
