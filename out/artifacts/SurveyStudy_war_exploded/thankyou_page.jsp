<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>User Study - University of New South Wales</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="style/css/main.css" rel="stylesheet">
   <%-- <script language="javascript" type="text/javascript">
        window.history.forward();
    </script>--%>
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
        StringBuffer evalParams = new StringBuffer();
        if (request.getParameter("better")!= null) {
            evalParams.append("\n This model makes my work easier when I implement privacy in software designs. : " + request.getParameter("better"));
        }
        if(request.getParameter("interesting")!= null) {
            evalParams.append("\n This model helps me to understand the data I use in system designs better. : "+ request.getParameter("interesting"));
        }
        if(request.getParameter("quickly")!= null) {
            evalParams.append("\n This model is important for me to implement privacy in a software systems design. : " + request.getParameter("quickly"));
        }
        if(request.getParameter("informed")!= null) {
            evalParams.append("\n  This model helps me to make my decisions on data sharing, collection and storage in the system design better. : " + request.getParameter("informed"));
        }
        if(request.getParameter("likely")!= null) {
            evalParams.append("\n This model helps me to make my decisions on data sharing, collection and storage in the system design quickly. : " + request.getParameter("likely"));
        }
        if(request.getParameter("decisions")!= null) {
            evalParams.append("\n After following the model I am better informed about making design decisions to protect user privacy in a system design. : " + request.getParameter("decisions"));
        }
        if(request.getParameter("ease")!= null) {
            evalParams.append("\n This model provides the required understanding of data for me to minimize data and provide end user privacy in a software system design. : " + request.getParameter("ease"));
        }
        if(request.getParameter("enjoyable")!= null) {
            evalParams.append("\n I understood the model and its parameters easily. : " + request.getParameter("enjoyable"));
        }
        if(request.getParameter("clear")!= null) {
            evalParams.append("\n Following this process was easy. : " + request.getParameter("clear"));
        }
        if(request.getParameter("effort") != null) {
            evalParams.append("\n It is important that I use this model to make my applications use less data for better user privacy. : " + request.getParameter("effort"));
        }
        if(request.getParameter("skills") != null) {
            evalParams.append("\n This model works well with the way I already work. : " + request.getParameter("skills"));
        }
        if(request.getParameter("use") != null) {
            evalParams.append("\n This model positively affects my current approach towards system designing. : " + request.getParameter("use"));
        }
        if(request.getParameter("future") != null) {
            evalParams.append("\n In will use this approach in my future system design tasks. : " + request.getParameter("future"));
        }
        if(request.getParameter("support") != null) {
            evalParams.append("\n Given the support, I would use this approach. : " + request.getParameter("support"));
        }
        if(request.getParameter("intention") != null) {
            evalParams.append("\n I intend to use this method in my work : " + request.getParameter("support"));
        }
        StringBuffer sessionParams = new StringBuffer();
        sessionParams.append("Participant ID : " + session.getAttribute("currParticipant") + "\n \n");
        sessionParams.append("---------------------\n" + session.getAttribute("selectedData") + "\n \n");
        sessionParams.append("---------------------\n" + session.getAttribute("storage_where_how") + "\n \n");
        sessionParams.append("---------------------\n" + session.getAttribute("share_how") + "\n \n");
        sessionParams.append("---------------------\n" + session.getAttribute("privacy_risk_values") + "\n \n");
        sessionParams.append("---------------------\n" + session.getAttribute("change_design") + "\n \n");
        sessionParams.append("---------------------\n" + evalParams + "\n \n");
        sessionParams.append("---------------------\n" + "End of Reporting \n -----------------------\n \n");
        //response.sendRedirect("data_selection_page.jsp");
    // send the email with the participants response
      session.setAttribute("emailBody_partI" , sessionParams);
    %>;

<script>
    function validateForm() {
        var checked = [];
        var returnval = true;
        var i = 0;
        checked[i] = false;
        var elements = document.getElementsByName("age");
        for (var elemN = 0; elemN < elements.length; elemN++) {
            if (elements[elemN].checked) {
                checked[i] = true;
            }
        }
        i++;
        var elements = document.getElementsByName("gender");
        for (var elemN = 0; elemN < elements.length; elemN++) {
            if (elements[elemN].checked) {
                checked[i] = true;
            }
        }
        i++;
        var elements = document.getElementsByName("occupation");
        for (var elemN = 0; elemN < elements.length; elemN++) {
            if (elements[elemN].checked) {
                checked[i] = true;
            }
        }
        i++;
        var elements = document.getElementsByName("experience");
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
                var anonymity_how = document.forms["last_form"]["anonymity_how"].value;
                if (anonymity_how == null || anonymity_how == "") {
                    returnval = false;
                }
                var pseudonimity_how = document.forms["last_form"]["pseudonimity_how"].value;
                if (pseudonimity_how == null || pseudonimity_how == "") {
                    returnval = false;
                }
                var encryption_how = document.forms["last_form"]["encryption_how"].value;
                if (encryption_how == null || encryption_how == "") {
                    returnval = false;
                }
                var unlinkability_how = document.forms["last_form"]["unlinkability_how"].value;
                if (unlinkability_how == null || unlinkability_how == "") {
                    returnval = false;
                }
                var obfuscation_how = document.forms["last_form"]["obfuscation_how"].value;
                if (obfuscation_how == null || obfuscation_how == "") {
                    returnval = false;
                }
                var undetectability_how = document.forms["last_form"]["undetectability_how"].value;
                if (undetectability_how == null || undetectability_how == "") {
                    returnval = false;
                }
                var unobservability_how = document.forms["last_form"]["unobservability_how"].value;
                if (unobservability_how == null || unobservability_how == "") {
                    returnval = false;
                }
        var risk_helped = document.forms["last_form"]["risk_helped"].value;
        if (risk_helped == null || risk_helped == "") {
            returnval = false;
        }
        if (returnval != true) {
            showError("Please fill in all fields in the form")

        }
        return returnval;
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
</head>
<body>

<section class="wrapper style2 special" id="two">
    <div class="inner narrow">
        <header>
            <h2 class="head-last">
                Please fill the following details about yourself to help us interpret your answers better
            </h2></header>
    </div>
    <dialog id="notification">
        <div id="alertMessage">Please fill all fields and continue</div>
        <button id="close">Close Dialog</button>
    </dialog>
    <div class="container">
        <div class="row ">

            <form name="last_form" action="final_page.jsp" onsubmit="return validateForm()" method="post">
                <input type="hidden" name="_csrf" value="<%=sessionToken%>" />
                <table id="customers">
                    <tr>
                        <th>Your Age</th>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="age"
                                   value="Above 18 upto24"/> Above 18 upto24
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="age"
                                   value="Above 24 upto 32"/> Above 24 upto 32
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="age"
                                   value="Above 32 upto 40"/> Above 32 upto 40
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="age"
                                   value="Above 40"/> Above 40
                        </td>
                    </tr>
                    <tr>
                        <th>Your Gender</th>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="gender"
                                   value="Female"/> Female
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="gender"
                                   value="Male"/> Male
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="gender"
                                   value="Prefer Not to Say"/> Prefer not to say
                        </td>
                    </tr>
                    <tr>
                        <th>Your Occupation</th>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="occupation"
                                   value="Software Developer"/> Software Developer
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="occupation"
                                   value="Software Architect"/> Software Architect
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="occupation"
                                   value="Owns a software company"/> Owns a software company
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="occupation"
                                   value="A Student"/> A Student
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="occupation"
                                   value="Freelancer"/> Freelancer
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="occupation"
                                   value="None of the above"/> None of the above
                        </td>
                    </tr>
                    <tr>
                        <th>Your Experience in the software industry</th>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="experience"
                                   value="0- upto 2 years"/> 0- upto 2 years
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="experience"
                                   value="more than 2 upto 5 years"/> more than 2 upto 5 years
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="experience"
                                   value="more than 5 upto 10 years"/> more than 5 upto 10 years
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="experience"
                                   value="more than 10 years"/> more than 10 years
                        </td>
                    </tr>
                </table>

                <div class="inner narrow">
                    <header>
                        <h2 class="head-last">
                            Please give us the following details about your design. Please explain how your design satisfy the requirements, what data
                            items you used it and why. This would help us to understand how the methodology you followed helped you in making privacy decisions.
                            The more information you can provide the better!

                            If your design satisfy the requirements, please say yes, and then in a few words explain how you used it.
                        </h2></header>
                </div>

                <table id="mytable">
                    <tr>
                        <th colspan="3">Did the privacy risk values displayed help you in designing privacy? if so how?
                        </th>
                    </tr>
                    <tr>
                        <td colspan="3"><input type="text" name="risk_helped"></td>
                    </tr>

                    <tr>
                        <th colspan="3">Did you make the user's information anonymous in the application so that
                            information cannot be tracked back to the user?
                        </th>
                    </tr>
                    <tr>

                        <td colspan="3"><input type="text" name="anonymity_how"></td>
                    </tr>
                    <tr>
                        <th colspan="3">Did you use a pseudonym (user id) for the user so that user cannot be
                            identified from the information in the app?
                        </th>
                    </tr>
                    <tr>
                        <td colspan="3"><input type="text" name="pseudonimity_how"></td>
                    </tr>
                    <tr>
                        <th colspan="3">Did you encrypt data so that the data is not in plain text that
                            could be read by an external party?
                        </th>
                    </tr>
                    <tr>
                        <td colspan="3"><input type="text" name="encryption_how"></td>
                    </tr>
                    <tr>
                        <th colspan="3">In your design can the information of the user in the application cannot be linked
                            to the user in databases?
                        </th>
                    </tr>
                    <tr>
                        <td colspan="3"><input type="text" name="unlinkability_how"></td>
                    </tr>
                    <tr>
                        <th colspan="3">In your design is access to user's information in the application is limited and
                            blocked for outsiders?
                        </th>
                    </tr>
                    <tr>
                        <td colspan="3"><input type="text" name="obfuscation_how"></td>
                    </tr>
                    <tr>
                        <th colspan="3">In your design, can the existence of information about a particular user in the
                            app cannot be detected from the data?
                        </th>
                    </tr>
                    <tr>
                        <td colspan="3"><input type="text" name="undetectability_how"></td>
                    </tr>
                    <tr>
                        <th colspan="3">In your design can the existence of the user and his information be
                            observed from the data?
                        </th>
                    </tr>
                    <tr>
                        <td colspan="3"><input type="text" name="unobservability_how"></td>
                    </tr>

                </table>
                <br></br><br></br>
                <INPUT TYPE="SUBMIT" class="button" style="vertical-align:middle" VALUE="Submit >>">
            </form>


        </div>
    </div>
</section>
<div id="footer" style="align-content: center">
    page 12
</div>
</body>
</html>
