
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="manage">
    <label>
        <input type="password" placeholder="current password" name="current">
    </label>
    <label>
        <input type="password" placeholder="new password" name="new-1">
    </label>
    <label>
        <input type="password" placeholder="verify" name="new-2">
    </label>
    <button>Change</button>
</form>
<%
    String message="";
    if(request.getAttribute("success")!=null){
        message= (String) request.getAttribute("success");
    } else if (request.getAttribute("current_error")!=null) {
        message= (String) request.getAttribute("current_error");
    } else if (request.getAttribute("not_match")!=null) {
        message=(String)request.getAttribute("not_match");
    }
%>
<p><%=message%></p>
</body>
</html>
