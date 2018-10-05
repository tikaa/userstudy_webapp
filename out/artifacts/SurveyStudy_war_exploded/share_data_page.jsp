<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.owasp.encoder.Encode" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" language="JavaScript" src="esapi4js/esapi.js"></script>
<script type="text/javascript" language="JavaScript" src="esapi4js/esapi-compressed.js"></script>
<script type="text/javascript" language="JavaScript" src="esapi4js/Base.esapi.properties.js"></script>
<script type="text/javascript" language="JavaScript" src="esapi4js/ESAPI_Standard_en_US.properties.js"></script>

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
        org.owasp.esapi.ESAPI.initialize();
        function validateForm() {

            var checked = false;
            var elements = document.getElementsByName("share");
            for (var iterator = 0; iterator < elements.length; iterator++) {
                var dataElem = elements[iterator].valueOf().value
                if (elements[iterator].checked) {
                    var howShare = document.forms["share_form"][dataElem + "howshare"].value
                    if (howShare == null || howShare == "") {
                        showError("Please select how your design would share " + dataElem + "with third parties")
                        return false;
                    } else {
                        checked = true;
                    }
                }
            }
            if (!checked) {
                showError("If you do not want to share any data item, select the last option, I do not want to share data")
            }
            return checked;
        }

        function showError(errorMessage) {
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
<body onload="noBack();"
      onpageshow="if (event.persisted) noBack();" onunload="">

<%
    String[] storeVals = request.getParameterValues("store");
    String[] selectedDatalist = session.getAttribute("selectedData").toString().split(",");
    StringBuffer storage_where_how = new StringBuffer();
    if (storeVals != null) {
        List storeList = Arrays.asList(storeVals);

        for (int iterator = 0; iterator < selectedDatalist.length; iterator++) {
            String currDataElement = selectedDatalist[iterator];
            if (storeList.contains(selectedDatalist[iterator])) {

                storage_where_how.append("_" + currDataElement);
//                currDataElement.setPreStored(true);
                String parameterHow = request.getParameter(currDataElement + "how");
                if (parameterHow != null && parameterHow != "" && !parameterHow.isEmpty()) {
                    storage_where_how.append("_stored" + parameterHow + "_");
                }
                String parameterWhere = request.getParameter(currDataElement + "where");
                if (parameterWhere != null && !parameterWhere.isEmpty() && parameterWhere != "") {
                    storage_where_how.append("at_" + parameterWhere + "_");
                }
            }

        }
        session.setAttribute("storage_where_how", storage_where_how.toString());

    }


%>
<section class="wrapper style2 special" id="two">
    <div class="inner narrow">
        <header>
            <h2 class="head-last">
                Select the Data elements from an end user that you would consider sharing (with other parties) for
                the application scenario. Also state how you plan to share data (encrypted/ plain text/ anonymized
                etc.).

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
            <table id="customers">
                <tr>
                    <th>Data Element</th>
                    <th> Share?</th>
                    <th>How you share</th>

                </tr>
                <FORM id="share_form" ACTION="model_intro_page.jsp" METHOD="post"
                      onsubmit="return validateForm()">
                    <input type="hidden" name="_csrf" value="<%=sessionToken%>"/>
                        <%
                            for (int i =0; i<selectedDatalist.length; i++) {
                            String dataName = selectedDatalist[i];
                            String howShare = dataName + "howshare";

                        %>
                    <tr>
                        <td><%=Encode.forHtml(dataName) %>
                        </td>
                        <td><INPUT TYPE="CHECKBOX" NAME="share" VALUE=<%=Encode.forHtmlAttribute(dataName) %>></td>

                        <td><input type="text" name="<%=Encode.forHtmlAttribute(howShare) %>"></td>
                            <%}%>
                    <tr>
                        <td colspan="2"> I do not want to share any data in this app</td>
                        <td><INPUT TYPE="CHECKBOX" NAME="share" VALUE="no share"></td>
                    </tr>
            </table>
            <INPUT TYPE="SUBMIT" class="button" style="vertical-align:middle" VALUE="Continue >>">
            </FORM>
        </div>
    </div>
</section>
<br><br>
<div id="footer" style="align-content: center">
    page 05
</div>
</body>
</html>
