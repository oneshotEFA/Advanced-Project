<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Property Listings</title>
  <style>
    body {
      background-color: #272c39;
      font-family: 'Helvetica Neue', Arial, sans-serif;
      margin: 0;
      padding: 0;
    }

    .slider img{
      object-fit: cover;
    }
    .menu a {
      margin-top: 20px;
      color: white;
      padding: 10px 20px;
      text-decoration: none;
      font-size: 20px;
      display: block;
      border-radius: 5px;
      transition: transform 0.3s;
    }
    .menu a:hover {
      transform: scale(1.05);
    }
    .container {
      display: flex;
      flex-direction: column;
      align-items: center;
      margin-top: 80px;
    }
    .property-card {
      background: white;
      border-radius: 10px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
      overflow: hidden;
      width: 100%;
      max-width: 600px;
      text-align: center;
      margin-bottom: 30px;
    }
    .slider {
      position: relative;
      width: 600px;
      height: 400px;
      overflow: hidden;
    }
    .slider img {
      width: 100%;
      height: auto;
      display: none;
      border-bottom: 2px solid #eaeaea;
    }
    .slider img.active {
      display: block;
    }
    .details {
      padding: 20px;
      text-align: left;
    }
    .details h4 {
      margin: 0;
      color: #333;
      font-size: 24px;
    }
    .details p {
      margin: 5px 0;
      color: #666;
      font-size: 16px;
    }
    .prev, .next {
      cursor: pointer;
      position: absolute;
      top: 50%;
      width: auto;
      padding: 16px;
      margin-top: -22px;
      color: white;
      font-weight: bold;
      font-size: 18px;
      border-radius: 50%;
      user-select: none;
      background-color: rgba(0, 0, 0, 0.7);
    }
    .next {
      right: 10px;
    }
    .prev {
      left: 10px;
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
    header {
      display: flex;
      justify-content: flex-end;
      align-items: center;
      padding: 1rem;
      background-color: #111827;
      color: white;
      border-bottom: 1px solid #374151;
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
  </style>
</head>
<body>
<header>
  <div class="barr" onclick="togle()">
    <p>&#9776;</p>
  </div>
</header>
<%
  if(session.getAttribute("isAdmin")!=null){
%>
<div class="togg" id="togg">
  <a href="redirect">Dashboard</a>
  <a href="#about">Objective</a>
  <a href="manage">Setting</a>
  <a href="Login_handle">Logout</a>
</div>
<%
}
else{
%>
<div class="togg" id="togg">
  <a href="index.jsp">Home</a>
  <a href="index.jsp">Services</a>
  <a href="#about">About Us</a>
  <a href="#about">Contact Us</a>
</div>
<%}%>
<div class="container">
  <%
    int id = 0, size = 0, bedroom = 0, bathroom = 0, price = 0;
    String address = null, description = null, status = null;
    byte[] image1 = new byte[0], image2 = new byte[0], image3 = new byte[0];
    ResultSet rs = null;
    if (request.getAttribute("individual") != null) {
      rs = (ResultSet) request.getAttribute("individual");
    } else {
      rs = (ResultSet) request.getAttribute("Data");
    }
    while (rs.next()) {
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
      String data2 = java.util.Base64.getEncoder().encodeToString(image2);
      String data3 = java.util.Base64.getEncoder().encodeToString(image3);
      String path1 = "data:image/jpeg;base64," + data1;
      String path2 = "data:image/jpeg;base64," + data2;
      String path3 = "data:image/jpeg;base64," + data3;
  %>
  <div class="property-card">
    <div class="slider">
      <img class="active" src="<%= path1 %>" alt="Property Image 1">
      <img src="<%= path2 %>" alt="Property Image 2">
      <img src="<%= path3 %>" alt="Property Image 3">
      <a class="prev" onclick="changeSlide(-1)">&#10094;</a>
      <a class="next" onclick="changeSlide(1)">&#10095;</a>
    </div>
    <div class="details">
      <h4><%= price %>$</h4>
      <p><%= bedroom %> Bedrooms | <%= bathroom %> Bathrooms</p>
      <p>Status: <%= status %></p>
      <p>Address: <%= address %>, Ethiopia</p>
      <p>Size: <%= size %> sq ft</p>
      <p>Description: <%=description%></p>
    </div>
  </div>
  <%
    }
  %>
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
        <li><a href="index.jsp">Home</a></li>
        <li><a href="index.jsp">Properties</a></li>
        <li><a href="view_buy">Services</a></li>
        <li><a href="index.jsp">Contact</a></li>
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

<script>
  let slideIndex = 0;

  function changeSlide(n) {
    const slides = document.querySelectorAll('.slider img');
    slideIndex += n;
    if (slideIndex >= slides.length) {
      slideIndex = 0;
    }
    if (slideIndex < 0) {
      slideIndex = slides.length - 1;
    }
    for (let i = 0; i < slides.length; i++) {
      slides[i].classList.remove('active');
    }
    slides[slideIndex].classList.add('active');
  }
  function togle() {
    var m = document.getElementById("togg");
    m.style.width = m.style.width === "150px" ? "0" : "150px";
  }
  changeSlide(0);
</script>
</body>
</html>