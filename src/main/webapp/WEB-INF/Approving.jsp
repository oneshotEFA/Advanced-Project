<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%

    if (session == null || session.getAttribute("isAdmin") == null ) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin approving</title>
    <style>
        html {
            scroll-behavior: smooth;
        }
        body {
            font-family: "Poppins", sans-serif;
            background-color: rgb(17, 24, 39);
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1200px;
            margin: 8px auto;
            width: 100%;
        }
        header {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            padding: 1rem;
            background-color: #111827;
            color: white;
            border-bottom: 1px solid #374151;
        }
        .search-bar {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        .search-bar input[type="text"] {
            padding: 0.5rem;
            border: 1px solid #374151;
            border-radius: 4px;
            width: 250px;
            background-color: #1e293b;
            color: white;
        }
        .search-bar input[type="text"]::placeholder {
            color: #94a3b8;
        }
        .search-bar button {
            background-color: #1d4ed8;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .search-bar button:hover {
            background-color: #2563eb;
        }
        .services-header {
            text-align: center;
            font-size: 2.5rem;
            margin: 2rem 0 1rem;
            color: white;
            font-weight: bold;
        }
        .cards {
            display: flex;
            flex-wrap: wrap;
            gap: 1.5rem;
            padding: 1rem;
        }
        .card {
            cursor: pointer;
            max-width: 280px;
            width: 100%;
            background-color: #1e293b;
            border-radius: 1rem;
            padding: 1.5rem;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            transition: transform 0.3s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .card:hover {
            transform: scale(1.05);
        }
        .image-container {
            width: 100%;
            height: 200px;
            border-radius: 0.75rem;
            overflow: hidden;
            position: relative;
            margin-bottom: 1rem;
        }
        .image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .Service-h2 {
            font-size: 1.5rem;
            margin-bottom: 1rem;
            font-weight: bold;
            color: white;
        }
        .ps {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 8px;
            margin: 1rem 0;
            color: #94a3b8;
            text-align: left;
            width: 100%;
        }
        .ps p {
            margin: 0;
        }
        .card button {
            background-color: #1d4ed8;
            border: none;
            padding: 8px 16px;
            border-radius: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 150px;
        }
        .card button a {
            color: white;
            text-decoration: none;
            font-weight: 500;
        }
        .card button:hover {
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
        .barr {
            color: #fff;
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
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4);
            padding-top: 60px;
            border-radius: 8px;
        }
        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 500px;
            border-radius: 8px;
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>

</head>
<body>
<header>
    <div class="barr" onclick="togle()">
        &#9776;
    </div>
</header>
<div class="togg" id="togg">
    <a href="redirect">Dashboard</a>
    <a href="#about">Objective</a>
    <a href="manage">Setting</a>
    <a href="Login_handle">Logout</a>
</div>
<div class="container">
    <h1 class="services-header">Approving Customers Request to Web</h1>
    <div class="cards">
    <%
        int id = 0,size = 0,bedroom=0,bathroom=0,price=0;
        String address = null,description = null,status = null;
        byte[] image1 = new byte[0],image2=new byte[0],image3=new byte[0];
        ResultSet rs = (ResultSet) request.getAttribute("property_accept");
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
    <div class="card" >
        <div class="image-container">
            <img src="<%=path1%>" alt="House"/>
        </div>
        <h2 class="Service-h2"><%=price%>$</h2>
        <div class="ps">
            <p><strong>Property:</strong> <%=status%> </p>
            <p><strong>Bedroom:</strong><%=bedroom%></p>
            <p><strong>Address:</strong> <%=address%>, Ethiopia</p>
            <p><strong>Size:</strong> <%=size%>sq </p>
            <p><strong>Bathroom:</strong><%=bathroom%></p>
            <p><strong>Description:</strong><%=description%></p>
        </div>
        <form action="approve" method="post">
            <input type="hidden" value="<%=id%>" name="id">
            <button>Approve To Web</button>
        </form>
    </div>
    <%}%>
    </div>
</div>
<div id="errorMessage" class="error">
    <%
        if (request.getAttribute("message")!=null){
    %>
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <p style="color: #4cae4c"><%=request.getAttribute("message")%></p>
        </div>
    </div>
    <%}%>
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
                <li><a href="redirect">Home</a></li>
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
    function togle() {
        var m = document.getElementById("togg");
        m.style.width = m.style.width === "150px" ? "0" : "150px";
    }
    var modal = document.getElementById("myModal");
    if (modal) {
        modal.style.display = "block";
    }
    function closeModal() {
        modal.style.display = "none";

    }
    window.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    }
</script>
</body>
</html>