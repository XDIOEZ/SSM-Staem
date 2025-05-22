<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2025/5/22
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<form action="${pageContext.request.contextPath}/user/check_Admin.do" method="post">
  <br> <input type="text" name="id" placeholder="管理员身份码" required>
  <br> <input type="text" name="username" placeholder="管理员账号" required>
  <br> <input type="password" name="password" placeholder="密码" required>
  <br> <button type="submit">登录</button>
</form>

<body>

</body>
</html>
