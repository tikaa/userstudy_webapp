<%--
  Created by IntelliJ IDEA.
  User: Asus PC
  Date: 1/10/2017
  Time: 10:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
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
    <script>
        function myFunction() {
            var pass1 = document.getElementById("passwd1").value;
            var pass2 = document.getElementById("passwd2").value;
            var ok = true;
            if (pass1 != pass2) {
                alert("Passwords Do not match");
                ok = false;
            }
            return ok;
        }
    </script>
</head>
<body style="background-color:azure;">
<h1 align="center">Register New User.</h1>
<br>
<form id="form" action="register_finish.jsp" onsubmit="return myFunction()" method="post">
    <table align="center" width="95%">
        <tr>
            <td> <h3>Username</h3></td>
            <td>:</td>
            <td><input size="50" name="username" id="username" placeholder="username" form="form" type="text" required/></td>
        </tr>
        <tr>
            <td> <h3>Password</h3></td>
            <td>:</td>
            <td><input size="50" name="passwd1" id="passwd1" placeholder="Password" form="form" type="password" required/></td>
        </tr>
        <tr>
            <td> <h3>Confirm Password</h3></td>
            <td>:</td>
            <td><input size="50" name="passwd2" id="passwd2" placeholder="Confirm Password" form="form" type="password" required/></td>
        </tr>
        <tr>
            <td colspan="3"><br><div class="buttonHolder"><button class="button" type="submit" form="form"
                                                                  value="Submit">Register</button></div></td>
        </tr>
    </table>

</form>
</body>
</html>
