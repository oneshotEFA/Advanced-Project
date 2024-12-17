<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body{
            animation: scaleUp ease-out 1s;
            background-color: rgb(47, 58, 55);
        }
        .barr {
            position: absolute;
            top: 20px;
            z-index: 100;
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
            backdrop-filter:blur(10px);
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
        .bx{
            text-align: center;
            height: 170px;
            width: 300px;
            border-radius: 10px;
            display:block;
            overflow: hidden;
            border: none;
            margin-top: 30px;
        }
        .container{
            gap: 10px;
            width: 100%;
            display:flex;
            flex-wrap: wrap;
        }
        .att {
            border-radius: 5px;
            position: relative;
            top: 0;
            width: 300px;
            height: 60px;
            display: flex;
            flex-wrap: wrap;
            border: none;
            overflow: hidden;
            padding: 0px;
            box-sizing: border-box;
        }
        .att h4 {
            color: white;
            margin: 0;
            width: 100%;
        }
        .att p {
            color: white;
            margin: 0;
            font-size: 13px;
            flex-shrink: 0;
            white-space: nowrap;
        }
        .bx img{
            width: 300px;
            height: 170px;
            object-fit: cover;

        }
        .conn{
            cursor: pointer;
            backdrop-filter: blur(8px);
            transition: transform 0.3s;
            transform-style: preserve-3d;
            border: none;
        }
        .conn:hover{
            border-radius: 10%;
            border: solid 2px white;
            transform: scale(1.065);
        }
        footer {
            background-color: black;
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
        header{
            background-image: url("image/buildings-7848348.jpg");
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 70vh;
        }
        header h2{
            font-style: italic;
            position: absolute;
            color: white ;
            top: 0;
            left: 40%;
        }
        .info{
            position: relative;
            display: flex;
            justify-content: center;
            color: white;
        }
        .gall {
            height: 145px;
            width: 70px;
            position: relative;
            transform-style: preserve-3d;
            transform: perspective(2000px);
            animation: gallary 20s linear infinite;
            cursor: pointer;
        }

        .gall span {
            position: absolute;
            width: 100%;
            height: 100%;
            transform-style: preserve-3d;
            transform: rotateY(calc(var(--i)*45deg)) translatez(250px); /* Reduced depth effect */
        }
        .gall span img {
            height: 120px;
            width: 70px;
            object-fit: cover;
            position: absolute;
            border-radius: 10px;
            border: 6px ridge #ccc;
        }

        @keyframes gallary {
            0% {
                transform: perspective(2000px) rotateY(0deg);
            }
            100% {
                transform: perspective(2000px) rotateY(360deg);
            }
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
        .filter{
            display: flex;
            width: 400px;
            position: absolute;
            top:370px;
            right: 500px;
            text-align: center;
        }
        .filter button{
            color: white;
            border: none;
            background: transparent;
            width: 35%;
            cursor: pointer;
            border-radius: 10%;
            transition: background-color 0.5s;
        }
        .filter button:hover{
            background-color: rgb(221, 211, 211);
        }
        .filter input:hover{
            background-color: rgb(221, 211, 211);
        }
        .filter input{
            width: 65%;
            height: 30px;
            border: solid 1px white;
            border-radius: 7px;
            transition: background-color 0.5s;
            outline: none;
            background: transparent;
        }

    </style>
</head>
<body>
<header>
    <div class="barr" onclick="togle()">
        <p>&#9776;</p>
    </div>
    <div class="filter">
        <form action="search" method="post">
            <input type="search" placeholder="address.." name="address">
            <button id="searchButton">Search</button>
        </form>
    </div>
    <h2>Avilable Propertiess</h2>
    <div class="gall">
        <span style="--i:1"><img src="image/wesang.jpg" ></span>
        <span style="--i:2"><img src="image/ok.jpg" ></span>
        <span style="--i:3"><img src="image/ok2.jpg" ></span>
        <span style="--i:4"><img src="image/consrtuction.jpg" ></span>
        <span style="--i:5"><img src="image/theone.webp" ></span>
        <span style="--i:6"><img src="image/login_1.jpg" ></span>
        <span style="--i:7"><img src="image/R.jpg" ></span>
        <span style="--i:8"><img src="image/may.jpg" ></span>
    </div>
</header>
<div class="togg" id="togg">
    <a href="index.jsp">Home</a>
    <a href="#">Services</a>
    <a href="#">About Us</a>
    <a href="#">Contact Us</a>
</div>
<div class="info">
    <h3>The following are avilable proprerties which you can buy and rent and there detail information is writtin at the buttom of their picture</h3>
</div>
<div class="container">
    <%
        int id = 0,size = 0,bedroom=0,bathroom=0,price=0;
        String address = null,description = null,status = null;
        byte[] image1 = new byte[0],image2=new byte[0],image3=new byte[0];
        ResultSet rs=null;
        if(request.getAttribute("Data_filter")!=null){
            rs = (ResultSet) request.getAttribute("Data_filter");
        }
        else{
            rs = (ResultSet) request.getAttribute("Data");
        }
        while(rs.next()){
            try {
                id = rs.getInt(1);
                price = rs.getInt(2);
                address = rs.getString(3);
                size = rs.getInt(4);
                bedroom = rs.getInt(5);
                bathroom = rs.getInt(6);
                status = rs.getString(7);
                image1 = rs.getBytes(8);
                image2 = rs.getBytes(9);
                image3 = rs.getBytes(10);
                description = rs.getString(11);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        String data1 = java.util.Base64.getEncoder().encodeToString(image1);
        String path1 = "data:image/jpeg;base64,"+data1;
    %>`
    <div class="conn">
        <div class="bx">
           <img id="img1" src="<%=path1%>" alt="">
        </div>
        <div class="att">
           <h4><%=price%>$</h4>
           <p><%=bedroom%> bd  |</p>
           <p>|<%=bathroom%> ba |</p>
           <p>| <%=status%>> |</p>
           <p>| <%=address%>Ras Hotel |</p>
           <p>| <%=size%>sq </p>
        </div>
    </div>
    <%}%>
</div>
<footer>
    <footer>
        <p>&copy; 2024 . All rights reserved. | Designed with eph</p>
        <p>Follow us on <a href="#">Facebook</a>, <a href="#">Twitter</a>, and <a href="#">Instagram</a></p>
        <div class="im">
            <img src="image/footer-art.svg" alt="">
        </div>
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
