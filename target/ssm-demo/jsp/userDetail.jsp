<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>编辑用户信息</title>
    <style>
        body { font-family: Arial, sans-serif; }
        form { margin: 20px; }
        label { display: inline-block; width: 80px; }
        input[type="text"], input[type="password"] { width: 200px; padding: 5px; }
        input[type="submit"] { padding: 5px 10px; margin-top: 10px; }
        .message { color: green; font-weight: bold; margin: 10px 0; }
    </style>
</head>
<body>
<h2>编辑用户信息</h2>


<!-- 如果 updateMessage 存在，显示提示 -->
<c:if test="${not empty updateMessage}">
    <div class="message">${updateMessage}</div>
</c:if>

<c:if test="${not empty errorMessage}">
    <div style="color:red; font-weight:bold;">
            ${errorMessage}
    </div>
</c:if>

<form action="${pageContext.request.contextPath}/user/updateUser.do" method="post">
    <!-- 用户ID设为隐藏字段 -->
    <input type="hidden" name="user_id" value="${user.id}" />
    <p>
        <label>ID：</label>
        <span>${user.id}</span>
    </p>
    <p>
        <label>用户名：</label>
        <input type="text" name="username" value="${user.username}" required />
    </p>
    <p>
        <label>密码：</label>
        <input type="text" name="password" value="${user.password}" required />
    </p>
    <p>
        <input type="submit" value="应用编辑" />
    </p>
</form>

<br/>
<a href="${pageContext.request.contextPath}/jsp/admin.jsp">返回管理页面</a>
</body>
</html>
