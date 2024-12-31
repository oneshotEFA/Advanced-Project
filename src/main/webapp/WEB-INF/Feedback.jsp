<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Feedback Viewer</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            line-height: 1.6;
            background-color: #1e293b;
            color: #fff;
        }
        .heade {
            text-align: center;
            margin-bottom: 20px;
            border-bottom: 2px solid #ccc;
            padding-bottom: 10px;
        }
        .feedback {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 10px;
        }
        .feedback h2 {
            margin: 0 0 10px 0;
            font-size: 18px;
        }
        .feedback p {
            margin: 5px 0;
        }
        button {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #0056b3;
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
    <h1 class="heade">Admin Feedback Viewer</h1>
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
<%
    ResultSet rs = (ResultSet) request.getAttribute("feedback");
    if(rs==null){
        out.println("couldn't get the result set");
    }
    String name="",msg="",type="",email="";
    int  phone = 0;
    while(rs.next()){
        try {
            name = rs.getString(2);
            email=rs.getString(3);
            phone=rs.getInt(4);
            type=rs.getString(5);
            msg=rs.getString(6);
        } catch (SQLException e) {
            out.println(e.getMessage());
        }
%>
<div class="feedback">
    <h2>Name:<%=name%></h2>
    <p>Email:<%=email%></p>
    <p>Phone:<%=phone%></p>
    <p>Type:<%=type%></p>
    <p>Feedback:<%=msg%> </p>
</div>
<%
    }
%>

<script>
    function togle() {
        var m = document.getElementById("togg");
        m.style.width = m.style.width === "150px" ? "0" : "150px";
    }
</script>

</body>
</html>

