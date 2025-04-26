<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2025/4/17
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆失败</title>
    <style>
        :root {
            --primary-color: #66c0f4;
            --secondary-color: #1b2838;
            --background-color: #171a21;
            --error-color: #e74c3c;
            --button-color: #5c7e10;
            --button-hover: #6b8e23;
            --text-color: #c7d5e0;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: var(--background-color);
            color: var(--text-color);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-image: radial-gradient(circle at 20% 30%, rgba(102, 192, 244, 0.1) 0%, transparent 30%),
            radial-gradient(circle at 80% 70%, rgba(102, 192, 244, 0.1) 0%, transparent 30%);
        }

        .error-container {
            background-color: var(--secondary-color);
            padding: 2rem;
            border-radius: 8px;
            width: 350px;
            max-width: 90%;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            border-left: 4px solid var(--error-color);
        }

        .error-message {
            color: var(--error-color);
            font-size: 1.2rem;
            margin-bottom: 1.5rem;
        }

        .return-link {
            display: inline-block;
            padding: 0.8rem 1.5rem;
            background-color: var(--button-color);
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.2s;
        }

        .return-link:hover {
            background-color: var(--button-hover);
        }
    </style>
</head>
<body>
<div class="error-container">
    <div class="error-message">
        账号或密码错误
    </div>
    <div class="action-link">
        <a href="${pageContext.request.contextPath}/jsp/admin.jsp" class="return-link">返回登陆页面</a>
    </div>
</div>
</body>
</html>
