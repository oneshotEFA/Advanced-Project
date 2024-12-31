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
            background-color: #1e293b;
        }
        .container {
            background: rgba(59, 130, 246, 0.1);
            padding: 20px;
            color: #fff;
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
            border-inline: none;
        }
        button:hover {
            background-color: #0056b3;
        }
        .error-message {
            color: red;
            margin-top: 20px;
            font-size: 18px;

        }
        .success_message {
            color: green;
            margin-top: 20px;
            font-size: 18px;

        }
    </style>
</head>
<body>
<div class="container">
    <h2>Forgot Password</h2>
    <p>Enter your email to receive a verification code.</p>
    <form method="get" action="forgot">

        <input type="text" id="email" name="email" placeholder="Enter your username" required>
        <button onclick="showCodeInput()">Send Code</button>
    </form>

    <%
        String email = (String) request.getAttribute("email");
        String errorMessage = (String) request.getAttribute("error");
        String error_1 = (String) request.getAttribute("error_1");
        String success = (String) request.getAttribute("success");
        Boolean emailValid = (Boolean) request.getAttribute("emailValid");;
    %>

    <% if (errorMessage != null) { %>
    <div class="error-message">
        <%= errorMessage %>
    </div>
    <% } %>

    <% if (emailValid!=null) { %>
    <%if(success!=null){%>
    <div class="success_message">
        <%=success%>
    </div>
    <%}%>
    <%if(error_1!=null){%>
    <div class="error-message">
        <%= error_1 %>
    </div>
    <%}%>
    <form action="forgot" method="post">
        <div id="codeInputSection">
            <input type="hidden" value="<%= email %>" name="email">
            <input type="text" id="verificationCode" name="verificationCode" placeholder="Enter verification code" required>
            <button type="submit">Verify Code</button>
        </div>
    </form>
    <% } %>
</div>
</body>
</html>
