<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Real Estate Broker</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            background-color: #f9f9f9;
            color: #333;
            line-height: 1.6;
            animation: scaleUp ease-out 1s;
        }


        header {
            height: 600px;
            background-image: url("image/barbod-nili-lowscale.jpg");
            background-size: cover;
            background-position: center;
            color: white;
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 20px;
        }

        header h2 {
            font-size: 3rem;
            margin: 0;
        }
        header p {
            font-size: 1.5rem;
            margin-top: 10px;
            font-style: italic;
        }

        .barr {
            position: absolute;
            top: 20px;
            left: 20px;
            font-size: 25px;
            cursor: pointer;
        }

        /* Sidebar Menu */
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
        .cont {
            margin-top: 20px;
        }
        .cont a {
            text-decoration: none;
            font-size: 1.2rem;
            color: white;
            background-color: rgba(0, 0, 0, 0.7);
            padding: 10px 20px;
            border-radius: 5px;
            margin: 0 10px;
            transition: background-color 0.3s;
        }

        .cont a:hover {
            background-color: rgb(212, 187, 118);;
        }

        .boxx {
            display: flex;
            justify-content: center;
            gap: 40px;
            flex-wrap: wrap;
            margin: 40px 0;
            padding: 0 20px;
        }

        .boxx .buy, .boxx .rent, .boxx .sell {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 10px;
            width: 250px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            padding: 20px;
        }

        .boxx .buy:hover, .boxx .rent:hover, .boxx .sell:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }

        .boxx img {
            width: 100%;
            height: auto;
            border-radius: 10px;
            margin-bottom: 10px;
        }
        .rent img{
            opacity: 0.6;
        }
        .buy img{
            opacity: 0.6;
        }
        .boxx a {
            text-decoration: none;
            color: rgb(212, 187, 118);
            font-size: 1.2rem;
            font-weight: bold;
            display: inline-block;
            margin-top: 10px;
            transition: color 0.3s;
        }

        .boxx a:hover {
            color: #212421;
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
        footer {
            position: relative;
            height: auto;
            background-color: black;
            color: rgb(252, 250, 250);
            padding: 0px;
            text-align: center;
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
            opacity: 0.5;
        }
        footer a:hover {
            color: #ebf3eb;
        }


    </style>
</head>
<body>

<header>
    <div class="barr" onclick="togle()">
        <p>&#9776;</p>
    </div>
    <h2>Real Estate Broker</h2>
    <p>Your first choice in real estate services</p>
    <div class="cont">
        <a href="view_buy">Buy</a>
        <a href="view_rent">Rent</a>
        <a href="Sell.jsp">Sell</a>
        <a href="#">About Us</a>
    </div>
</header>

<div class="togg" id="togg">

    <a href="AdminLoginPage.jsp">Admin</a>
    <a href="#">Services</a>
    <a href="#">About Us</a>
    <a href="#">Contact Us</a>
</div>

<div class="boxx">
    <div class="buy">
        <img src="image/OPI(4).jpg" alt="Buy Properties" for="buy">
        <a id="buy" href="view_buy">Buy</a>
    </div>
    <div class="rent">
        <img src="image/OPI(5).jpg" alt="Rent Properties" for="rent">
        <a id="rent" href="view_rent">Rent</a>
    </div>
    <div class="sell">
        <img src="image/OPI(4).jpg" alt="Buy Properties" for="buy">
        <a id="Sell" href="Sell.jsp">Sell</a>
    </div>
</div>

<footer>
    <footer>
        <p>&copy; 2024 . All rights reserved. | Designed with ♥ eph</p>
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
