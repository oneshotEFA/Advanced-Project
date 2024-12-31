<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reset Password</title>
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
      width: 300px;
      text-align: center;
    }
    input[type="password"] {
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
    .error {
      color: red;
      font-size: 14px;
      margin-top: 10px;
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
      border-radius: 5px;
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
<%
  String email= (String) request.getAttribute("Admin");
%>
<div class="container">
  <h2>Reset Password</h2>
  <form id="passwordForm" method="post" action="update_pass">
    <input type="hidden" value="<%=email%>" name="email">
    <input type="password" id="newPassword" name="newPassword" placeholder="Enter new password" required>
    <input type="password" id="verifyPassword" name="verifyPassword" placeholder="Verify new password" required>
    <button type="button" onclick="validatePassword()">Submit</button>
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
      <%
        }
        else if (request.getAttribute("message_error")!=null){
      %>
      <div id="myModal" class="modal">
        <div class="modal-content">
          <span class="close" onclick="closeModal()">&times;</span>
          <p style="color: red"><%=request.getAttribute("message_error")%></p>
        </div>
      </div>
      <%
        }
      %>
    </div>
  </form>
</div>
<script>

  function validatePassword() {
    const newPassword = document.getElementById("newPassword").value;
    const verifyPassword = document.getElementById("verifyPassword").value;
    const errorMessage = document.getElementById("errorMessage");

    errorMessage.textContent = "";
    if (newPassword === verifyPassword) {
      document.getElementById("passwordForm").submit();
    } else {
      errorMessage.textContent = "Passwords do not match. Please try again.";
    }
  }
  var modal = document.getElementById("myModal");
  if (modal) {
    modal.style.display = "block";
  }
  function closeModal() {
    modal.style.display = "none";
    <%
      if (request.getAttribute("message") != null) {
    %>
    window.location.href = "AdminLoginPage.jsp";
    <%
      }
    %>
  }
  window.onclick = function(event) {
    if (event.target === modal) {
      modal.style.display = "none";
    }
    <%
      if (request.getAttribute("message") != null) {
    %>
    window.location.href = "AdminLoginPage.jsp";
    <%
      }
    %>
  }

</script>
</body>
</html>
