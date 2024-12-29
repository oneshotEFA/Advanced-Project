<%--
  Created by IntelliJ IDEA.
  User: efatr
  Date: 12/29/2024
  Time: 12:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
        }
        .container {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        input[type="email"], input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }
        button {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }

    </style>
</head>
<body>
<div class="container">
    <h2>Forgot Password</h2>
    <p>Enter your email to receive a verification code.</p>
    <form method="get" action="forgot">

        <input type="text" id="email" name="email" placeholder="Enter your email" required>
        <button >Send Code</button>
    </form>
    <%
        if(request.getAttribute("code")!=null){
        String email= (String) request.getAttribute("email");
        if(request.getAttribute("error")!=null){
            out.println(request.getAttribute("error"));
        }
        else{
            if(request.getAttribute("error_1")!=null){
                out.println(request.getAttribute("error_1"));
            }
            else {
                out.println("Verification key sent to your email fill the next input to continue");
            }
    %>
    <form action="forgot" method="post">
        <div id="codeInputSection" class="hidden">
            <input type="hidden" value="<%=email%>" name="email">
            <input type="text" id="verificationCode" name="verificationCode" placeholder="Enter verification code">
            <button type="submit">Verify Code</button>
        </div>
    </form>
    <%
        }
        }
    %>
</div>

<script>
    function showCodeInput() {
        const codeInputSection = document.getElementById("codeInputSection");
        codeInputSection.classList.remove("hidden");
    }
</script>
</body>
</html>

