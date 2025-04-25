<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>用户信息页面</title>
    <style>
        :root {
            --primary-color: #66c0f4;
            --secondary-color: #1b2838;
            --background-color: #171a21;
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

        .user-container {
            background-color: var(--secondary-color);
            padding: 2rem;
            border-radius: 8px;
            width: 400px;
            max-width: 90%;
        }

        .user-header {
            color: var(--primary-color);
            text-align: center;
            margin-bottom: 1.5rem;
        }

        .user-content {
            margin-bottom: 1.5rem;
        }

        .user-content p {
            margin: 1rem 0;
            padding: 0.5rem;
            background-color: rgba(42, 71, 94, 0.3);
            border-radius: 4px;
        }

        .user-actions {
            text-align: center;
        }

        .user-actions a {
            display: inline-block;
            padding: 0.6rem 1.2rem;
            background-color: var(--button-color);
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.2s;
        }

        .user-actions a:hover {
            background-color: var(--button-hover);
        }

        .login-prompt {
            text-align: center;
            margin: 1.5rem 0;
        }

        .login-prompt a {
            color: var(--primary-color);
            text-decoration: none;
        }

        .login-prompt a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="user-container">
    <div class="user-header">
        <h1>用户信息</h1>
    </div>

    <div class="user-content">
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
        <div class="login-prompt">
            <p>您尚未登录，请先 <a href="login.jsp">登录</a>。</p>
        </div>
        <%
            }
        %>
    </div>

    <div class="user-actions">
        <a href="Main.jsp">返回主页面</a>
    </div>
</div>
</body>
</html>
