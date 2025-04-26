<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>平台主界面</title>
    <style>
        :root {
            --primary-color: #66c0f4;
            --secondary-color: #1b2838;
            --background-color: #171a21;
            --button-color: #5c7e10;
            --button-hover: #6b8e23;
            --text-color: #c7d5e0;
            --sidebar-width: 250px;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: var(--background-color);
            color: var(--text-color);
            margin: 0;
            padding: 0;
            display: flex;
            min-height: 100vh;
            background-image: radial-gradient(circle at 20% 30%, rgba(102, 192, 244, 0.1) 0%, transparent 30%),
            radial-gradient(circle at 80% 70%, rgba(102, 192, 244, 0.1) 0%, transparent 30%);
        }

        .sidebar {
            width: var(--sidebar-width);
            background-color: var(--secondary-color);
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            padding: 1.5rem;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.2);
        }

        .sidebar-header {
            color: var(--primary-color);
            text-align: center;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid rgba(102, 192, 244, 0.2);
        }

        .nav-links {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .nav-links li {
            margin: 0.8rem 0;
        }

        .nav-links a {
            display: block;
            padding: 0.8rem 1rem;
            background-color: rgba(42, 71, 94, 0.5);
            color: var(--text-color);
            text-decoration: none;
            border-radius: 4px;
            transition: all 0.2s;
        }

        .nav-links a:hover {
            background-color: var(--primary-color);
            color: white;
            transform: translateX(5px);
        }

        .inventory-form {
            margin-top: 2rem;
            padding-top: 1rem;
            border-top: 1px solid rgba(102, 192, 244, 0.2);
        }

        .inventory-form input[type="submit"] {
            width: 100%;
            padding: 0.8rem;
            background-color: var(--button-color);
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1rem;
            transition: background-color 0.2s;
        }

        .inventory-form input[type="submit"]:hover {
            background-color: var(--button-hover);
        }

    </style>
</head>
<body>
<!-- 侧边栏 -->
<div class="sidebar">
    <div class="sidebar-header">
        <h2>游戏分发平台</h2>
    </div>

    <ul class="nav-links">
        <li><a href="${pageContext.request.contextPath}/jsp/gameShop.jsp">前往商店页面</a></li>
        <li><a href="${pageContext.request.contextPath}/jsp/userData.jsp">前往用户页面</a></li>
    </ul>

    <div class="inventory-form">
        <form action="${pageContext.request.contextPath}/game/findGameByUser.do" method="post">
            <input type="submit" value="查看我的库存"/>
        </form>
    </div>
</div>

<c:forEach var="game" items="${randomGames}">
    <div style="background-color: #2a475e; padding: 1rem; border-radius: 8px; width: 200px;">
        <img src="${game.pictures}" alt="游戏图片" referrerpolicy="no-referrer"
             style="width: 100%; height: 120px; object-fit: cover; border-radius: 4px;">
        <h3 style="margin: 0.5rem 0 0.3rem 0; color: white;">${game.name}</h3>
        <p style="color: #c7d5e0;">￥${game.price}</p>

        <!-- 添加“查看详细”按钮 -->
        <form action="${pageContext.request.contextPath}/game/findGameByName.do" method="post" style="margin-top: 0.5rem;">
            <input type="hidden" name="name" value="${game.name}"/>
            <input type="submit" value="查看详细"/>
        </form>
    </div>
</c:forEach>

</body>

</html>