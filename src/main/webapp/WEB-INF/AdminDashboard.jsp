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
            background-color: #1e293b;
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
            background: #2563eb;
        }
        header {
            border-bottom: 2px solid #ccc;
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
            background: rgba(59, 130, 246, 0.1);
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(109, 243, 206, 0.1);
            margin: 15px;
            flex: 1;
            min-width: 300px;
            max-width: 400px;
            padding: 20px;
            transition: transform 0.2s;
        }

        .card h2 {
            margin-top: 0;
            color: #fff;
        }
        .card p{
            color: #fff;
        }
        .btn {
            background-color: #2563eb;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .btn:hover {
            background-color: #2563eb;
        }
        .footer {
            background-color: #111827;
            color: white;
            padding: 2rem 1rem;
            margin-top: 2rem;
        }
        .footer-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }
        .footer-section {
            text-align: left;
        }
        .footer-section h3 {
            font-size: 1.25rem;
            margin-bottom: 1rem;
            color: #1d4ed8;
        }
        .footer-section p,
        .footer-section ul {
            font-size: 0.9rem;
            line-height: 1.5;
        }
        .footer-section ul {
            list-style: none;
            padding: 0;
        }
        .footer-section ul li {
            margin-bottom: 0.5rem;
        }
        .footer-section ul li a {
            text-decoration: none;
            color: #94a3b8;
            transition: color 0.3s;
        }
        .footer-section ul li a:hover {
            color: #1d4ed8;
        }
        .social-icons a {
            display: inline-block;
            margin-right: 0.5rem;
        }
        .social-icons img {
            width: 24px;
            height: 24px;
            transition: opacity 0.3s;
        }
        .social-icons img:hover {
            opacity: 0.8;
        }
        .footer-bottom {
            text-align: center;
            margin-top: 2rem;
            font-size: 0.8rem;
            border-top: 1px solid #374151;
            padding-top: 1rem;
            color: #94a3b8;
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
            width: 700px;
            justify-items: start;
            background: rgba(59, 130, 246, 0.1);
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(109, 243, 206, 0.1);
            margin: 15px auto;
            max-width: 400px;
            padding: 20px;
            transition: transform 0.2s;
            text-align: left;
        }
        .m{
            background:#2563eb;
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
            background: #2563eb;
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
    <a href="redirect">Dashboard</a>
    <a href="#about">Objective</a>
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
        <form action="feedback" method="get">
            <h5 style="color: white">Feedback from customers</h5>
            <button class="m">Feedback</button>
        </form>
    </div>
</div>
<footer class="footer" id="about">
    <div class="footer-container">

        <div class="footer-section">
            <h3>About Us</h3>
            <p>
                We provide a seamless way to search for properties that suit your needs.
                Discover your dream home or investment property with us.
            </p>
        </div>
        <div class="footer-section">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="#home">Home</a></li>
                <li><a href="#properties">Properties</a></li>
                <li><a href="#services">Services</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
        </div>
        <div class="footer-section">
            <h3>Contact Us</h3>
            <p><strong>Email:</strong> info@propertyfinder.com</p>
            <p><strong>Phone:</strong> +251 985 094 082</p>
            <p><strong>Address:</strong> 123 Main Street, New York, NY</p>
        </div>
        <div class="footer-section">
            <h3>Follow Us</h3>
            <div class="social-icons">
                <a href="#"><img src="https://img.icons8.com/material-outlined/24/ffffff/facebook--v1.png" alt="Facebook"></a>
                <a href="#"><img src="https://img.icons8.com/material-outlined/24/ffffff/twitter--v1.png" alt="Twitter"></a>
                <a href="#"><img src="https://img.icons8.com/material-outlined/24/ffffff/instagram-new.png" alt="Instagram"></a>
                <a href="#"><img src="https://img.icons8.com/material-outlined/24/ffffff/linkedin.png" alt="LinkedIn"></a>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2024 Effortless Property. All Rights Reserved.</p>
    </div>
</footer>
<script>
    function toggleSidebar() {
        var sidebar = document.getElementById("togg");
        sidebar.style.width = sidebar.style.width === "150px" ? "0" : "150px";
    }
</script>
</body>
</html>