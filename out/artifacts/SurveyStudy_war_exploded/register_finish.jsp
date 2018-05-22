<%@ page import="main.java.loginMgt.UserManager" %>
<%@ page import="main.java.loginMgt.User" %>
<%@ page import="main.java.loginMgt.exception.UserExistException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = request.getParameter("username");
    String passwd1 = request.getParameter("passwd1");
    String passwd2 = request.getParameter("passwd2");
    boolean addSuccess = false;
    try {
    UserManager.getInstance().registerUser(request, new User(username, passwd1));
        addSuccess = true;
    } catch (UserExistException e) {
        addSuccess = false;
    }
%>
<html>
<head>
    <title>User registration result!</title>
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
        .buttonHolder{ text-align: center; }
    </style>
</head>
<body style="background-color:azure;">
<% if (addSuccess) { %>
<h1 align="center">Registration Successful!</h1>
<br>
<div class="buttonHolder">
    <a href="login.jsp"><button class="button"> Go to Login Page.</button></a>
</div>
<% } else { %>
<h1 align="center">Username is already in use!</h1>
<% } %>

</body>
</html>
