<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Study - University of New South Wales</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="style/css/main.css" rel="stylesheet">

    <script>
        function validateForm() {
            var checked=false;
            var elements = document.getElementsByName("store");
            for(var iterator=0; iterator <elements.length; iterator++){
                var dataElem = elements[iterator].valueOf().value;
                if(elements[iterator].checked) {
                    var whereStore = document.forms["share_form"][dataElem + "where"].value;
                    var howStore = document.forms["share_form"][dataElem + "how"].value;

                    if(howStore == null || howStore == "") {
                        alert("Please select how you want to store " + dataElem)
                        return false;

                    } else if (whereStore == null || whereStore == ""){
                        alert("Please select where you want to store " + dataElem)
                        return false;
                    } else {
                        checked = true;
                    }
                }
            }
            if(!checked)
            {
                alert("If you do not want to store any data item, select the last option, I do not want to store data")
            }
            return checked;
        }
    </script>
    <script language="javascript" type="text/javascript">
        window.history.forward();
    </script>
</head>
<body onload="noBack();"
      onpageshow="if (event.persisted) noBack();" onunload="">
<%
    String[] selectedDatalist = session.getAttribute("selectedData").toString().split(",");
    StringBuffer purposeNamePair = new StringBuffer();
    for ( int i = 0 ; i <selectedDatalist.length; i++) {
        purposeNamePair.append(selectedDatalist[i] + "_" + request.getParameter(selectedDatalist[i] + "purpose"));
        if (i < selectedDatalist.length - 1) {
            purposeNamePair.append(", \n");
        }
    }
    session.setAttribute("purposeNamePair", purposeNamePair.toString());
%>
<section class="wrapper style2 special" id="two">
    <div class="inner narrow">
        <header>
            <h2 class="head-last">
                Select the Data elements from an end user you would consider storing, where you store data (third party
                database, cloud, user's
                device) and how you store data (anonymized, aggregated, encrypted etc. )
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
            <table id="customers">
                <tr>
                    <th>Data Element</th>
                    <th>Store?</th>
                    <th>How to Store</th>
                    <th>Where to Store</th>
                </tr>
                <FORM name = "share_form" ACTION="share_data_page.jsp" METHOD="post" onsubmit="return validateForm()">

                        <%
                        for (int val =0; val<selectedDatalist.length; val++) {
                            String dataName = selectedDatalist[val];
                            String howStore = dataName + "how";
                            String whereStore = dataName + "where";
                        %>
                    <tr>
                        <td><%=dataName %>
                        </td>
                        <td><INPUT TYPE="CHECKBOX" NAME="store" VALUE=<%=dataName %>></td>

                        <td><input type="text" name=<%=howStore %>></td>
                        <td><input type="text" name=<%=whereStore%>></td>
                    </tr>
                        <%}%>
                            <tr><td colspan="3">I do not want to store any data item in the application </td> <td> <INPUT TYPE="CHECKBOX" NAME="store" VALUE="noData"></td></tr>
            </table>

            <br></br><br></br>
            <INPUT TYPE="SUBMIT" class="button" style="vertical-align:middle" VALUE="Continue >>">
            </FORM>


        </div>
    </div>
</section>
<br><br>

</body>
</html>
