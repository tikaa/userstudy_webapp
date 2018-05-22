<%@ page import="main.java.model.DataElement" %>
<%@ page import="javax.xml.crypto.Data" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--[if lte IE 8]><script src="../pages/css/js/ie/html5shiv.js"></script><![endif]-->
    <link rel="stylesheet" href="style/main.css" type="text/css"/>
    <!--[if lte IE 9]><link rel="stylesheet" href="css/css/ie9.css" /><![endif]-->

    <title>Select Data Items</title>
    <script>

        function myFunction() {

            var name = document.getElementById("name").value;
            var age = document.getElementById("age").value;
            var occupation = document.getElementById("occupation").value;
            var email = document.getElementById("email").value;
            var medicine = document.getElementById("medicine").value;
            var address = document.getElementById("address").value;
            var weight = document.getElementById("weight").value;
            var height = document.getElementById("height").value;
            var blood = document.getElementById("blood").value;
            var mobile = document.getElementById("mobile").value;

            return true;
        }
    </script>
</head>
<body>

<form id="form" action="login_finished.jsp" onsubmit="return myFunction()" method="post">
    <p>Question 01 : Please Select the Data elements from an end user you would consider selecting for the application scenario : </p>

    <ul role="listbox" tabindex="0" aria-label="email list">
        <li tabindex="-1" role="option" aria-checked="false">
            <input tabindex="-1" id="name" class="o-checkbox" type="checkbox"><label for="name"></label>
            Name
        </li>
        <li tabindex="-1" role="option" aria-checked="false">
            <input tabindex="-1" id="address" class="o-checkbox" type="checkbox"><label for="address"></label>
            Address
        </li>
        <li tabindex="-1" role="option" aria-checked="false">
            <input tabindex="-1" id="mobile_number" class="o-checkbox" type="checkbox"><label for="mobile_number"></label>
            Mobile Number
        </li>
        <li tabindex="-1" role="option" aria-checked="false">
            <input tabindex="-1" id="email" class="o-checkbox" type="checkbox"><label for="email"></label>
            Email Address
        </li>
        <li tabindex="-1" role="option" aria-checked="false">
            <input tabindex="-1" id="occupation" class="o-checkbox" type="checkbox"><label for="occupation"></label>
            Occupation
        </li>
        <li tabindex="-1" role="option" aria-checked="false">
            <input tabindex="-1" id="medicine" class="o-checkbox" type="checkbox"><label for="medicine"></label>
            Medicine Taken
        </li>
        <li tabindex="-1" role="option" aria-checked="false">
            <input tabindex="-1" id="blood" class="o-checkbox" type="checkbox"><label for="blood"></label>
            Blood Type
        </li>
        <li tabindex="-1" role="option" aria-checked="false">
            <input tabindex="-1" id="weight" class="o-checkbox" type="checkbox"><label for="weight"></label>
            Weight
        </li>
        <li tabindex="-1" role="option" aria-checked="false">
            <input tabindex="-1" id="height" class="o-checkbox" type="checkbox"><label for="height"></label>
            Height
        </li>
        <li tabindex="-1" role="option" aria-checked="false">
            <input tabindex="-1" id="age" class="o-checkbox" type="checkbox"><label for="age"></label>
            Age
        </li>
    </ul>

    <li>
        <div class="buttonHolder"><button class="button" type="submit" form="form"
                                                              value="Submit">Next >></button></div>
    </li>


</form>
<br><br>

</body>
</html>
