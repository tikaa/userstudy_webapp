<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="org.owasp.encoder.Encode" %><%--
  Created by IntelliJ IDEA.
  User: Awanthika
  Date: 10/4/2018
  Time: 1:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Introducing the Model</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="style/css/main.css" rel="stylesheet">
    <script language="javascript" type="text/javascript">
        window.history.forward();
    </script>
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
        String[] storeVals = request.getParameterValues("share");
        StringBuffer share_how = new StringBuffer();
        if (storeVals != null) {
            List storeList = Arrays.asList(storeVals);

            for (int i = 0; i < selectedDatalist.length; i++) {
                String currDataElement = selectedDatalist[i];
                if (storeList.contains(currDataElement)) {
                    share_how.append("_" + currDataElement);
                    String parameterHow = Encode.forHtmlAttribute(request.getParameter(currDataElement+ "howshare"));
                    if (parameterHow != null && !parameterHow.isEmpty() && parameterHow != "") {
                        share_how.append("_" + "sharedAs" + "_" + parameterHow);
                    }

                }

            }
            session.setAttribute("share_how", share_how.toString());

        }
    %>

</head>

<body>
<section id="banner">
    <h2>
        The Privacy Engineering Model for Data Protection in Software Systems
        </h2>
    <h3>
     In the next steps you would be following a model to determine the privacy risk associated with the data you decided to use in the application,
        following this model would help you to protect data in the system design.

    </h3>
</section>
<section class="wrapper special" id="one">
<div class="container">
    <div class="row ">
        <p>    In order to follow the model you would be asked to, determine the sensitivity of the data you decided to collect,
      determine the visibility of the data in the system you design
         and determine the relevance of the data you decided to collect to the system you design.
      Then, the model would display the privacy risk of the data you decided to collect, and you would have the opportunity to change the
        design based on the privacy risk values. Please proceed to follow the model

    </p>
    </div>
</div>
</section>
    <section class="wrapper style2 special" id="two">
        <div class="inner">

            <a href="set_sensitivity_page.jsp" class="button" style="vertical-align:middle" type="submit">Continue</a></header>
        </div>

</section>
</body>
</html>
