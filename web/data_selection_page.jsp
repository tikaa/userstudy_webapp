<%@ page import="main.java.model.DataItems" %>
<%@ page import="org.owasp.encoder.Encode" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" language="JavaScript" src="esapi4js/log4js.js"></script>
    <script type="text/javascript" language="JavaScript" src="esapi4js/esapi.js"></script>
    <script type="text/javascript" language="JavaScript" src="esapi4js/ESAPI_Standard_en_US.properties.js"></script>
    <script type="text/javascript" language="JavaScript" src="esapi4js/Base.esapi.properties.js"></script>

    <title>User Study - University of New South Wales</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="style/css/main.css" rel="stylesheet">

    <% String randomToken = String.valueOf(Math.random()).substring(2, 15) + String.valueOf(Math.random()).substring(2, 15);
          session.setAttribute("csrf_token", randomToken);
    %>

    <script>
        org.owasp.esapi.ESAPI.initialize();
        function validateForm() {

            var checked = false;
            var elements = document.getElementsByName("check");
            for (var i = 0; i < elements.length; i++) {
                if (elements[i].checked) {
                    checked = true;
                }
            }
            if (!checked) {
                var encodedVal = $ESAPI.encoder().encodeForJavaScript(document.forms["selectionform"]["anydata"].value)
                if (encodedVal != null && encodedVal != "") {
                    return true;
                }
                document.getElementById("alertMessage").innerHTML = "At least one data item should be selected to be used in the system";
                var alertBox =document.getElementById("notification");
                alertBox.show();
                document.getElementById('close').onclick = function () {
                    alertBox.close();
                }
            }
            return checked;

        }
    </script>
    <script language="javascript" type="text/javascript">
        window.history.forward();
    </script>
</head>
<body clas="">
<section class="wrapper style2 special" id="two">
    <div class="inner narrow">
        <header>
            <h3> Select the Data elements from an end user that you would consider collecting (to store in the app, or to
                share with third parties) for the
                application scenario : </h3>
        </header>
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
                var invalidDialog = document.getElementById("invalid");
                document.getElementById("closeDialog".onclick = function () {
                    invalidDialog.close();
                })
            })();
        </script>

        <FORM name="selectionform" action="store_data_page.jsp" METHOD="post"
              onsubmit="return validateForm()">

            <input type="hidden" name="_csrf" value="<%=randomToken%>" />
            <table id="customers">
                <tr>
                    <th>Data Item</th>
                    <th>Select</th>
                </tr>
                <%
                    for (DataItems dataElem : DataItems.values()) {
                        String dataName = dataElem.toString();
                %>
                <tr>
                    <td><%=Encode.forHtml(dataName) %>
                    </td>
                    <td><INPUT TYPE="CHECKBOX" NAME="check" VALUE=<%=Encode.forHtmlAttribute(dataName) %>>

                </tr>
                <%}%>
                <tr><td colspan="2">Any other data you would like to collect that was not mentioned above? (as a comma separated list)</td></tr>
                <tr><td colspan="2"><input type="text" name="anydata"></td></tr>
            </table>



            <INPUT class="button" TYPE="SUBMIT" VALUE="Continue >>">
        </FORM>
    </div>
</section>

<div id="footer" style="align-content: center">
    page 02
</div>
</body>
</html>
