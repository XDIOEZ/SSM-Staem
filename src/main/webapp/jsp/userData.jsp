<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>用户信息页面</title>
</head>
<body>
<h1>用户信息</h1>

<%
    Integer userId = (Integer) session.getAttribute("userId");
    String username = (String) session.getAttribute("username");

    if (userId != null && username != null) {
%>
<p><strong>用户ID：</strong> <%= userId %></p>
<p><strong>用户名：</strong> <%= username %></p>
<%
} else {
%>
<p>您尚未登录，请先 <a href="login.jsp">登录</a>。</p>
<%
    }
%>

<a href="Main.jsp">返回主页面</a>
</body>
</html>
