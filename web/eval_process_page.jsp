<%--
  Created by IntelliJ IDEA.
  User: Awanthika
  Date: 7/4/2018
  Time: 8:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<html>
<head>
    <title>User Study - University of New South Wales</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="style/css/main.css" rel="stylesheet">
    <script language="javascript" type="text/javascript">
        window.history.forward();
    </script>
    <%
        String[] selectedDatalist = session.getAttribute("selectedData").toString().split(",");
        StringBuffer changeDesign = new StringBuffer();
        changeDesign.append("___________________-------" + "CHANGING DESIGN" + "-------_________________");
        String[] shareVals = request.getParameterValues("share");
        String[] storeVals = request.getParameterValues("store");

        if (storeVals != null) {
            List storeList = Arrays.asList(storeVals);
            for (int i = 0; i < selectedDatalist.length; i++) {
                String currDataElement = selectedDatalist[i];
                if (storeList.contains(currDataElement)) {
                    changeDesign.append(currDataElement + "---------_" + "post Stored");
                    String parameterHow = request.getParameter(currDataElement + "howstore");
                    if (parameterHow != null && parameterHow != "" && !parameterHow.isEmpty()) {
                        changeDesign.append(currDataElement + "---------_" + "post Stored as" + parameterHow);
                    }
                    String parameterWhere = request.getParameter(currDataElement + "wherestore");
                    if (parameterWhere != null && !parameterWhere.isEmpty() && parameterWhere != "") {
                        changeDesign.append(currDataElement + "---------_" + "post Stored at" + parameterWhere);
                    }
                }

            }
        }

        if (shareVals != null) {
            List shareList = Arrays.asList(shareVals);

            for (int i = 0; i < selectedDatalist.length; i++) {
                String currDataElementName = selectedDatalist[i];
                if (shareList.contains(currDataElementName)) {
                    changeDesign.append(currDataElementName + "---------Post Shared _");
                    String parameterHow = request.getParameter(currDataElementName + "howshare");
                    if (parameterHow != null && parameterHow != "" && !parameterHow.isEmpty()) {
                        changeDesign.append(currDataElementName + "---------Post Shared _" + parameterHow);
                    }

                }

            }
        }
        session.setAttribute("change_design", changeDesign);
        //response.sendRedirect("data_selection_page.jsp");
    %>
    <script>
        function validateForm() {
            var checked = [];
            var i = 0;
            checked[i] = false;
            var elements = document.getElementsByName("quickly");
            for (var elemN = 0; elemN < elements.length; elemN++) {
                if (elements[elemN].checked) {
                    checked[i] = true;
                }
            }
            i++;
            var elements = document.getElementsByName("better");
            for (var elemN = 0; elemN < elements.length; elemN++) {
                if (elements[elemN].checked) {
                    checked[i] = true;
                }
            }
            i++;
            var elements = document.getElementsByName("informed");
            for (var elemN = 0; elemN < elements.length; elemN++) {
                if (elements[elemN].checked) {
                    checked[i] = true;
                }
            }
            i++;
            var elements = document.getElementsByName("likely");
            for (var elemN = 0; elemN < elements.length; elemN++) {
                if (elements[elemN].checked) {
                    checked[i] = true;
                }
            }
            i++;
            var elements = document.getElementsByName("decisions");
            for (var elemN = 0; elemN < elements.length; elemN++) {
                if (elements[elemN].checked) {
                    checked[i] = true;
                }
            }
            i++;
            var elements = document.getElementsByName("ease");
            for (var elemN = 0; elemN < elements.length; elemN++) {
                if (elements[elemN].checked) {
                    checked[i] = true;
                }
            }
            i++;
            var elements = document.getElementsByName("interesting");
            for (var elemN = 0; elemN < elements.length; elemN++) {
                if (elements[elemN].checked) {
                    checked[i] = true;
                }
            }
            i++;
            var elements = document.getElementsByName("enjoyable");
            for (var elemN = 0; elemN < elements.length; elemN++) {
                if (elements[elemN].checked) {
                    checked[i] = true;
                }
            }
            i++;
            var elements = document.getElementsByName("clear");
            for (var elemN = 0; elemN < elements.length; elemN++) {
                if (elements[elemN].checked) {
                    checked[i] = true;
                }
            }
            i++;
            var elements = document.getElementsByName("effort");
            for (var elemN = 0; elemN < elements.length; elemN++) {
                if (elements[elemN].checked) {
                    checked[i] = true;
                }
            }
            i++;
            var elements = document.getElementsByName("skills");
            for (var elemN = 0; elemN < elements.length; elemN++) {
                if (elements[elemN].checked) {
                    checked[i] = true;
                }
            }
            i++;
            var elements = document.getElementsByName("use");
            for (var elemN = 0; elemN < elements.length; elemN++) {
                if (elements[elemN].checked) {
                    checked[i] = true;
                }
            }
            for (var val in checked) {
                if (checked[val] != true) {
                    alert('Please complete all questions in this form');
                    return false;
                }
            }
            return true;
        }
    </script>
</head>
<body>
<section class="wrapper style2 special" id="two">
    <div class="inner narrow">
        <header>
            <h2 class="head-last">
                Share you thoughts on the process you followed to understand the privacy risk of data elements.
            </h2></header>
        <form id="form" action="thankyou_page.jsp" onsubmit="return validateForm()" method="post">
            <table id="customers">
                <tr>
                    <th>This method helped me to understand the data I use in the system design better.</th>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="quickly"
                               value="Strongly Agree"/> Strongly Agree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="quickly"
                               value="Somewhat Agree"/> Somewhat Agree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="quickly"
                               value="Somewhat Disagree"/> Somewhat Disagree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="quickly"
                               value="Strongly Disagree"/> Strongly Disagree
                    </td>
                </tr>
                <tr>
                    <th>Understanding data is important for me to implement privacy in system designs.</th>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="better"
                               value="Strongly Disagree"/> Strongly Disagree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="better"
                               value="Somewhat Disagree"/> Somewhat Disagree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="better"
                               value="Somewhat Agree"/> Somewhat Agree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="better"
                               value="Strongly Agree"/> Strongly Agree
                    </td>
                </tr>
                <tr>
                    <th>Understanding data helps me to make my decisions on data collection, sharing and storage better
                        when I design the system.
                    </th>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="quickly"
                               value="Strongly Agree"/> Strongly Agree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="quickly"
                               value="Somewhat Agree"/> Somewhat Agree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="quickly"
                               value="Somewhat Disagree"/> Somewhat Disagree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="quickly"
                               value="Strongly Disagree"/> Strongly Disagree
                    </td>
                </tr>
                <tr>
                    <th>Understanding data helps me to make my decisions on data collection, sharing and storage quickly
                        when I design systems.
                    </th>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="better"
                               value="Strongly Disagree"/> Strongly Disagree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="better"
                               value="Somewhat Disagree"/> Somewhat Disagree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="better"
                               value="Somewhat Agree"/> Somewhat Agree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="better"
                               value="Strongly Agree"/> Strongly Agree
                    </td>
                </tr>
                <tr>
                    <th>After following this process I am better informed about making decisions to protect user privacy
                        in a system design.
                    </th>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="quickly"
                               value="Strongly Agree"/> Strongly Agree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="quickly"
                               value="Somewhat Agree"/> Somewhat Agree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="quickly"
                               value="Somewhat Disagree"/> Somewhat Disagree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="quickly"
                               value="Strongly Disagree"/> Strongly Disagree
                    </td>
                </tr>
                <tr>
                    <th>This model provides the required
                        understanding of data for me to manage data and
                        provide end user privacy in a
                        software system design.
                    </th>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="better"
                               value="Strongly Disagree"/> Strongly Disagree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="better"
                               value="Somewhat Disagree"/> Somewhat Disagree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="better"
                               value="Somewhat Agree"/> Somewhat Agree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="better"
                               value="Strongly Agree"/> Strongly Agree
                    </td>
                </tr>
                <tr>
                    <th>Understanding data makes my work easier when I implement privacy in system designs.
                    </th>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="quickly"
                               value="Strongly Agree"/> Strongly Agree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="quickly"
                               value="Somewhat Agree"/> Somewhat Agree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="quickly"
                               value="Somewhat Disagree"/> Somewhat Disagree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="quickly"
                               value="Strongly Disagree"/> Strongly Disagree
                    </td>
                </tr>
                <tr>
                    <th>This method makes it easy for me to understand data.
                    </th>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="quickly"
                               value="Strongly Agree"/> Strongly Agree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="quickly"
                               value="Somewhat Agree"/> Somewhat Agree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="quickly"
                               value="Somewhat Disagree"/> Somewhat Disagree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="quickly"
                               value="Strongly Disagree"/> Strongly Disagree
                    </td>
                </tr>
                <tr>
                    <th>Following this process was difficult.
                    </th>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="quickly"
                               value="Strongly Agree"/> Strongly Agree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="quickly"
                               value="Somewhat Agree"/> Somewhat Agree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="quickly"
                               value="Somewhat Disagree"/> Somewhat Disagree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="quickly"
                               value="Strongly Disagree"/> Strongly Disagree
                    </td>
                </tr>
                <tr>
                    <th>Following this process was interesting.</th>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="better"
                               value="Strongly Disagree"/> Strongly Disagree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="better"
                               value="Somewhat Disagree"/> Somewhat Disagree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="better"
                               value="Somewhat Agree"/> Somewhat Agree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="better"
                               value="Strongly Agree"/> Strongly Agree
                    </td>
                </tr>
                <tr>
                    <th>I already have the necessary skills to follow this process.</th>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="quickly"
                               value="Strongly Agree"/> Strongly Agree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="quickly"
                               value="Somewhat Agree"/> Somewhat Agree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="quickly"
                               value="Somewhat Disagree"/> Somewhat Disagree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="quickly"
                               value="Strongly Disagree"/> Strongly Disagree
                    </td>
                </tr>
                <tr>
                    <th>If I'm provided with support I'm likely to use this model when I design systems.</th>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="quickly"
                               value="Strongly Agree"/> Strongly Agree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="quickly"
                               value="Somewhat Agree"/> Somewhat Agree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="quickly"
                               value="Somewhat Disagree"/> Somewhat Disagree
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="quickly"
                               value="Strongly Disagree"/> Strongly Disagree
                    </td>
                </tr>
            </table>

            <div class="buttonHolder">
                <button class="button" style="vertical-align:middle" type="submit" form="form"
                        value="Submit">Next >>
                </button>
            </div>
        </form>
    </div>
</section>
</body>
</html>
