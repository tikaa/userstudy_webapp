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
<%@ page import="org.owasp.encoder.Encode" %>
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
        String sessionToken = session.getAttribute("csrf_token").toString();
        String formSubmittedToken = request.getParameter("_csrf");
        if (!sessionToken.equals(formSubmittedToken)) {
            session.invalidate();
            String redirectURL = "error_page.jsp";
            response.sendRedirect(redirectURL);
        }
    %>
    <%
        String[] selectedDatalist = session.getAttribute("selectedData").toString().split(",");
        StringBuffer changeDesign = new StringBuffer();
        changeDesign.append("___________________-------" + "CHANGING DESIGN" + "-------_________________");
        String[] shareVals = request.getParameterValues("share");
        String[] storeVals = request.getParameterValues("store");
        String[] noStoreVals = request.getParameterValues("no_store");
        String[] noShareVals = request.getParameterValues("no_share");

        if (storeVals != null) {
            List storeList = Arrays.asList(storeVals);
            for (int i = 0; i < selectedDatalist.length; i++) {
                String currDataElement = selectedDatalist[i];
                if (storeList.contains(currDataElement)) {
                    changeDesign.append(currDataElement + "---------_" + "post Stored");
                    String parameterHow = Encode.forHtmlAttribute(request.getParameter(currDataElement + "howstore"));
                    if (parameterHow != null && parameterHow != "" && !parameterHow.isEmpty()) {
                        changeDesign.append(currDataElement + "---------_" + "post Stored as" + parameterHow);
                    }
                    String parameterWhere = Encode.forHtmlAttribute(request.getParameter(currDataElement + "wherestore"));
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
                    String parameterHow = Encode.forHtmlAttribute(request.getParameter(currDataElementName + "howshare"));
                    if (parameterHow != null && parameterHow != "" && !parameterHow.isEmpty()) {
                        changeDesign.append(currDataElementName + "---------Post Shared _" + parameterHow);
                    }

                }

            }
        }

        if (noStoreVals != null) {
            List noStoreList = Arrays.asList(noStoreVals);

            for (int i = 0; i < selectedDatalist.length; i++) {
                String currDataElementName = selectedDatalist[i];
                if (noStoreList.contains(currDataElementName)) {
                    changeDesign.append(currDataElementName + "---------Not Post Stored _");
                }

            }
        }
        if (noShareVals != null) {
            List noShareList = Arrays.asList(noShareVals);

            for (int i = 0; i < selectedDatalist.length; i++) {
                String currDataElementName = selectedDatalist[i];
                if (noShareList.contains(currDataElementName)) {
                    changeDesign.append(currDataElementName + "---------Not Post Shared _");
                }

            }
        }
        String change_reason = "\n I changed by Design : \n" + Encode.forHtmlAttribute(request.getParameter("change_reason"));
        String too_high_reason = "\n Privacy Risk : \n" + Encode.forHtmlAttribute(request.getParameter("too_high_reason"));
        changeDesign.append(change_reason);
        changeDesign.append(too_high_reason);
        session.setAttribute("change_design", changeDesign);
        //response.sendRedirect("data_selection_page.jsp");
    %>
    <script>
        function validateForm() {
            var checked = [];
            var i = 0;
            checked[i] = false;
            var elements = document.getElementsByName("complexity1");
            for (var elemN = 0; elemN < elements.length; elemN++) {
                if (elements[elemN].checked) {
                    checked[i] = true;
                }
            }
            i++;
            var elements = document.getElementsByName("complexity2");
            for (var elemN = 0; elemN < elements.length; elemN++) {
                if (elements[elemN].checked) {
                    checked[i] = true;
                }
            }
            i++;
            var elements = document.getElementsByName("complexity3");
            for (var elemN = 0; elemN < elements.length; elemN++) {
                if (elements[elemN].checked) {
                    checked[i] = true;
                }
            }
            i++;
            var elements = document.getElementsByName("complexity4");
            for (var elemN = 0; elemN < elements.length; elemN++) {
                if (elements[elemN].checked) {
                    checked[i] = true;
                }
            }
            i++;
            var elements = document.getElementsByName("usefulness1");
            for (var elemN = 0; elemN < elements.length; elemN++) {
                if (elements[elemN].checked) {
                    checked[i] = true;
                }
            }
            i++;
            var elements = document.getElementsByName("usefulness2");
            for (var elemN = 0; elemN < elements.length; elemN++) {
                if (elements[elemN].checked) {
                    checked[i] = true;
                }
            }
            i++;
            var elements = document.getElementsByName("usefulness3");
            for (var elemN = 0; elemN < elements.length; elemN++) {
                if (elements[elemN].checked) {
                    checked[i] = true;
                }
            }
            i++;
            var elements = document.getElementsByName("socialpressure1");
            for (var elemN = 0; elemN < elements.length; elemN++) {
                if (elements[elemN].checked) {
                    checked[i] = true;
                }
            }
            i++;
            var elements = document.getElementsByName("socialpressure2");
            for (var elemN = 0; elemN < elements.length; elemN++) {
                if (elements[elemN].checked) {
                    checked[i] = true;
                }
            }
            i++;
            var elements = document.getElementsByName("compatibility1");
            for (var elemN = 0; elemN < elements.length; elemN++) {
                if (elements[elemN].checked) {
                    checked[i] = true;
                }
            }
            i++;
            var elements = document.getElementsByName("compatibility2");
            for (var elemN = 0; elemN < elements.length; elemN++) {
                if (elements[elemN].checked) {
                    checked[i] = true;
                }
            }
            i++;
            var elements = document.getElementsByName("compatibility3");
            for (var elemN = 0; elemN < elements.length; elemN++) {
                if (elements[elemN].checked) {
                    checked[i] = true;
                }
            }
            i++;
            var elements = document.getElementsByName("orgsupport1");
            for (var elemN = 0; elemN < elements.length; elemN++) {
                if (elements[elemN].checked) {
                    checked[i] = true;
                }
            }
            i++;
            var elements = document.getElementsByName("orgsupport2");
            for (var elemN = 0; elemN < elements.length; elemN++) {
                if (elements[elemN].checked) {
                    checked[i] = true;
                }
            }
            i++;
            var elements = document.getElementsByName("demonstrability1");
            for (var elemN = 0; elemN < elements.length; elemN++) {
                if (elements[elemN].checked) {
                    checked[i] = true;
                }
            }
            i++;
            var elements = document.getElementsByName("demonstrability2");
            for (var elemN = 0; elemN < elements.length; elemN++) {
                if (elements[elemN].checked) {
                    checked[i] = true;
                }
            }
            i++;
            var elements = document.getElementsByName("intention1");
            for (var elemN = 0; elemN < elements.length; elemN++) {
                if (elements[elemN].checked) {
                    checked[i] = true;
                }
            }
            i++;
            var elements = document.getElementsByName("intention2");
            for (var elemN = 0; elemN < elements.length; elemN++) {
                if (elements[elemN].checked) {
                    checked[i] = true;
                }
            }
            for (var val in checked) {
                if (checked[val] != true) {
                    showError('Please complete all questions in this form');
                    return false;
                }
            }
            return true;
        }

        function showError(errorMessage) {
            document.getElementById("alertMessage").innerHTML = errorMessage;
            var alertBox = document.getElementById("notification");
            alertBox.show();
            document.getElementById('close').onclick = function () {
                alertBox.close();
            }
        }
    </script>
</head>
<body>
<section class="wrapper style2 special" id="two">
    <div class="inner narrow">
        <header>
            <h2 class="head-last">
                Share you thoughts on the privacy risk values you were shown in this process you followed.
            </h2></header>
    </div>
    <dialog id="notification">
        <div id="alertMessage">Please fill all fields and continue</div>
        <button id="close">Close Dialog</button>
    </dialog>
    <div class="container">
        <div class="row ">

            <form id="form" action="thankyou_page.jsp" onsubmit="return validateForm()" method="post">
                <input type="hidden" name="_csrf" value="<%=sessionToken%>"/>
                <table id="headertable">
                    <tr>
                        <th>Complexity in using the Privacy Engineering Model</th>
                    </tr>
                </table>
                <table id="customers">
                    <tr>
                        <th colspan="5">1. This privacy engineering model makes my work easier when I implement privacy
                            in software systems.
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="complexity1"
                                   value="Strongly-Agree"/> Strongly-Agree
                        </td>
                        <td>
                            <input type="radio" name="complexity1"
                                   value="Somewhat Agree"/> Somewhat Agree
                        </td>
                        <td>
                            <input type="radio" name="complexity1"
                                   value="Neutral"/> Neutral
                        </td>
                        <td>
                            <input type="radio" name="complexity1"
                                   value="Somewhat Disagree"/> Somewhat Disagree
                        </td>
                        <td>
                            <input type="radio" name="complexity1"
                                   value="Strongly-Disagree"/> Strongly-Disagree
                        </td>
                    </tr>
                    <tr>
                        <th colspan="5">2. I already have the required knowledge to follow this model to help me
                            implement data protection in software systems.
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="complexity2"
                                   value="Strongly-Agree"/> Strongly-Agree
                        </td>
                        <td>
                            <input type="radio" name="complexity2"
                                   value="Somewhat Agree"/> Somewhat Agree
                        </td>
                        <td>
                            <input type="radio" name="complexity2"
                                   value="Neutral"/> Neutral
                        </td>
                        <td>
                            <input type="radio" name="complexity2"
                                   value="Somewhat Disagree"/> Somewhat Disagree
                        </td>
                        <td>
                            <input type="radio" name="complexity2"
                                   value="Strongly-Disagree"/> Strongly-Disagree
                        </td>
                    </tr>
                    <tr>
                        <th colspan="5">3. Following this privacy engineering model was difficult for implementing
                            privacy in software systems.
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="complexity3"
                                   value="Strongly-Disagree"/> Strongly-Disagree
                        </td>
                        <td>
                            <input type="radio" name="complexity3"
                                   value="Somewhat Disagree"/> Somewhat Disagree
                        </td>
                        <td>
                            <input type="radio" name="complexity3"
                                   value="Neutral"/> Neutral
                        </td>
                        <td>
                            <input type="radio" name="complexity3"
                                   value="Somewhat Agree"/> Somewhat Agree
                        </td>
                        <td>
                            <input type="radio" name="complexity3"
                                   value="Strongly-Agree"/> Strongly-Agree
                        </td>
                    </tr>
                    <tr>
                        <th colspan="5">4. I can easily understand how the privacy engineering model works when I
                            implement privacy in developing software systems.
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="complexity4"
                                   value="Strongly-Agree"/> Strongly-Agree
                        </td>
                        <td>
                            <input type="radio" name="complexity4"
                                   value="Somewhat Agree"/> Somewhat Agree
                        </td>
                        <td>
                            <input type="radio" name="complexity4"
                                   value="Neutral"/> Neutral
                        </td>
                        <td>
                            <input type="radio" name="complexity4"
                                   value="Somewhat Disagree"/> Somewhat Disagree
                        </td>
                        <td>
                            <input type="radio" name="complexity4"
                                   value="Strongly-Disagree"/> Strongly-Disagree
                        </td>
                    </tr>
                </table>
                <table id="headertable2">
                    <tr>
                        <th>Usefulness of using the Privacy Engineering Model</th>
                    </tr>
                </table>
                <table id="customerss">
                    <tr>
                        <th colspan="5">1. This privacy engineering model helps me to make my decisions on data sharing,
                            collection and storage when I develop software systems.
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="usefulness1"
                                   value="Strongly-Disagree"/> Strongly-Disagree
                        </td>
                        <td>
                            <input type="radio" name="usefulness1"
                                   value="Somewhat Disagree"/> Somewhat Disagree
                        </td>
                        <td>
                            <input type="radio" name="usefulness1"
                                   value="Neutral"/> Neutral
                        </td>
                        <td>
                            <input type="radio" name="usefulness1"
                                   value="Somewhat Agree"/> Somewhat Agree
                        </td>
                        <td>
                            <input type="radio" name="usefulness1"
                                   value="Strongly-Agree"/> Strongly-Agree
                        </td>
                    </tr>
                    <tr>
                        <th colspan="5">2. The privacy engineering model is useful for me to make decisions to protect
                            user data in a software system.
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="usefulness2"
                                   value="Strongly-Agree"/> Strongly-Agree
                        </td>
                        <td>
                            <input type="radio" name="usefulness2"
                                   value="Somewhat Agree"/> Somewhat Agree
                        </td>
                        <td>
                            <input type="radio" name="usefulness2"
                                   value="Neutral"/> Neutral
                        </td>
                        <td>
                            <input type="radio" name="usefulness2"
                                   value="Somewhat Disagree"/> Somewhat Disagree
                        </td>
                        <td>
                            <input type="radio" name="usefulness2"
                                   value="Strongly-Disagree"/> Strongly-Disagree
                        </td>
                    </tr>
                    <th colspan="5">3. This privacy engineering model does not help me in anyway to implement data
                        protection in a software system.
                    </th>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="usefulness3"
                                   value="Strongly-Disagree"/> Strongly-Disagree
                        </td>
                        <td>
                            <input type="radio" name="usefulness3"
                                   value="Somewhat Disagree"/> Somewhat Disagree
                        </td>
                        <td>
                            <input type="radio" name="usefulness3"
                                   value="Neutral"/> Neutral
                        </td>
                        <td>
                            <input type="radio" name="usefulness3"
                                   value="Somewhat Agree"/> Somewhat Agree
                        </td>
                        <td>
                            <input type="radio" name="usefulness3"
                                   value="Strongly-Agree"/> Strongly-Agree
                        </td>
                    </tr>
                </table>
                <table id="headertable3">
                    <tr>
                        <th>Social Pressure for using the Privacy Engineering Model</th>
                    </tr>
                </table>
                <table id="customers1">
                    <tr>
                        <th colspan="5">1. My colleagues at work would think I should use this privacy engineering model
                            to implement privacy in software systems.
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="socialpressure1"
                                   value="Strongly-Agree"/> Strongly-Agree
                        </td>
                        <td>
                            <input type="radio" name="socialpressure1"
                                   value="Somewhat Agree"/> Somewhat Agree
                        </td>
                        <td>
                            <input type="radio" name="socialpressure1"
                                   value="Neutral"/> Neutral
                        </td>
                        <td>
                            <input type="radio" name="socialpressure1"
                                   value="Somewhat Disagree"/> Somewhat Disagree
                        </td>
                        <td>
                            <input type="radio" name="socialpressure1"
                                   value="Strongly-Disagree"/> Strongly-Disagree
                        </td>
                    </tr>
                    <tr>
                        <th colspan="5">2. I do not think my colleagues at work would think I/we should use this privacy
                            engineering model when I/we implement data protection in a software system.
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="socialpressure2"
                                   value="Strongly-Agree"/> Strongly-Agree
                        </td>
                        <td>
                            <input type="radio" name="socialpressure2"
                                   value="Somewhat Agree"/> Somewhat Agree
                        </td>
                        <td>
                            <input type="radio" name="socialpressure2"
                                   value="Neutral"/> Neutral
                        </td>
                        <td>
                            <input type="radio" name="socialpressure2"
                                   value="Somewhat Disagree"/> Somewhat Disagree
                        </td>
                        <td>
                            <input type="radio" name="socialpressure2"
                                   value="Strongly-Disagree"/> Strongly-Disagree
                        </td>
                    </tr>
                </table>
                <table id="headertable4">
                    <tr>
                        <th>Compatibility of the Privacy Engineering Model with how I work</th>
                    </tr>
                </table>
                <table id="customers2">
                    <tr>
                        <th colspan="5">1. When I am (or my team) asked to develop software systems with better user
                            privacy this privacy engineering model works well with the way I already work in the
                            organization.
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="compatibility1"
                                   value="Strongly-Agree"/> Strongly-Agree
                        </td>
                        <td>
                            <input type="radio" name="compatibility1"
                                   value="Somewhat Agree"/> Somewhat Agree
                        </td>
                        <td>
                            <input type="radio" name="compatibility1"
                                   value="Neutral"/> Neutral
                        </td>
                        <td>
                            <input type="radio" name="compatibility1"
                                   value="Somewhat Disagree"/> Somewhat Disagree
                        </td>
                        <td>
                            <input type="radio" name="compatibility1"
                                   value="Strongly-Disagree"/> Strongly-Disagree
                        </td>
                    </tr>
                    <tr>
                        <th colspan="5">2. When I am (or my team) asked to develop software systems with better user
                            privacy this privacy engineering model positively affects the way I/we already work in the
                            organization.
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="compatibility2"
                                   value="Strongly-Disagree"/> Strongly-Disagree
                        </td>
                        <td>
                            <input type="radio" name="compatibility2"
                                   value="Somewhat Disagree"/> Somewhat Disagree
                        </td>
                        <td>
                            <input type="radio" name="compatibility2"
                                   value="Neutral"/> Neutral
                        </td>
                        <td>
                            <input type="radio" name="compatibility2"
                                   value="Somewhat Agree"/> Somewhat Agree
                        </td>
                        <td>
                            <input type="radio" name="compatibility2"
                                   value="Strongly-Agree"/> Strongly-Agree
                        </td>
                    </tr>
                    <tr>
                        <th colspan="5">3. I do not think this privacy engineering model would positively affect to me
                            or my team in our usual software development activities at the organization.
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="compatibility3"
                                   value="Strongly-Agree"/> Strongly-Agree
                        </td>
                        <td>
                            <input type="radio" name="compatibility3"
                                   value="Somewhat Agree"/> Somewhat Agree
                        </td>
                        <td>
                            <input type="radio" name="compatibility3"
                                   value="Neutral"/> Neutral
                        </td>
                        <td>
                            <input type="radio" name="compatibility3"
                                   value="Somewhat Disagree"/> Somewhat Disagree
                        </td>
                        <td>
                            <input type="radio" name="compatibility3"
                                   value="Strongly-Disagree"/> Strongly-Disagree
                        </td>
                    </tr>
                </table>
                <table id="headertable5">
                    <tr>
                        <th>My Organization's support for using the Privacy Engineering Model</th>
                    </tr>
                </table>
                <table id="mytable">
                    <tr>
                        <th colspan="5">1. I would highly likely use this privacy engineering model when implementing
                            data protection in software systems, if given support by my organization.
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="orgsupport1"
                                   value="Strongly-Agree"/> Strongly-Agree
                        </td>
                        <td>
                            <input type="radio" name="orgsupport1"
                                   value="Somewhat Agree"/> Somewhat Agree
                        </td>
                        <td>
                            <input type="radio" name="orgsupport1"
                                   value="Neutral"/> Neutral
                        </td>
                        <td>
                            <input type="radio" name="orgsupport1"
                                   value="Somewhat Disagree"/> Somewhat Disagree
                        </td>
                        <td>
                            <input type="radio" name="orgsupport1"
                                   value="Strongly-Disagree"/> Strongly-Disagree
                        </td>
                    </tr>
                    <tr>
                        <th colspan="5">2. I'm unlikely to attend the training, if my organization wants to train me to
                            use this privacy engineering model for developing
                            software systems with better user privacy.
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="orgsupport1"
                                   value="Strongly-Agree"/> Strongly-Agree
                        </td>
                        <td>
                            <input type="radio" name="orgsupport1"
                                   value="Somewhat Agree"/> Somewhat Agree
                        </td>
                        <td>
                            <input type="radio" name="orgsupport1"
                                   value="Neutral"/> Neutral
                        </td>
                        <td>
                            <input type="radio" name="orgsupport1"
                                   value="Somewhat Disagree"/> Somewhat Disagree
                        </td>
                        <td>
                            <input type="radio" name="orgsupport1"
                                   value="Strongly-Disagree"/> Strongly-Disagree
                        </td>
                    </tr>
                </table>
                <table id="headertable7">
                    <tr>
                        <th>Result Demonstrability of the Model</th>
                    </tr>
                </table>
                <table id="mytablenew">
                    <tr>
                        <th colspan="5">1. I can see how following this model would enhance data protection in the
                            software systems I develop.
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="demonstrability1"
                                   value="Strongly-Agree"/> Strongly-Agree
                        </td>
                        <td>
                            <input type="radio" name="demonstrability1"
                                   value="Somewhat Agree"/> Somewhat Agree
                        </td>
                        <td>
                            <input type="radio" name="demonstrability1"
                                   value="Neutral"/> Neutral
                        </td>
                        <td>
                            <input type="radio" name="demonstrability1"
                                   value="Somewhat Disagree"/> Somewhat Disagree
                        </td>
                        <td>
                            <input type="radio" name="demonstrability1"
                                   value="Strongly-Disagree"/> Strongly-Disagree
                        </td>
                    </tr>
                    <tr>
                        <th colspan="5">2. I have difficulty in explaining why following this methdology may or may not
                            help implementing data protection in software systems.
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="demonstrability2"
                                   value="Strongly-Agree"/> Strongly-Agree
                        </td>
                        <td>
                            <input type="radio" name="demonstrability2"
                                   value="Somewhat Agree"/> Somewhat Agree
                        </td>
                        <td>
                            <input type="radio" name="demonstrability2"
                                   value="Neutral"/> Neutral
                        </td>
                        <td>
                            <input type="radio" name="demonstrability2"
                                   value="Somewhat Disagree"/> Somewhat Disagree
                        </td>
                        <td>
                            <input type="radio" name="demonstrability2"
                                   value="Strongly-Disagree"/> Strongly-Disagree
                        </td>
                    </tr>
                </table>
                <table id="headertable6">
                    <tr>
                        <th>My intention to use this Privacy Engineering Model</th>
                    </tr>
                </table>
                <table id="customers3">
                    <tr>
                        <th colspan="5">1. I am highly likely to use this privacy engineering model when I'm asked to
                            implement data protection in a software system.
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="intention1"
                                   value="Strongly-Agree"/> Strongly-Agree
                        </td>
                        <td>
                            <input type="radio" name="intention1"
                                   value="Somewhat Agree"/> Somewhat Agree
                        </td>
                        <td>
                            <input type="radio" name="intention1"
                                   value="Neutral"/> Neutral
                        </td>
                        <td>
                            <input type="radio" name="intention1"
                                   value="Somewhat Disagree"/> Somewhat Disagree
                        </td>
                        <td>
                            <input type="radio" name="intention1"
                                   value="Strongly-Disagree"/> Strongly-Disagree
                        </td>
                    </tr>
                    <tr>
                        <th colspan="5">2. When I'm asked to implement data protection in a system, I do not think I
                            would use this privacy engineering model at all.
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="intention2"
                                   value="Strongly-Agree"/> Strongly-Agree
                        </td>
                        <td>
                            <input type="radio" name="intention2"
                                   value="Somewhat Agree"/> Somewhat Agree
                        </td>
                        <td>
                            <input type="radio" name="intention2"
                                   value="Neutral"/> Neutral
                        </td>
                        <td>
                            <input type="radio" name="intention2"
                                   value="Somewhat Disagree"/> Somewhat Disagree
                        </td>
                        <td>
                            <input type="radio" name="intention2"
                                   value="Strongly-Disagree"/> Strongly-Disagree
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
    </div>
    </div>

</section>
<div id="footer" style="align-content: center">
    page 11
</div>
</body>
</html>
