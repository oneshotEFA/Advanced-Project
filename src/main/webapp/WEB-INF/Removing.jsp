<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%

  if (session == null ) {
    response.sendRedirect("login.html"); // Redirect to login page
    return;
  }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Admin Remove properties</title>
  <style>
    body{
      background-color: #cccccc;
    }
    .container{
      gap: 10px;
      width: 100%;
      display:flex;
      flex-wrap: wrap;
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
    .bx img{
      width: 300px;
      height: 170px;
      object-fit: cover;
    }
    .conn{
      background-color: rgba(190, 204, 195, 0.93);
      display: flex;
      flex-wrap: wrap;
      height: 300px;
      width: 400px;
    }
  </style>

</head>
<body>

<div class="container">
  <%
    int id = 0,size = 0,bedroom=0,bathroom=0,price=0;
    String address = null,description = null,status = null;
    byte[] image1 = new byte[0],image2=new byte[0],image3=new byte[0];
    ResultSet rs = (ResultSet) request.getAttribute("pro");
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
    <form action="remove" method="post">
      <input type="hidden" value="<%=id%>" name="id">
      <button>Remove Property</button>
    </form>
  </div>
  <%}%>
</div>

<script>
  function togle() {
    var m = document.getElementById("togg");
    m.style.width = m.style.width === "150px" ? "0" : "150px";
  }
</script>
</body>
</html>
