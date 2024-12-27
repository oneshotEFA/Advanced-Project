<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Property Listings</title>
  <style>
    body {
      background-color: #a783a6;
      font-family: 'Helvetica Neue', Arial, sans-serif;
      margin: 0;
      padding: 0;
    }
    .navbar {
      position: absolute;
      top: 20px;
      left: 20px;
      font-size: 25px;
      cursor: pointer;
      color: #333;
    }
    .menu {
      height: 60%;
      width: 0;
      position: fixed;
      z-index: 99;
      top: 5%;
      left: 0;
      overflow-x: hidden;
      backdrop-filter: blur(10px);
      padding-top: 60px;
      transition: ease-out 0.4s;
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
  </style>
</head>
<body>
<div class="navbar" onclick="toggleMenu()">
  <p>&#9776;</p>
</div>
<div class="menu" id="menu">
  <a href="index.jsp">Home</a>
  <a href="#">Services</a>
  <a href="#">About Us</a>
  <a href="#">Contact Us</a>
</div>
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

  function toggleMenu() {
    const menu = document.getElementById('menu');
    if (menu.style.width === '250px') {
      menu.style.width = '0';
    } else {
      menu.style.width = '250px';
    }
  }
  changeSlide(0);
</script>
</body>
</html>