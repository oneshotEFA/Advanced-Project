<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <style>
        body{
            margin: -2px;
            background-image: url("image/login_2.jpg");
            background-size: cover;
        }
        header{
            height: 50px;
        }
        .side-bar {
            position: absolute;
            position: fixed;
            z-index: 100;
            top: 20px;
            left: 20px;
            font-size: 25px;
            cursor: pointer;
        }
        .togg {
            height: 60%;
            width: 0;
            position: fixed;
            z-index: 99;
            top: 5%;
            left: 0;
            overflow-x: hidden;

            backdrop-filter:blur(6px);

            padding-top: 60px;
            transition: ease-out 0.4s;
        }
        .togg a {
            margin-top: 20px;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            font-size: 20px;
            display: block;
            border-color: #333;
            border-radius: 5px;
            transition: transform 0.3s;
        }
        .togg a:hover {
            transform: scale(1.05);
        }
        .main{
            display: flex;
            flex-wrap: wrap;
            width: 100%;
        }
        .info{
            width:55%;
            height: 500px;
        }
        .login{

            text-align: center;
            width: 45%;
            height: 500px;

            backdrop-filter:blur(6px);

            border-radius: 10%;
        }
        .login h2{
            position: relative;
            top: 12%;
            color: #fff;
            font-style: italic;
        }
        .login-form{
            position: relative;
            top:15%;
            left: -30px;
        }
        .login-form input{
            outline: none;
            background:transparent;
            width: 60%;
            height: 25px;
            border: none;
            border-bottom: solid 1px white;
        }

        .login-form .email,.login-form .pass{
            transition: transform 0.3s;
            padding: 15px;
        }
        .login-form .email:hover,.login-form .pass:hover{

            transform: scale(1.05);
        }
        ::placeholder{
            font-style: italic;
            color: #fff;
            font-size: 18px;
        }
        .bt{
            position: relative;
            padding-top: 20px;
        }

        button{
            cursor: pointer;
            font-style: italic;
            border: none;
            border-radius: 7px;
            height: 25px;
            background-color: rgb(109, 50, 50);
            color: rgb(255, 255, 255);
            font-size: 18px;
            width: 58%;
            transition: transform 0.3s,background-color 0.8s;
        }

        button:hover{
            transform: scale(1.05);
            background-color: red;
        }
        footer {
            position: relative;
            height: auto;
            color: rgb(252, 250, 250);
            padding: 0px;
            text-align: center;
            margin-bottom: 0;
        }

        footer a {
            color: #e5e6e5;
            text-decoration: none;
            margin: 0 ;
            font-size: 1rem;
            transition: color 0.3s;
        }
        footer .im{
            bottom: 0;
            padding-bottom: 0px;
            opacity: 0.6;
        }
        footer a:hover {
            color: #ebf3eb;
        }
        @keyframes scaleUp {
            0% {
                transform: scale(1.5);
                opacity: 0;
            }
            50% {
                transform: scale(1.075);
                opacity: 0.8;
            }
            100% {
                transform: scale(1) rotate(0);
                opacity: 1;
            }
        }
    </style>
</head>
<body>
<header>
    <div class="side-bar" onclick="togle()">
        <p>&#9776</p>
    </div>
</header>
<div class="main">
    <div class="info">
        <h3></h3>
    </div>
    <div class="login">
        <h2>Admin Login</h2>
        <div class="login-form">
            <form action="Login_handle" method="post">
                <div class="email">
                    <input type="text" placeholder="Email" required name="username">
                </div>
                <div class="pass">
                    <input type="password" placeholder="password" required name="password">
                </div>
                <div class="bt">
                    <button >Login</button>
                </div>

                <%
                    if (request.getAttribute("error")!=null){
                %>
                <div>
                    <p style="color: red"><%=request.getAttribute("error")%></p>
                </div>
                <%}%>
                 <div class="forgot">
                     <a style="color: white"  href="Forgot.jsp">Forgot Password?</a>
                 </div>
            </form>


        </div>
    </div>
</div>
<div class="togg" id="togg">
    <div>
        <a href="index.jsp">Home</a>
        <a href="#">Services</a>
        <a href="#">About Us</a>
        <a href="#">Contact Us</a>
    </div>
</div>
<footer>
    <footer>
        <p>&copy; 2024 . All rights reserved. | Designed with eph</p>
        <p>Follow us on <a href="#">Facebook</a>, <a href="#">Twitter</a>, and <a href="#">Instagram</a></p>

    </footer>
</footer>
<script>
    function togle() {
        var m = document.getElementById("togg");
        m.style.width = m.style.width === "150px" ? "0" : "150px";
    }
</script>
</body>
</html>