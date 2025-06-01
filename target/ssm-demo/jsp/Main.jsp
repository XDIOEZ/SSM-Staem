<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
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
            --card-bg: #2a475e;
            --max-width: 1200px;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: var(--background-color);
            color: var(--text-color);
            margin: 0;
            padding: 0;
            background-image:
                    radial-gradient(circle at 20% 30%, rgba(102, 192, 244, 0.15) 0%, transparent 30%),
                    radial-gradient(circle at 80% 70%, rgba(102, 192, 244, 0.15) 0%, transparent 30%);
        }

        .topbar {
            width: 100%;
            background: linear-gradient(180deg, var(--secondary-color), #15202b);
            padding: 1rem 0;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.3);
            border-bottom: 1px solid rgba(102, 192, 244, 0.2);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .topbar-inner {
            max-width: var(--max-width);
            margin: 0 auto;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            padding: 0 1.5rem;
        }

        .topbar h2 {
            color: var(--primary-color);
            font-size: 1.5rem;
            margin: 0;
            text-shadow: 0 2px 4px rgba(0,0,0,0.3);
        }

        .topbar-nav {
            display: flex;
            gap: 1rem;
            align-items: center;
            margin-top: 0.5rem;
        }

        .topbar-nav a {
            padding: 0.5rem 1rem;
            background: linear-gradient(90deg, rgba(42,71,94,0.6) 0%, rgba(27,40,56,0.8) 100%);
            color: var(--text-color);
            text-decoration: none;
            border-radius: 6px;
            transition: all 0.3s ease;
            font-size: 0.95rem;
        }

        .topbar-nav a:hover {
            background: linear-gradient(90deg, var(--primary-color), #4fa8d3);
            transform: translateY(-2px);
        }

        .form-button {
            padding: 0.5rem 1rem;
            background: linear-gradient(to bottom, var(--button-color), #4a6b0f);
            color: white;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 0.9rem;
        }

        .form-button:hover {
            background: linear-gradient(to bottom, var(--button-hover), #5c7e10);
            transform: translateY(-2px);
        }

        .main-content {
            max-width: var(--max-width);
            margin: 2rem auto;
            padding: 0 1.5rem;
        }

        .game-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
            gap: 2rem;
        }

        .game-card {
            background: linear-gradient(145deg, var(--card-bg), #21354d);
            border-radius: 14px;
            padding: 1.2rem;
            box-shadow: 0 6px 14px rgba(0,0,0,0.3);
            border: 1px solid rgba(102, 192, 244, 0.1);
            display: flex;
            flex-direction: column;
            min-height: 380px;
        }

        .game-card:hover {
            transform: translateY(-5px);
        }

        .game-image {
            width: 100%;
            height: 160px;
            object-fit: contain;
            border-radius: 10px;
            margin-bottom: 1rem;
        }

        .game-title {
            margin: 0.5rem 0;
            color: var(--primary-color);
            font-size: 1.1rem;
            height: 2.8em;
            display: -webkit-box;
            overflow: hidden;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }

        .game-price {
            color: #8fbc8f;
            font-size: 1.05rem;
            margin-bottom: 1rem;
        }

        .detail-button {
            margin-top: auto;
            padding: 0.75rem;
            background: linear-gradient(to bottom, var(--primary-color), #4fa8d3);
            color: white;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .detail-button:hover {
            background: linear-gradient(to bottom, #4fa8d3, var(--primary-color));
            transform: translateY(-2px);
        }

        .refresh-button {
            position: fixed;
            right: 30px;
            bottom: 30px;
            width: 58px;
            height: 58px;
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
            font-size: 26px;
            font-weight: bold;
        }
    </style>
</head>
<body>

<!-- 顶部导航栏 -->
<div class="topbar">
    <div class="topbar-inner">
        <h2>游戏平台</h2>
        <div class="topbar-nav">
            <a href="${pageContext.request.contextPath}/jsp/gameShop.jsp">前往搜索页面</a>
            <a href="${pageContext.request.contextPath}/jsp/userData.jsp">前往用户页面</a>
            <form action="${pageContext.request.contextPath}/game/findGameByUser.do" method="post" style="display:inline;">
                <input type="submit" class="form-button" value="查看我的库存"/>
            </form>
        </div>
    </div>
</div>

<!-- 主内容区域 -->
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

<!-- 刷新按钮 -->
<form action="${pageContext.request.contextPath}/user/mainPage.do" method="get">
    <button type="submit" class="refresh-button"></button>
</form>

</body>
</html>

