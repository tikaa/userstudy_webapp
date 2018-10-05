<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
</head>
<script language="javascript" type="text/javascript">
    window.history.forward();
</script>
<body>
<section class="wrapper style2 special" id="two">
    <div class="inner narrow">
        <header>
           <h2>Step IV : The model you followed calculates the privacy risk of the data through the steps you followed (determining the sensitivity, visibility and relatedness of data). The following privacy
           risk values of data are the outcomes of the model you followed</h2>
        </header>
            <form id="form" onsubmit="return myFunction()" method="post">
                <input type="hidden" name="_csrf" value="<%=sessionToken%>" />
            <table id="customers"><tr><th>Data Item</th><th>Privacy Risk</th></tr>
                <% String[] selectedDatalist = session.getAttribute("selectedData").toString().split(",");
                StringBuffer privacyRiskVal = new StringBuffer();
                double totalSum = 0.0;
                    for (String currDE : selectedDatalist) {
                        double sensitivity = Double.parseDouble(session.getAttribute(currDE+"sensitivity").toString());
                        double visibility = Double.parseDouble(session.getAttribute(currDE+"visibility").toString());
                        double relatedness = Double.parseDouble(request.getParameter(currDE));
                        double visibilitPow = Math.pow(visibility, 3);
                        double privacyRisk = (0.03 * sensitivity * visibilitPow )/( relatedness);
                        totalSum+= privacyRisk;
                        privacyRiskVal.append(currDE+"_sensitivity_" + sensitivity +"_visibility"+ visibility+"_relatedness_"+ relatedness +"_privacy risk : _" + privacyRisk+ "\n");
                        session.setAttribute(currDE+"privacyRisk", privacyRisk);
                %>
                    <tr><td><%=currDE %> </td><td><%=privacyRisk%></td></tr>
                <%
                    }

                    session.setAttribute("privacy_risk_values", privacyRiskVal);
                %>
                <tr><th>Total Perceived Privacy Risk of a user </th><th><%=totalSum%></th></tr>
            </table>

                <h3 class="head-last">
                    The values given above are the relative risk of the data elements you decided to collect, store or
                    share in this application design. This relative risk is the risk users would perceive when they disclose these data items
                    to the application you design. Based on this risk users would feel comfortable or uncomfortable using your app, and their trust
                    towards your app would also depend on the risks they perceive. Therefore, reducing this perceived privacy risk is good for the
                     application. Furthermore, you can also take measure to protect data with higher privacy risk in the system.
                    The following relationship shows how this risk value for each data item was derived.

                    In this model, the highest privacy risk is 2.43 and the lowest is 0.01.
                </h3>

                <img src="style/img/equation.jpg" width="500" height="200">

                <h3>As shown in the relationship, some ways you could reduce this risk are :
                    by reducing the visibility of data, limiting the use of sensitive data, or by avoiding using irrelevant data.</h3>
                <p> Do you think you would want to change your previous design decisions (decision to collect, store or
                    share) based on this risk values you see?
                </p>
                <input class="button" style="vertical-align:middle" type="submit"
                       value="Let's change my design >>"
                       onclick="javascript: form.action='change_design_page.jsp';"/> <br><br>
            </form>
    </div>
</section>
<div id="footer" style="align-content: center">
    page 09
</div>
</body>
</html>
