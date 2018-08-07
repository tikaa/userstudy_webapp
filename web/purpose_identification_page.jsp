<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="main.java.util.GenerateCSRFToken" %>
<%@ page import="org.owasp.encoder.Encode" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Study - University of New South Wales</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="style/css/main.css" rel="stylesheet">
    <%
        String[] selectVals = request.getParameterValues("check");
        List selectList = null;
        StringBuffer selectDataJson = new StringBuffer();
        selectDataJson.append("[");
        StringBuffer selectedDataJson = new StringBuffer();
        if (true) {
            if (selectVals != null) {
                selectList = Arrays.asList(selectVals);

                for (int i = 0; i < selectList.size(); i++) {
                    selectedDataJson.append(String.valueOf(selectList.get(i)));
                    if (i < selectList.size() - 1) {
                        selectedDataJson.append(",");
                    }

                }
                selectDataJson.append(selectedDataJson + "]");
                session.setAttribute("selectedData", selectedDataJson.toString());
                session.setAttribute("selectedDataListObject", selectDataJson);
            }
        }
    %>
    <script>


        function validateForm() {
            <%String list[] = selectedDataJson.toString().split(",");
            for (String s : list) {%>
            var currId = "<%=Encode.forJavaScript(s)%>";
            var x = document.forms["purposeForm"][currId + "purpose"].value;
                if (x == "") {
                alert("Purpose for using the data item " + currId + " must be filled out");
                return false;
                }
            <%}%>
        }
    </script>
    <script language="javascript" type="text/javascript">
        window.history.forward();
    </script>
</head>

<body class="">
<section class="wrapper style2 special" id="two">
    <div class="inner narrow">
        <header>
            <h2 class="head-last">
                Clearly identify the purpose for your decision to collect each of the data items you selected before
                :
            </h2></header>
    </div>
    <div class="container">
        <div class="row ">
            <table id="customers">
                <tr>
                    <th>Data Element</th>
                    <th> Purpose for Collection</th>
                </tr>
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
                <FORM name="purposeForm" ACTION="store_data_page.jsp" METHOD="post" onsubmit="return validateForm()">
                        <%GenerateCSRFToken generateCSRFToken = new GenerateCSRFToken();
                String myToken = generateCSRFToken.generateCSRFToken();%>
                    <input type="hidden" name="_csrf" value="<%=myToken%>" />
                <%String[] selectedDatalist = session.getAttribute("selectedData").toString().split(",");
                     for (int val =0; val<selectedDatalist.length; val++) {
                        String dataName = selectedDatalist[val];
                        String purpose = dataName + "purpose";
                    %>
                    <tr>
                        <td><%= Encode.forHtml(dataName)%>
                        </td>
                        <td><input type="text" name=<%=Encode.forHtmlAttribute(purpose) %>></td>
                    </tr>
                    <%}%>
            </table>
            <INPUT TYPE="SUBMIT" class="button" style="vertical-align:middle" VALUE="Continue >>">
            </FORM>
        </div>
    </div>
</section>


</body>
</html>
