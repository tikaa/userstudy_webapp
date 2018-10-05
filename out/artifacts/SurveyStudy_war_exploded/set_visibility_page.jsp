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
    <%
        String sessionToken = session.getAttribute("csrf_token").toString();
        String formSubmittedToken = request.getParameter("_csrf");
        if(!sessionToken.equals(formSubmittedToken)) {
            session.invalidate();
            String redirectURL = "error_page.jsp";
            response.sendRedirect(redirectURL);
        }
    %>
    <script>
        function validateForm() {
            var checked = [];
            var i = 0;
            <%String[] list = session.getAttribute("selectedData").toString().split(",");
                for (String s : list) {%>
            var currId = "<%=Encode.forJavaScript(s).replaceAll(" ","")%>";
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
                    showError('Please set visibility value for all data elements');
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
    <script language="javascript" type="text/javascript">
        window.history.forward();
    </script>
</head>
<body>
<section class="wrapper style2 special" id="two">
    <div class="inner narrow">
        <header>
            <h2 class="head-last">
                Step II : As the second step of the model determine how visible do you intend to make the data you decided to collect in the application design.
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
    <dialog id="notification">
        <div id="alertMessage">Please fill all fields and continue</div>
        <button id="close">Close Dialog</button>
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

            <p>Visibility is how visible the data is by default in the application when the user give data
                into the application.
                That is, you may design the application so that the data the user disclose will be visible in the app
                for other users, for the organization that developed the application (higher visibility), or, you could
                design the application
                so that the data the user disclose is only visible to the user himself (which is very low visibility).
            </p>

            <p>

            For example, the name and the profile pic in facebook have the highest visibility as any user in the system can see these information
            about another user by default. However, the bank account number in a banking application has low visibility as only the user
            himself can view it in the application.</p>


            <form id="form" action="set_relatedness_page.jsp" onsubmit="return validateForm()" method="post">
                <input type="hidden" name="_csrf" value="<%=sessionToken%>" />
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
<div id="footer" style="align-content: center">
    page 07
</div>
</body>
</html>
