<%@ page import="main.java.util.GenerateCSRFToken" %>
<%@ page import="org.owasp.encoder.Encode" %><%--
  Created by IntelliJ IDEA.
  User: Asus PC
  Date: 1/10/2017
  Time: 10:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Study - University of New South Wales</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="style/css/main.css" rel="stylesheet">
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
            var checked = [];
            var i = 0;
            <%String[] list = session.getAttribute("selectedData").toString().split(",");
                for (String s : list) {%>
            var currId = escapeHtml("<%=s%>");
            checked[i] = false;
            var elements = document.getElementsByName(currId);
            for (var elemN = 0; elemN < elements.length; elemN++) {
                if (elements[elemN].checked) {
                    checked[i] = true;
                }
            }
            i++;
            <%}%>
            for (var val in checked) {
                if (checked[val] != true) {
                    alert('Please set visibility value for all data elements');
                    return false;
                }
            }
            return true;
        }
    </script>
    <script language="javascript" type="text/javascript">
        window.history.forward();
    </script>
</head>
<body>
<section class="wrapper style2 special" id="two">
    <div class="inner narrow">
        <header>
            <h2 class="head-last">
                How visible do you intend to make the data you decided to collect in the application design?
            </h2></header>
    </div>
    <button id="show" class="button">Show Application Scenario</button>

    <dialog id="window">
        <h3>Application Design Scenario</h3>
        <p align="left">
            This is a web-based health-care application that allows remote consultation with medical professionals,
            general practitioners and specialists, for a payment. Users should be able to browse through a registered
            list of medical professionals and chat (text/video) with them on their health problems for advice.
            Doctors and health-care professionals can register on the application to earn by providing their expertise
            to users.
            The application is to be freely available on-line (desktop/mobile). You can decide on,

        <li align="left">
            Collect user data and use them within the application to provide users with enhanced features
        </li>
        <li align="left">
            Share data with third parties (hospitals, insurance providers and other health care providers) to gain
            profit from data.
        </li>
        <li align="left">
            Store and keep user data for future use.
        </li>
        </p>
        <button id="exit">Close Dialog</button>
    </dialog>
    <script>

        (function () {
            var dialog = document.getElementById('window');
            document.getElementById('show').onclick = function () {
                dialog.show();
            };
            document.getElementById('exit').onclick = function () {
                dialog.close();
            };
        })();
    </script>
    <div class="container">
        <div class="row ">
            <% String[] selectedDatalist = session.getAttribute("selectedData").toString().split(",");
                for (String dataItem : selectedDatalist) {
                    String sensitivityVal = request.getParameter(dataItem);
                    session.setAttribute(dataItem + "sensitivity", sensitivityVal);
                }
            %>

            <p>Visibility implies how visible the data is by default in the application when the user reveal the data
                into the application.
                That is, you may design the application so that the data the user disclose will be visible in the app
                for other users, for the organization that developed the application (higher visibility), or, you could
                design the application
                so that the data the user disclose is only visible to the user himself which is very low visibility.</p>


            <form id="form" action="set_relatedness_page.jsp" onsubmit="return validateForm()" method="post">
                <%GenerateCSRFToken generateCSRFToken = new GenerateCSRFToken();
                    String myToken = generateCSRFToken.generateCSRFToken();%>
                <input type="hidden" name="_csrf" value="<%=myToken%>" />
                <%
                    for (int iterator = 0; iterator < selectedDatalist.length; iterator++) {
                        String currDataElemName = selectedDatalist[iterator];%>
                <table id="customers">
                    <tr>
                        <th>
                            <%=Encode.forHtml(currDataElemName) %>
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name=<%= Encode.forHtmlAttribute(currDataElemName)%>
                                    value="3"/> Highly Visible
                            <input type="radio" name=<%= Encode.forHtmlAttribute(currDataElemName)%>
                                    value="2"/> Somewhat Visible
                            <input type="radio" name=<%= Encode.forHtmlAttribute(currDataElemName)%>
                                    value="1"/> Not at all Visible
                        </td>
                    </tr>
                    <%

                        }
                    %></table>
                <button class="button" style="vertical-align:middle" type="submit" form="form"
                        value="Submit">Next >>
                </button>
            </form>
        </div>
    </div>
</section>

</body>
</html>
