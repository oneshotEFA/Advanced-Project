<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session == null || session.getAttribute("isAdmin") == null) {
        response.sendRedirect("AdminLoginPage.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>

    <style>
        body {
            margin: 0;
            background-color: #f4f4f4;
            font-family: 'Arial', sans-serif;

        }
        .barr {
            position: absolute;
            top: 20px;
            left: 20px;
            font-size: 25px;
            cursor: pointer;
            color: white;
        }

        .togg {
            height: 100%;
            width: 0;
            position: fixed;
            top: 0;
            left: 0;
            overflow-x: hidden;
            background-color: #272c39;
            padding-top: 100px;
            transition: width 0.4s ease;
        }

        .togg a {
            padding: 10px 20px;
            color: white;
            text-decoration: none;
            font-size: 20px;
            display: block;
            transition: background 0.3s, transform 0.3s;
        }

        .togg a:hover {
            transform: scale(1.05);
            background: #a783a6;
        }
        header {
            background-color: #272c39;
            color: white;
            padding: 15px;
            text-align: center;
            position: relative;
            z-index: 100;
        }
        .container {
            display: flex;
            flex-wrap: wrap;
            padding: 20px;
            margin-left: 250px;
        }
        .card {
            background: #272c39;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: 15px;
            flex: 1;
            min-width: 300px;
            max-width: 400px;
            padding: 20px;
            transition: transform 0.2s;
        }

        .card h2 {
            margin-top: 0;
            color: #a783a6;
        }
        .card p{
            color: #a783a6;
        }
        .btn {
            background-color: #a783a6;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .btn:hover {
            background-color: #98dea3;
        }
        footer {
            background-color: #272c39;
            color: white;
            text-align: center;
            padding: 10px 0;
            position: relative;
            margin-top: 20px;
            top:40px

        }
        footer a {
            color: #4CAF50;
            text-decoration: none;

        }
        footer a:hover {
            text-decoration: underline;
        }
        .feedback {
            position: relative;
            left: -80px;;
            display: flex;
            flex-wrap: wrap;
            padding: 20px;
            margin-left: 250px;
            justify-content: center;
        }
        .c{
            justify-items: center;
            background: #272c39;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin: 15px;

            max-width: 200px;
            padding: 20px;
            transition: transform 0.2s;
        }
        .m{
            background:#a783a6;
            color:  white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
            font-size: 14px;
            font-style: inherit;
        }
        .m:hover {
            background: #4CAF50;
        }
    </style>
</head>
<body>
<header>
    <div class="barr" onclick="toggleSidebar()">
        &#9776;
    </div>
    <h1>Welcome, Admin!</h1>
</header>
<div class="togg" id="togg">
    <a href="">Serves</a>
    <a href="">Dashboard</a>
    <a href="#">Objective</a>
    <a href="manage">Setting</a>
    <a href="Login_handle">Logout</a>
</div>
<div class="container">
    <div class="card">
        <form method="get" action="approve">
            <h2>Check Requests</h2>
            <p>View and manage pending requests from customers.</p>
            <button class="btn">View Requests</button>
        </form>
    </div>
    <div class="card">
        <form action="view_rent" method="post">
            <h2>Available Properties</h2>
            <p>See all properties available for sale and rent.</p>
            <button class="btn">View Properties</button>
        </form>
    </div>
    <div class="card">
        <form action="add" method="get">
            <h2>Add Property</h2>
            <p>Add new properties for sale or rent.</p>
            <button class="btn">Add Property</button>
        </form>
    </div>
    <div class="card">
        <form action="remove" method="get">
            <h2>Remove Sold Property</h2>
            <p>Delete properties that have been sold.</p>
            <button class="btn">Remove Property</button>
        </form>
    </div>
</div>
<div class="feedback">
    <div class="c">
        <button class="m">Feedback from customers</button>
    </div>
</div>
<footer>
    <p>&copy; 2024 Real Estate Broker <a href="#">About Us</a></p>
</footer>
<script>
    function toggleSidebar() {
        var sidebar = document.getElementById("togg");
        sidebar.style.width = sidebar.style.width === "150px" ? "0" : "150px";
    }
</script>
</body>
</html>