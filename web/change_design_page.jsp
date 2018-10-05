<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.owasp.encoder.Encode" %>
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
    <%
        String[] selectedDatalist = session.getAttribute("selectedData").toString().split(",");
    %>
    <script>
        org.owasp.esapi.ESAPI.initialize();
        function validateForm() {

            var checkedShared= [];
            var checkedStored= [];
            var noStoreElements = document.getElementsByName("no_store");
            var noShareElements = document.getElementsByName("no_share");
            var storeElements = document.getElementsByName("store");
            for(var iterator=0; iterator <storeElements.length; iterator++){
                checkedStored[iterator] = false;
                var dataElem = storeElements[iterator].valueOf().value.split(' ').join('');
                if(storeElements[iterator].checked) {
                    var whereStore = document.forms["change_form"][dataElem + "wherestore"].value
                    var howStore = document.forms["change_form"][dataElem + "howstore"].value

                    if(howStore == null || howStore == "") {
                        showError("Please select how you want to store " + dataElem);
                        return false;

                    } else if (whereStore == null || whereStore == ""){
                        showError("Please select where you want to store " + dataElem);
                        return false;
                    } else {
                        //data element is selected and how and why filled!
                        checkedStored[iterator] = true;
                    }
                } else  {
                    for(var itr=0; itr <noStoreElements.length; itr++){
                        if (dataElem == noStoreElements[iterator].valueOf().value) {
                            if (noStoreElements[iterator].checked) {
                                checkedStored[iterator] = true;
                            }
                        }
                    }
                }
            }
            var shareElements = document.getElementsByName("share");
            for(var iterator=0; iterator <shareElements.length; iterator++){
                checkedShared[iterator] = false;
                var dataElem = shareElements[iterator].valueOf().value;
                if(shareElements[iterator].checked) {
                    var howShare = document.forms["change_form"][dataElem + "howshare"].value
                    if(howShare == null || howShare == "") {
                        showError("Please select how you want to share " + dataElem);
                        return false;
                    } else {
                        checkedShared[iterator] = true;
                    }
                } else  {
                    for(var itr=0; itr <noShareElements.length; itr++){
                        if (dataElem == noShareElements[iterator].valueOf().value) {
                            if (noShareElements[iterator].checked) {
                                checkedShared[iterator] = true;
                            }
                        }
                    }
                }
            }
            if (document.forms["change_form"]["change_reason"].value == null || document.forms["change_form"]["change_reason"].value == "") {
                showError("Please tell us if you changed your design and why");
                return false;
            }
            if (document.forms["change_form"]["too_high_reason"].value == null || document.forms["change_form"]["too_high_reason"].value == "") {
                showError("Please tell us what youbthink is a too high privacy risk value for data?");
                return false;
            }
            for (var z=0; z<checkedShared.length;z++) {
                if (checkedShared[z] != true) {
                    showError("If you do not want to share any data item, select the last option, I do not want to share data");
                    return false;
                }
            }
            for (var z=0; z<checkedStored.length;z++) {
                if (checkedStored[z] != true) {
                    showError("If you do not want to store any data item, select the last option, I do not want to store data");
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
                Step V : How would you change your decisions in data collection (to store in the app, or to share with third parties) after seeing the privacy
                risk of the data items? What changes would you do to better ensure that user privacy is protected in the system?
            </h2></header>
    </div>
    <dialog id="notification">
        <div id="alertMessage">Please fill all fields and continue</div>
        <button id="close">Close Dialog</button>
    </dialog>
    <div class="container">
        <div class="row ">
                <table id="customers">
                    <tr>
                        <th> Data Element</th>
                        <th> Associated Privacy Risk</th>
                        <th> Share</th>
                        <th> How you share</th>
                        <th> Store</th>
                        <th> Where you store</th>
                        <th> How you store</th>
                        <th> do not share</th>
                        <th> do not store</th>
                    </tr>

                    <FORM id = "change_form" name="change_form" ACTION="eval_process_page.jsp" METHOD="post" onsubmit="return validateForm()">
                        <input type="hidden" name="_csrf" value="<%=sessionToken%>">
                    <%for (int i=0; i < selectedDatalist.length; i++) {
                        String dataName = selectedDatalist[i];
                        String howShare = dataName + "howshare";
                        String howStore = dataName + "howstore";
                        String whereStore = dataName + "wherestore";
                        float privacyRisk = Float.parseFloat(session.getAttribute(selectedDatalist[i]+"privacyRisk").toString());
                    %>
                        <tr>
                            <td><%=Encode.forHtml(dataName) %><br>
                            </td>
                            <td><%=Encode.forHtml(String.valueOf(privacyRisk))%><br>
                            </td>
                            <td><INPUT TYPE="CHECKBOX" NAME="share" VALUE=<%=Encode.forHtmlAttribute(dataName) %>></td>
                            <td><input type="text" name="<%=Encode.forHtmlAttribute(howShare)%>"></td>
                            <td><INPUT TYPE="CHECKBOX" NAME="store" VALUE=<%=Encode.forHtmlAttribute(dataName) %>></td>
                            <td><input type="text" name="<%=Encode.forHtmlAttribute(whereStore)%>"></td>
                            <td><input type="text" name="<%=Encode.forHtmlAttribute(howStore)%>"></td>
                            <td><INPUT TYPE="CHECKBOX" NAME="no_share" VALUE=<%=Encode.forHtmlAttribute(dataName) %>></td>
                            <td><INPUT TYPE="CHECKBOX" NAME="no_store" VALUE=<%=Encode.forHtmlAttribute(dataName) %>></td>
                        </tr>
                            <%}%>
                        <tr><td>Did you change your design? why?</td><td colspan="8"><input type="text" name="change_reason"></td></tr>
                        <tr><td>From the data that you used so far, what sort of a privacy risk value do you think is too high? and why?</td><td colspan="8"><input type="text" name="too_high_reason"></tr>
                </table>
                <INPUT TYPE="SUBMIT" class="button" style="vertical-align:middle" VALUE="Submit">
                </FORM>


            </div>
        </div>
</section>
<div id="footer" style="align-content: center">
    page 10
</div>

</body>
</html>
