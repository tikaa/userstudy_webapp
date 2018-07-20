<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>User Study - University of New South Wales</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="style/css/main.css" rel="stylesheet">

    <%
        String[] selectedDatalist = session.getAttribute("selectedData").toString().split(",");
    %>
    <script language="javascript" type="text/javascript">
        window.history.forward();
    </script>

</head>
<body>
<section class="wrapper style2 special" id="two">
    <div class="inner narrow">
        <header>
            <h2 class="head-last">
                How do you change your decisions in data collection (to store in the app, or to share with third parties) after seeing the privacy
                risk of the data items? What changes would you do to better ensure that user privacy is protected in the system?
            </h2></header>
    </div>
    <div class="container">
        <div class="row ">
                <table id="customers">
                    <tr>
                        <th>Data Element</th>
                        <th>Associated Privacy Risk</th>
                        <th> Share</th>
                        <th> How you share</th>
                        <th> Store</th>
                        <th> Where you store</th>
                        <th> How you store</th>
                    </tr>

                    <FORM ACTION="eval_process_page.jsp" METHOD="post">
                    <%for (int i=0; i < selectedDatalist.length; i++) {
                        String dataName = selectedDatalist[i];
                        String howShare = dataName + "howshare";
                        String howStore = dataName + "howstore";
                        String whereStore = dataName + "wherestore";
                        float privacyRisk = Float.parseFloat(session.getAttribute(selectedDatalist[i]+"privacyRisk").toString());
                    %>
                        <tr>
                            <td><%=dataName %><br>
                            </td>
                            <td><%=privacyRisk%><br>
                            </td>
                            <td><INPUT TYPE="CHECKBOX" NAME="share" VALUE=<%=dataName %>></td>
                            <td><input type="text" name=<%=howShare %>></td>
                            <td><INPUT TYPE="CHECKBOX" NAME="store" VALUE=<%=dataName %>></td>
                            <td><input type="text" name=<%=howStore %>></td>
                            <td><input type="text" name=<%=whereStore %>></td>
                        </tr>
                            <%}%>
                </table>
                <INPUT TYPE="SUBMIT" class="button" style="vertical-align:middle" VALUE="Submit">
                </FORM>


            </div>
        </div>
</section>


</body>
</html>
