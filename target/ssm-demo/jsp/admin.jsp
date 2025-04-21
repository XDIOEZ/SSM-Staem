<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户管理后台</title>
    <style>
        :root {
            --primary-color: #66c0f4;
            --secondary-color: #1b2838;
            --background-color: #171a21;
            --input-bg-color: #2a475e;
            --button-color: #5c7e10;
            --button-hover: #6b8e23;
            --text-color: #c7d5e0;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: var(--background-color);
            color: var(--text-color);
            padding: 2rem;
            background-image: radial-gradient(circle at 20% 30%, rgba(102, 192, 244, 0.1) 0%, transparent 30%),
            radial-gradient(circle at 80% 70%, rgba(102, 192, 244, 0.1) 0%, transparent 30%);
        }

        h2 {
            color: var(--primary-color);
            margin: 2rem 0 1rem;
            font-size: 1.5rem;
            position: relative;
            padding-bottom: 0.5rem;
        }

        h2::after {
            content: "";
            position: absolute;
            bottom: 0;
            left: 0;
            width: 60px;
            height: 2px;
            background: var(--primary-color);
            opacity: 0.5;
        }

        .btn {
            display: inline-block;
            background-color: var(--button-color);
            color: white;
            padding: 0.8rem 1.5rem;
            border-radius: 4px;
            font-weight: 600;
            transition: all 0.3s;
            text-decoration: none;
            border: none;
            cursor: pointer;
            font-size: 1rem;
            white-space: nowrap;
            text-align: center;
        }

        .btn:hover {
            background-color: var(--button-hover);
            transform: translateY(-2px);
        }

        .search-form {
            background-color: var(--secondary-color);
            padding: 1.5rem;
            border-radius: 8px;
            margin-bottom: 2rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            max-width: 800px;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
            color: var(--primary-color);
            width: 100%;
        }

        .form-group {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 1rem;
            width: 100%;
            max-width: 100%;
            position: relative;
        }

        input[type="text"] {
            flex: 1 1 300px;
            min-width: 0;
            width: 100%;
            max-width: 100%;
            padding: 0.8rem;
            background-color: var(--input-bg-color);
            border: 1px solid rgba(102, 192, 244, 0.2);
            border-radius: 4px;
            color: var(--text-color);
            font-size: 1rem;
            box-sizing: border-box;
        }

        input[type="text"]:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 2px rgba(102, 192, 244, 0.2);
        }

        @media (max-width: 600px) {
            .form-group {
                flex-direction: column;
                align-items: stretch;
            }

            input[type="text"] {
                flex-basis: 100%;
                min-width: 100%;
            }

            .btn {
                width: 100%;
            }
        }

        @media (max-width: 768px) {
            .form-group {
                flex-direction: column;
                align-items: stretch;
            }

            input[type="text"], .btn {
                width: 100%;
            }
        }
    </style>
</head>

<body>
<h2>用户管理</h2>
<a href="${pageContext.request.contextPath}/jsp/userRig.jsp" class="btn">添加用户</a>

<h2>查找用户</h2>
<form action="${pageContext.request.contextPath}/user/findById.do" method="post">
    <div class="form-group">
        <label for="id">身份码</label>
        <input type="text" id="id" name="id" placeholder="输入您的身份码" autocomplete="username" required>
        <button type="submit" class="btn">查找</button>
    </div>
</form>
</body>
</html>