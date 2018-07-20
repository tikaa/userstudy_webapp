<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>User Study - University of New South Wales</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="style/css/main.css" rel="stylesheet">

</head>
<script language="javascript" type="text/javascript">
    window.history.forward();
</script>
<body>
<section class="wrapper style2 special" id="two">
    <div class="inner narrow">
        <header>
            <h2 class="head-last">
                The following values display the relative risk of the data elements you decided to collect, store or
                share in this application design.
            </h2>
        </header>
            <form id="form" onsubmit="return myFunction()" method="post">
            <table id="customers"><tr><th>Data Item</th><th>Privacy Risk</th></tr>
                <% String[] selectedDatalist = session.getAttribute("selectedData").toString().split(",");
                StringBuffer privacyRiskVal = new StringBuffer();
                    for (String currDE : selectedDatalist) {
                        double sensitivity = Double.parseDouble(session.getAttribute(currDE+"sensitivity").toString());
                        double visibility = Double.parseDouble(session.getAttribute(currDE+"visibility").toString());
                        double relatedness = Double.parseDouble(request.getParameter(currDE));
                        double privacyRisk = (sensitivity * visibility)/relatedness;
                        privacyRiskVal.append(currDE+"_sensitivity_" + sensitivity +"_visibility"+ visibility+"_relatedness_"+ relatedness
                        +"_privacy risk : _" + privacyRisk+ "\n");
                        session.setAttribute(currDE+"privacyRisk", privacyRisk);
                %>
                    <tr><th><%=currDE %> </th><th><%=privacyRisk%></th></tr>

                <%
                    }
                    session.setAttribute("privacy_risk_values", privacyRiskVal);
                %>
            </table>
                <p> Do you think you would want to change your previous design decisions (decision to collect, store or
                    share) based on this risk values you see?
                </p>
                <input class="button" style="vertical-align:middle" type="submit"
                       value="Yes, I want to change my design >>"
                       onclick="javascript: form.action='change_design_page.jsp';"/> <br><br>
                <input class="button" style="vertical-align:middle" type="submit"
                       value="No, I would not change my design >>"
                       onclick="javascript: form.action='eval_process_page.jsp';"/>
            </form>
    </div>
</section>
</body>
</html>
