<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>User Study - University of New South Wales</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="style/css/main.css" rel="stylesheet">

    <script>
        function validateForm() {
            var checked= [];
            var i = 0;
            <%String[] list = session.getAttribute("selectedData").toString().split(",");
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
                    alert('Please set relatedness value for all data elements');
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
                How related do you do you think the data items are to the purpose of this application?
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

            <% String[] selectedDatalist = session.getAttribute("selectedData").toString().split(",");
                for (String currDE : selectedDatalist) {
                    String visibilityVal = request.getParameter(currDE);
                    if (visibilityVal != null) {
                        session.setAttribute(currDE + "visibility", visibilityVal);
                    }
                }
            %>
            <p>The data you use may be highly related for the application such that the application cannot function without that data. For example,
            the credit card number for a payment portal. Less related data are data used to enhance the system functionality or data that is used with the hope of giving more functioanlity
            in the future.</p>
            <form id="form" action="privace_risk_view_page.jsp" onsubmit="return validateForm()" method="post">
            <%
                for (int iterator = 0; iterator < selectedDatalist.length; iterator++) {
                    String currDataElemName = selectedDatalist[iterator];
            %>

                <table id="customers">
                    <tr><th>
                <%=currDataElemName %>
                    </th></tr>
                <tr><td>
                <input type="radio" name=<%= currDataElemName%>
                        value="3"/> Highly Related
                <input type="radio" name=<%= currDataElemName%>
                        value="2"/> Somewhat Related
                <input type="radio" name=<%= currDataElemName%>
                        value="1"/> Not at all Related </td></tr>
                <%
                    }
                %>
                </table>
                <div class="buttonHolder">
                    <button class="button" style="vertical-align:middle" type="submit" form="form"
                            value="Submit">Next >>
                    </button>
                </div>

            </form>
        </div>
    </div>
    </div>
</section>
</body>
</html>
