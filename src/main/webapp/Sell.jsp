<%--
  Created by IntelliJ IDEA.
  User: efatr
  Date: 12/16/2024
  Time: 11:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Property Listing</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f4f4;
      color: #333;
    }
    header {
      color: white;
      text-align: center;
      height: 100px;
      background-color: #333;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 20px;
    }
    header h2 {
      margin: 0;
      font-size: 24px;
    }
    .the-form {
      margin: 30px auto;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .formm {
      background-color: #ffffff;
      width: 60%;
      padding: 20px 40px;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .card {
      margin-bottom: 20px;
      display: flex;
      flex-direction: column;
    }
    .card label {
      font-size: 14px;
      margin-bottom: 8px;
      font-weight: bold;
    }
    input[type="text"], input[type="file"] {
      height: 40px;
      padding: 8px;
      border: 1px solid #ccc;
      border-radius: 4px;
      font-size: 14px;
      width: 100%;
      box-sizing: border-box;
    }
    .card input[type="radio"] {
      margin-right: 8px;
    }
    textarea {
      width: 100%;
      height: 100px;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
      font-size: 14px;
    }
    button {
      background-color: #007bff;
      color: white;
      border: none;
      padding: 12px 20px;
      border-radius: 4px;
      cursor: pointer;
      font-size: 16px;
      width: 100%;
    }
    button:hover {
      background-color: #0056b3;
    }
    .form-title {
      text-align: center;
      margin-bottom: 20px;
      font-size: 18px;
      font-weight: bold;
    }
  </style>
</head>
<body>
<header>
  <%
    if (session != null && session.getAttribute("header") != null) {
  %>
  <h2><%= session.getAttribute("header") %></h2>
  <%
  } else {
  %>
  <h2>Property Request Form</h2>
  <%
    }
  %>
</header>

<div class="the-form">
  <div class="formm">
    <div class="form-title">Fill out the information about the property</div>
    <%
      if (session != null && session.getAttribute("header") != null) {
    %>
    <form method="post" action="add" enctype="multipart/form-data">
      <%
      }
      else {
      %>
    <form method="post" action="accept" enctype="multipart/form-data">
      <%
        }
      %>
      <div class="card">
        <label for="price">Price ($)</label>
        <input id="price" type="text" name="price" placeholder="Enter price in USD" required>
      </div>
      <div class="card">
        <label for="address">Address</label>
        <input id="address" type="text" name="address" placeholder="Enter the property's address" required>
      </div>

      <div class="card">
        <label for="size">Size (sq ft)</label>
        <input id="size" type="text" name="size" placeholder="Enter size in square feet" required>
      </div>
      <div class="card">
        <label for="bed">Bedrooms</label>
        <input id="bed" type="text" name="bed" placeholder="Number of bedrooms" required>
      </div>
      <div class="card">
        <label for="bath">Bathrooms</label>
        <input id="bath" type="text" name="bath" placeholder="Number of bathrooms" required>
      </div>
      <div class="card">
        <label>Status</label>
        <input type="radio" name="status" value="For Sell" required> For Sell
        <input type="radio" name="status" value="For Rent"> For Rent
      </div>
      <div class="card">
        <label for="description">Description</label>
        <textarea id="description" name="disc" placeholder="Provide a brief description of the property"></textarea>
      </div>
      <div class="card">
        <label>Upload Images</label>
        <input type="file" accept="image/*" name="img1">
        <input type="file" accept="image/*" name="img2">
        <input type="file" accept="image/*" name="img3">
      </div>
      <div class="card">
        <button type="submit">Submit</button>
      </div>
    </form>
  </div>
</div>
</body>
</html>
