<%@ page import="main.java.model.DataItems" %>
<%@ page import="javax.xml.crypto.Data" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Study - University of New South Wales</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="style/css/main.css" rel="stylesheet">
    <script>
        function validateForm() {
            var checked = false;
            var selectedItems = "";
            var elements = document.getElementsByName("check");
            for (var i = 0; i < elements.length; i++) {
                if (elements[i].checked) {
                    checked = true;
                }
            }
            if (!checked) {
                alert('At least one data item should be selected for the application design');
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
            <h3> Select the Data elements from an end user you would consider collecting (to store in the app, or to
                share with third parties) for the
                application scenario : </h3>
        </header>
        <button id="show" class="button" >Application Scenario</button>

        <dialog id="window">
            <h3>Application Design Scenario</h3>
            This is a mobile application that allows users to search restaurants and order meals.
            The app will enable users to get food delivered, or order and collect according to their preference.

            You can decide on additional features to make the app more usable and popular.

            Also, you can collect and use user data to suggest meals and restaurants to users, and also share order details with restaurants to earn profits.

            The app is to be freely available for downloading. You can decide on,

            <li align="left">
                Collect user data and use them within the application to provide users with enhanced features
            </li><li align="left">
            Share data with third parties (restaurants, hotels, advertisers) to gain profit from data
        </li>
            <li align="left">
                Store and keep user data for future use.
            </li>
            <button id="exit">Close Dialog</button>
        </dialog>
        <FORM name="selectionform" ACTION="purpose_identification_page.jsp" METHOD="post"
              onsubmit="return validateForm()">
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
                    <td><%=dataName %>
                    </td>
                    <td><INPUT TYPE="CHECKBOX" NAME="check" VALUE=<%=dataName %>>

                </tr>
                <%}%>
            </table>

            <INPUT class="button" TYPE="SUBMIT" VALUE="Continue >>">
        </FORM>
    </div>
</section>



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
</body>
</html>
