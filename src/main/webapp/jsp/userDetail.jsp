<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Staem管家 - 编辑用户信息</title>
    <style>
        :root {
            --primary-color: #66c0f4;
            --secondary-color: #1b2838;
            --background-color: #171a21;
            --input-bg-color: #2a475e;
            --button-color: #5c7e10;
            --button-hover: #6b8e23;
            --text-color: #c7d5e0;
            --error-color: #ff4d4d;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: var(--background-color);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: var(--text-color);
            background-image: radial-gradient(circle at 20% 30%, rgba(102, 192, 244, 0.1) 0%, transparent 30%),
            radial-gradient(circle at 80% 70%, rgba(102, 192, 244, 0.1) 0%, transparent 30%);
            position: relative;
            overflow-x: hidden;
        }

        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100"><rect width="100" height="100" fill="none"/><path d="M30,30 L70,30 L70,70 L30,70 Z" stroke="%232a475e" stroke-width="0.5" fill="none"/></svg>');
            opacity: 0.05;
            z-index: -1;
        }

        .logo {
            color: var(--primary-color);
            font-size: 2.5rem;
            font-weight: 700;
            text-shadow: 0 0 15px rgba(102, 192, 244, 0.3);
            letter-spacing: 1px;
            position: relative;
            display: inline-block;
        }

        .logo::after {
            content: "";
            position: absolute;
            bottom: -8px;
            left: 0;
            width: 100%;
            height: 2px;
            background: linear-gradient(90deg, transparent, var(--primary-color), transparent);
            opacity: 0.7;
        }

        .edit-container {
            background-color: var(--secondary-color);
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            width: 450px;
            max-width: 95%;
            position: relative;
            overflow: hidden;
            transition: transform 0.3s ease;
        }

        .edit-container:hover {
            transform: translateY(-5px);
        }

        .edit-container::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 4px;
            height: 100%;
            background: linear-gradient(to bottom, var(--primary-color), transparent);
        }

        .edit-title {
            text-align: center;
            margin-bottom: 1.5rem;
            color: var(--text-color);
            font-size: 1.5rem;
            position: relative;
        }

        .edit-title::after {
            content: "";
            display: block;
            width: 80px;
            height: 2px;
            background: var(--primary-color);
            margin: 0.5rem auto 0;
            opacity: 0.5;
        }

        .form-group {
            margin-bottom: 1.25rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: var(--primary-color);
            font-weight: 600;
            font-size: 0.95rem;
        }

        .form-group span {
            display: inline-block;
            padding: 0.5rem 0;
            color: var(--text-color);
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 0.8rem 1rem;
            background-color: var(--input-bg-color);
            border: 1px solid rgba(102, 192, 244, 0.2);
            border-radius: 6px;
            color: var(--text-color);
            font-size: 0.95rem;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 2px rgba(102, 192, 244, 0.2);
        }

        input[type="submit"] {
            width: 100%;
            padding: 0.9rem;
            background-color: var(--button-color);
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 1rem;
            font-weight: 600;
            margin-top: 1rem;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        input[type="submit"]:hover {
            background-color: var(--button-hover);
        }

        input[type="submit"]::after {
            content: "";
            position: absolute;
            top: -50%;
            left: -60%;
            width: 40px;
            height: 200%;
            background: rgba(255, 255, 255, 0.2);
            transform: rotate(30deg);
            transition: all 0.3s;
        }

        input[type="submit"]:hover::after {
            left: 120%;
        }

        .message {
            color: var(--primary-color);
            font-weight: bold;
            margin: 1rem 0;
            text-align: center;
            padding: 0.5rem;
            background-color: rgba(102, 192, 244, 0.1);
            border-radius: 4px;
        }

        .error-message {
            color: var(--error-color);
            font-weight: bold;
            margin: 1rem 0;
            text-align: center;
            padding: 0.5rem;
            background-color: rgba(255, 77, 77, 0.1);
            border-radius: 4px;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 1.5rem;
            font-size: 0.9rem;
        }

        .back-link a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 600;
            transition: color 0.2s;
        }

        .back-link a:hover {
            text-decoration: underline;
            color: #8cd5ff;
        }

        @media (max-width: 480px) {
            .logo {
                font-size: 2rem;
            }

            .edit-container {
                padding: 1.5rem;
                width: 90%;
            }
        }
    </style>
</head>
<body>
<div class="edit-container">
    <h2 class="edit-title">编辑用户信息</h2>

    <c:if test="${not empty updateMessage}">
        <div class="message">${updateMessage}</div>
    </c:if>

    <c:if test="${not empty errorMessage}">
        <div class="error-message">${errorMessage}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/user/updateUser.do" method="post">
        <input type="hidden" name="user_id" value="${user.id}" />

        <div class="form-group">
            <label>ID：</label>
            <span>${user.id}</span>
        </div>

        <div class="form-group">
            <label for="username">用户名：</label>
            <input type="text" id="username" name="username" value="${user.username}" required />
        </div>

        <div class="form-group">
            <label for="password">密码：</label>
            <input type="password" id="password" name="password" value="${user.password}" required />
        </div>

        <input type="submit" value="应用编辑" />
    </form>

    <div class="back-link">
        <a href="${pageContext.request.contextPath}/jsp/admin.jsp">返回管理页面</a>
    </div>
</div>
</body>
</html>