<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Property</title>
  <style>
    body{
      background-color: #506651;
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

  </style>
</head>
<body>
  <div class="barr" onclick="togle()">
    <p>&#9776;</p>
  </div>
  <div class="togg" id="togg">
    <a href="index.jsp">Home</a>
    <a href="#">Services</a>
    <a href="#">About Us</a>
    <a href="#">Contact Us</a>
  </div>
<div class="container">
  <%
    int id = 0,size = 0,bedroom=0,bathroom=0,price=0;
    String address = null,description = null,status = null;
    byte[] image1 = new byte[0],image2=new byte[0],image3=new byte[0];
    ResultSet rs=null;
    if(request.getAttribute("individual")!=null){
      rs = (ResultSet) request.getAttribute("individual");
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
      <p>| <%=address%>, Ethiopia |</p>
      <p>| <%=size%>sq </p>
    </div>

  </div>
  <%}%>
</div>

</body>
</html>
