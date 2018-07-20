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
