<%@ page import="main.java.util.EmailSender" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>User Study - University of New South Wales</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="style/css/main.css" rel="stylesheet">
<body onload="noBack();"
      onpageshow="if (event.persisted) noBack();" onunload="">
    <%
        StringBuffer evalParams = new StringBuffer();
        if (request.getParameter("better")!= null) {
            evalParams.append("\n This method helped me to understand the data I use in the system design better. : " + Integer.parseInt(request.getParameter("better")));
        }
        if(request.getParameter("interesting")!= null) {
            evalParams.append("\n Understanding data is important for me to implement privacy in system designs. : "+ Integer.parseInt(request.getParameter("interesting")));
        }
        if(request.getParameter("quickly")!= null) {
            evalParams.append("\n Understanding data helps me to make my decisions on data collection, sharing and storage better when I design the system. : " + Integer.parseInt(request.getParameter("quickly")));
        }
        if(request.getParameter("informed")!= null) {
            evalParams.append("\n Understanding data helps me to make my decisions on data collection, sharing and storage quickly when I design systems. : " + Integer.parseInt(request.getParameter("informed")));
        }
        if(request.getParameter("likely")!= null) {
            evalParams.append("\n After following this process I am better informed about making decisions to protect user privacy in a system design. : " + Integer.parseInt(request.getParameter("likely")));
        }
        if(request.getParameter("skills")!= null) {
            evalParams.append("\n This model provides the required understanding of data for me to manage data and provide end user privacy in a software system design. : " + Integer.parseInt(request.getParameter("decisions")));
        }
        if(request.getParameter("ease")!= null) {
            evalParams.append("\n Understanding data makes my work easier when I implement privacy in system designs. : " + Integer.parseInt(request.getParameter("ease")));
        }
        if(request.getParameter("enjoyable")!= null) {
            evalParams.append("\n This method makes it easy for me to understand data. : " + Integer.parseInt(request.getParameter("enjoyable")));
        }
        if(request.getParameter("clear")!= null) {
            evalParams.append("\n Following this process was easy. : " + Integer.parseInt(request.getParameter("clear")));
        }
        if(request.getParameter("effort") != null) {
            evalParams.append("\n Following this process was interesting. : " + Integer.parseInt(request.getParameter("effort")));
        }
        if(request.getParameter("decisions") != null) {
            evalParams.append("\n I already have the necessary skills to follow this process. : " + Integer.parseInt(request.getParameter("skills")));
        }
        if(request.getParameter("use") != null) {
            evalParams.append("\n If I'm provided with support I'm likely to use this model when I design systems. : " + Integer.parseInt(request.getParameter("use")));
        }
        StringBuffer sessionParams = new StringBuffer();
        sessionParams.append("Participant ID : " + session.getAttribute("currParticipant") + "\n \n");
        sessionParams.append("---------------------\n" + "Selected Data : " + session.getAttribute("selectedData") + "\n \n");
        sessionParams.append("---------------------\n" + "Purpose of Data : " + session.getAttribute("purposeNamePair") + "\n \n");
        sessionParams.append("---------------------\n" + "Storing of Data : " + session.getAttribute("storage_where_how") + "\n \n");
        sessionParams.append("---------------------\n" + "Sharing of Data : " + session.getAttribute("share_how") + "\n \n");
        sessionParams.append("---------------------\n" + "Privacy Risk of Data : " + session.getAttribute("privacy_risk_values") + "\n \n");
        sessionParams.append("---------------------\n" + "Changing Design Parameters : " + session.getAttribute("change_design") + "\n \n");
        sessionParams.append("---------------------\n" + "Participant's evaluation Parameters : " + evalParams + "\n \n");
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
                alert('Please complete all questions in this form');
                return false;
            }
        }
        var encrypted = document.getElementsByName("anonymity");
        for (var elemN = 0; elemN < encrypted.length; elemN++) {
            if (encrypted[elemN].checked) {
                var whereStore = document.forms["last_form"]["anonymity_used"].value;
                if (whereStore == null || whereStore == "") {
                    returnval = false;
                }
            }
        }
        var encrypted = document.getElementsByName("pseudonimity");
        for (var elemN = 0; elemN < encrypted.length; elemN++) {
            if (encrypted[elemN].checked) {
                var whereStore = document.forms["last_form"]["pseudonimity_used"].value;
                if (whereStore == null || whereStore == "") {
                    returnval = false;
                }
            }
        }
        var encrypted = document.getElementsByName("encryption");
        for (var elemN = 0; elemN < encrypted.length; elemN++) {
            if (encrypted[elemN].checked) {
                var whereStore = document.forms["last_form"]["encryption_used"].value;
                if (whereStore == null || whereStore == "") {
                    returnval = false;
                }
            }
        }
        var encrypted = document.getElementsByName("unlinkability");
        for (var elemN = 0; elemN < encrypted.length; elemN++) {
            if (encrypted[elemN].checked) {
                var whereStore = document.forms["last_form"]["unlinkability_used"].value;
                if (whereStore == null || whereStore == "") {
                    returnval = false;
                }
            }
        }
        var encrypted = document.getElementsByName("obfuscation");
        for (var elemN = 0; elemN < encrypted.length; elemN++) {
            if (encrypted[elemN].checked) {
                var whereStore = document.forms["last_form"]["obfuscation_used"].value;
                if (whereStore == null || whereStore == "") {
                    returnval = false;
                }
            }
        }
        var encrypted = document.getElementsByName("undetectability");
        for (var elemN = 0; elemN < encrypted.length; elemN++) {
            if (encrypted[elemN].checked) {
                var whereStore = document.forms["last_form"]["undetectability_used"].value;
                if (whereStore == null || whereStore == "") {
                    returnval = false;
                }
            }
        }
        var encrypted = document.getElementsByName("unobservability");
        for (var elemN = 0; elemN < encrypted.length; elemN++) {
            if (encrypted[elemN].checked) {
                var whereStore = document.forms["last_form"]["unobservability_used"].value;
                if (whereStore == null || whereStore == "") {
                    returnval = false;
                }
            }
        }
        var whereStore = document.forms["last_form"]["risk_helped"].value;
        if (whereStore == null || whereStore == "") {
            returnval = false;
        }
        if (returnval != true) {
            alert("Please fill in all fields in the form")
            return false;
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
    <div class="container">
        <div class="row ">

            <form name="last_form" action="final_page.jsp" onsubmit="return validateForm()" method="post">
                <table id="customers">
                    <tr>
                        <th>Your Age</th>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="age"
                                   value="4"/> Above 18 upto24
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="age"
                                   value="3"/> Above 24 upto 32
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="age"
                                   value="2"/> Above 32 upto 40
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="age"
                                   value="1"/> Above 40
                        </td>
                    </tr>
                    <tr>
                        <th>Your Gender</th>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="gender"
                                   value="4"/> Female
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="gender"
                                   value="3"/> Male
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="gender"
                                   value="2"/> Prefer not to say
                        </td>
                    </tr>
                    <tr>
                        <th>Your Occupation</th>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="occupation"
                                   value="4"/> Software Developer
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="occupation"
                                   value="3"/> Software Architect
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="occupation"
                                   value="2"/> Owns a software company
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="occupation"
                                   value="2"/> A Student
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="occupation"
                                   value="2"/> Freelancer
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="occupation"
                                   value="2"/> None of the above
                        </td>
                    </tr>
                    <tr>
                        <th>Your Experience in the software industry</th>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="experience"
                                   value="4"/> 0- upto 2 years
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="experience"
                                   value="3"/> more than 2 upto 5 years
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="experience"
                                   value="2"/> more than 5 upto 10 years
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="experience"
                                   value="2"/> more than 10 years
                        </td>
                    </tr>
                </table>

                <div class="inner narrow">
                    <header>
                        <h2 class="head-last">
                            Did you use the following concepts in your decisions to use data in the application?
                        </h2></header>
                </div>

                <table id="mytable">
                    <tr>
                        <th>Technique</th>
                        <th></th>
                        <th>How did you use it?</th>
                    </tr>

                    <tr>
                        <th colspan="3">Anonymity : Making the user's information anonymous in the application so that
                            information cannot be tracked back to the user
                        </th>
                    </tr>
                    <tr>
                        <td><INPUT TYPE="CHECKBOX" NAME="anonymity" VALUE="anonymity_used"></td>
                        <td colspan="2"><input type="text" name="anonymity_how"></td>
                    </tr>
                    <tr>
                        <th colspan="3">Pseudonimity : Using a pseudonim (user id) for the user so that user cannot be
                            identified from the information in the app
                        </th>
                    </tr>
                    <tr>
                        <td><INPUT TYPE="CHECKBOX" NAME="pseudonimity" VALUE="pseudonimity_used"></td>
                        <td colspan="2"><input type="text" name="pseudonimity_how"></td>
                    </tr>
                    <tr>
                        <th colspan="3">Encryption : Encrypiting the data so that the data is not in plain text that
                            could be read by an external party
                        </th>
                    </tr>
                    <tr>
                        <td><INPUT TYPE="CHECKBOX" NAME="encryption" VALUE="encryption_used"></td>
                        <td colspan="2"><input type="text" name="encryption_how"></td>
                    </tr>
                    <tr>
                        <th colspan="3">Un-Linkability : THe information of the user in the application cannot be linked
                            to the user
                        </th>
                    </tr>
                    <tr>
                        <td><INPUT TYPE="CHECKBOX" NAME="unlinkability" VALUE="unlinkability_used"></td>
                        <td colspan="2"><input type="text" name="unlinkability_how"></td>
                    </tr>
                    <tr>
                        <th colspan="3">Obfuscation : Access to user's information in the application is limited and
                            blocked for outsiders
                        </th>
                    </tr>
                    <tr>
                        <td><INPUT TYPE="CHECKBOX" NAME="obfuscation" VALUE="obfuscation_used"></td>
                        <td colspan="2"><input type="text" name="obfuscation_how"></td>
                    </tr>
                    <tr>
                        <th colspan="3">Un-Detectability : The existence of information about a particular user in the
                            app cannot be detected from the data
                        </th>
                    </tr>
                    <tr>
                        <td><INPUT TYPE="CHECKBOX" NAME="undetectability" VALUE="undetectability_used"></td>
                        <td colspan="2"><input type="text" name="undetectability_how"></td>
                    </tr>
                    <tr>
                        <th colspan="3">Un-Observability : The existence of the user and his information cannot be
                            observed from the data
                        </th>
                    </tr>
                    <tr>
                        <td><INPUT TYPE="CHECKBOX" NAME="unobservability" VALUE="unobservability_used"></td>
                        <td colspan="2"><input type="text" name="unobservability_how"></td>
                    <tr>
                        <th colspan="3">Did the privacy risk value displayed help you in designing privacy? if so how?
                        </th>
                    </tr>
                    <tr>
                        <td colspan="3"><input type="text" name="risk_helped"></td>
                    </tr>

                </table>


                <br></br><br></br>
                <INPUT TYPE="SUBMIT" class="button" style="vertical-align:middle" VALUE="Submit >>">
            </form>


        </div>
    </div>
</section>
</body>
</html>
