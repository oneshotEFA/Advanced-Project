<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session == null || session.getAttribute("isAdmin") == null) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    }
%>
<html>
<head>
    <title>Manage Account</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #1e293b;
            color: #333;
        }
        .container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            color: #fff;
            background: rgba(59, 130, 246, 0.1);
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 15px;
        }
        input[type="password"], input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #a783a6;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }
        button:hover {
            background-color: #a783a6;
        }
        .message {
            text-align: center;
            margin-top: 20px;
            color: #d9534f; /* Red for error messages */
        }
        .success {
            color: #5cb85c;
        }
        .section {
            margin-bottom: 30px; /* Space between sections */
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Manage Account</h1>

    <!-- Change Password Section -->
    <div class="section">
        <h2>Change Password</h2>
        <form method="post" action="manage">
            <label>
                <input type="password" placeholder="Current Password" name="current" required>
            </label>
            <label>
                <input type="password" placeholder="New Password" name="new-1" required>
            </label>
            <label>
                <input type="password" placeholder="Verify New Password" name="new-2" required>
            </label>
            <button type="submit">Change Password</button>
        </form>
    </div>

    <%
        String message = "";
        if (request.getAttribute("success") != null) {
            message = (String) request.getAttribute("success");
            out.print("<p class='success'>" + message + "</p>");
        } else if (request.getAttribute("current_error") != null) {
            message = (String) request.getAttribute("current_error");
            out.print("<p class='message'>" + message + "</p>");
        } else if (request.getAttribute("not_match") != null) {
            message = (String) request.getAttribute("not_match");
            out.print("<p class='message'>" + message + "</p>");
        }
    %>
    <div class="section">
        <h2>Change Username</h2>
        <form method="post" action="change_Admin_name">
            <label>
                <input type="text" placeholder="New Username" name="newUsername" required>
            </label>
            <label>
                <input type="password" placeholder="current Password" name="pass" required>
            </label>
            <button type="submit">Change Username</button>
        </form>
    </div>
    <%
        String msg="";
        if(request.getAttribute("changed")!=null){
            msg= (String) request.getAttribute("change");

    %>
    <p style="color: #4cae4c"><%=request.getAttribute("changed")%></p>
    <%
        }
    %>

</div>
</body>
</html>