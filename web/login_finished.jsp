<%@ page import="main.java.model.DataElement" %>
<%@ page import="java.util.List" %>
<%@ page import="main.java.loginMgt.DataElemsReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  //  String[] dataElemNames = DataElemsReader.getInstance().allDataElemNames();
    //String password = request.getParameter("passwd");
   // boolean authenticationSuccess = UserManager.getInstance().validateCredential(request, username, password);
%>
<html>
<head>
    <title>Login Result!</title>
    <style>
        .button {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }

        .buttonHolder {
            text-align: center;
        }
    </style>
</head>
<body >
<%if (true) {
    List<DataElement> listofSelectElems = DataElemsReader.getInstance().generateDataElems();
    int[] selectedDataElems = new int[listofSelectElems.size()];
    for (int i =0; i<listofSelectElems.size(); i++) {
             if( request.getParameter(listofSelectElems.get(i).getDataElemName()) == "true") {
                    selectedDataElems[i] = 1;
             } else {
                 selectedDataElems[i] =0;
             }

    }
    request.setAttribute("selected", selectedDataElems.length);

%>
<h1 align="center">The selected list by the user</h1>
<br><b><%= request.getAttribute("selected") %></b></br>
<% } else { %>
<h1 align="center">Incorrect Username of Password!</h1>
<br>
<div class="buttonHolder">
    <a href="login.jsp">
        <button class="button"> Try Again!</button>
    </a>
</div>
<%}%>

</body>
</html>
