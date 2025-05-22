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
            --highlight: #4b619b;
            --sidebar-width: 180px;
            --card-bg: #2a475e;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: var(--background-color);
            color: var(--text-color);
            margin: 0;
            padding: 0;
            min-height: 100vh;
            background-image:
                    radial-gradient(circle at 20% 30%, rgba(102, 192, 244, 0.15) 0%, transparent 30%),
                    radial-gradient(circle at 80% 70%, rgba(102, 192, 244, 0.15) 0%, transparent 30%);
        }

        .sidebar {
            width: var(--sidebar-width);
            background: linear-gradient(180deg, var(--secondary-color), #15202b);
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            padding: 2rem 1rem;
            box-shadow: 4px 0 16px rgba(0, 0, 0, 0.3);
            border-right: 1px solid rgba(102, 192, 244, 0.2);
        }

        .sidebar-header {
            color: var(--primary-color);
            text-align: center;
            margin-bottom: 2rem;
            padding-bottom: 1.5rem;
            border-bottom: 1px solid rgba(102, 192, 244, 0.3);
        }

        .sidebar-header h2 {
            margin: 0;
            font-size: 1.4rem;
            text-shadow: 0 2px 4px rgba(0,0,0,0.3);
        }

        .nav-links {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .nav-links li {
            margin: 1rem 0;
        }

        .nav-links a {
            display: block;
            padding: 0.8rem 1rem;
            background: linear-gradient(90deg, rgba(42,71,94,0.6) 0%, rgba(27,40,56,0.8) 100%);
            color: var(--text-color);
            text-decoration: none;
            border-radius: 6px;
            transition: all 0.3s ease;
            font-size: 0.95rem;
        }

        .nav-links a:hover {
            background: linear-gradient(90deg, var(--primary-color) 0%, #4fa8d3 100%);
            transform: translateX(6px);
        }

        .form-container {
            margin-top: 2rem;
            padding-top: 2rem;
            border-top: 1px solid rgba(102, 192, 244, 0.2);
        }

        .form-button {
            width: 100%;
            padding: 0.8rem;
            background: linear-gradient(to bottom, var(--button-color), #4a6b0f);
            color: white;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            font-size: 0.95rem;
            transition: all 0.3s ease;
        }

        .form-button:hover {
            background: linear-gradient(to bottom, var(--button-hover), #5c7e10);
            transform: translateY(-2px);
        }

        .main-content {
            margin-left: var(--sidebar-width);
            padding: 2rem 3rem;
            width: calc(100% - var(--sidebar-width));
            max-width: 1400px;
            margin-right: auto;
            margin-left: auto;
        }

        .game-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 2.5rem;
        }

        .game-card {
            background: linear-gradient(145deg, var(--card-bg), #21354d);
            border-radius: 14px;
            padding: 1.5rem;
            box-shadow: 0 8px 16px rgba(0,0,0,0.3);
            border: 1px solid rgba(102, 192, 244, 0.1);
            transition: transform 0.3s ease;
            display: flex;
            flex-direction: column;
            min-height: 400px;
            max-width: 100%;
        }

        .game-card:hover {
            transform: translateY(-5px);
        }

        .game-image {
            width: 100%;
            height: 170px;
            object-fit: contain;
            border-radius: 10px;
            margin-bottom: 1rem;
        }

        .game-title {
            margin: 0.6rem 0 0.4rem 0;
            color: var(--primary-color);
            font-size: 1.15rem;
            height: 3em;
            overflow: hidden;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }

        .game-price {
            color: #8fbc8f;
            font-size: 1.1rem;
            margin: 0.4rem 0 1rem 0;
        }

        .detail-button {
            width: 100%;
            padding: 0.85rem;
            background: linear-gradient(to bottom, var(--primary-color), #4fa8d3);
            color: white;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 500;
            margin-top: auto;
        }

        .detail-button:hover {
            background: linear-gradient(to bottom, #4fa8d3, var(--primary-color));
            transform: translateY(-2px);
        }

        .refresh-button {
            position: fixed;
            right: 40px;
            bottom: 40px;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background: linear-gradient(135deg, #4fa8d3 0%, #66c0f4 100%);
            border: none;
            cursor: pointer;
            box-shadow: 0 8px 20px rgba(79, 168, 211, 0.3);
            transition: all 0.3s ease-in-out;
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 1000;
        }

        .refresh-button:hover {
            transform: scale(1.1) rotate(90deg);
        }

        .refresh-button::before {
            content: "⟳";
            color: white;
            font-size: 28px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="sidebar">
    <div class="sidebar-header">
        <h2>游戏平台</h2>
    </div>
    <ul class="nav-links">
        <li><a href="${pageContext.request.contextPath}/jsp/gameShop.jsp">前往搜索页面</a></li>
        <li><a href="${pageContext.request.contextPath}/jsp/userData.jsp">前往用户页面</a></li>
    </ul>
    <div class="form-container">
        <form action="${pageContext.request.contextPath}/game/findGameByUser.do" method="post">
            <input type="submit" class="form-button" value="查看我的库存"/>
        </form>
    </div>
</div>

<div class="main-content">
    <div class="game-grid">
        <c:forEach var="game" items="${randomGames}">
            <div class="game-card">
                <img src="${game.pictures}" alt="游戏图片" class="game-image" referrerpolicy="no-referrer"/>
                <h3 class="game-title">${game.name}</h3>
                <p class="game-price">￥${game.price}</p>
                <form action="${pageContext.request.contextPath}/game/findGameByName.do" method="post">
                    <input type="hidden" name="name" value="${game.name}"/>
                    <input type="submit" class="detail-button" value="查看详情"/>
                </form>
            </div>
        </c:forEach>
    </div>
</div>

<form action="${pageContext.request.contextPath}/user/mainPage.do" method="get">
    <button type="submit" class="refresh-button"></button>
</form>
</body>
</html>
