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
            --highlight: #4b619b;
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
            background-image:
                    radial-gradient(circle at 20% 30%, rgba(102, 192, 244, 0.15) 0%, transparent 30%),
                    radial-gradient(circle at 80% 70%, rgba(102, 192, 244, 0.15) 0%, transparent 30%);
        }

        .user-container {
            background: linear-gradient(145deg, var(--secondary-color), #15202b);
            padding: 2.5rem;
            border-radius: 12px;
            width: 480px;
            max-width: 90%;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.3);
            border: 1px solid rgba(102, 192, 244, 0.1);
        }

        .user-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .user-header h1 {
            color: var(--primary-color);
            font-size: 2.2rem;
            text-shadow: 0 2px 4px rgba(0,0,0,0.3);
            margin: 0 0 1rem 0;
            background: linear-gradient(90deg, var(--primary-color), #4fa8d3);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .user-content {
            margin-bottom: 2rem;
        }

        .user-content p {
            margin: 1.5rem 0;
            padding: 1.2rem;
            background: linear-gradient(135deg, rgba(42,71,94,0.4) 0%, rgba(27,40,56,0.6) 100%);
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            border: 1px solid rgba(102, 192, 244, 0.2);
        }

        .user-actions {
            text-align: center;
            margin-top: 2rem;
        }

        .user-actions a {
            display: inline-block;
            padding: 0.8rem 1.8rem;
            background: linear-gradient(to bottom, var(--primary-color), #4fa8d3);
            color: white;
            text-decoration: none;
            border-radius: 25px;
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            font-weight: 600;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        .user-actions a:hover {
            background: linear-gradient(to bottom, #4fa8d3, var(--primary-color));
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.3);
        }

        .login-prompt {
            text-align: center;
            padding: 2rem;
            background: linear-gradient(135deg, rgba(42,71,94,0.4) 0%, rgba(27,40,56,0.6) 100%);
            border-radius: 8px;
            margin: 2rem 0;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        .login-prompt a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 600;
            position: relative;
            transition: all 0.3s ease;
        }

        .login-prompt a:hover {
            color: #4fa8d3;
            text-shadow: 0 0 8px rgba(79, 168, 211, 0.3);
        }

        .login-prompt a::after {
            content: '';
            position: absolute;
            width: 100%;
            height: 2px;
            background: currentColor;
            left: 0;
            bottom: -2px;
            transform: scaleX(0);
            transition: transform 0.3s ease;
        }

        .login-prompt a:hover::after {
            transform: scaleX(1);
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
        <a href="${pageContext.request.contextPath}/user/mainPage.do">返回主页面</a>
    </div>
</div>
</body>
</html>
