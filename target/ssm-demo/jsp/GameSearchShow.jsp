<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2025/4/17
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ssmdemo.dao.entity.GameEntity" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Game Data</title>
    <style>
        :root {
            --primary-color: #66c0f4;
            --secondary-color: #1b2838;
            --background-color: #171a21;
            --button-color: #5c7e10;
            --button-hover: #6b8e23;
            --text-color: #c7d5e0;
            --table-border: #2a475e;
            --highlight: #4b619b;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: var(--background-color);
            color: var(--text-color);
            margin: 0;
            padding: 2rem;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            background-image:
                    radial-gradient(circle at 20% 30%, rgba(102, 192, 244, 0.15) 0%, transparent 30%),
                    radial-gradient(circle at 80% 70%, rgba(102, 192, 244, 0.15) 0%, transparent 30%);
        }

        .game-container {
            width: 90%;
            max-width: 1200px;
            background-color: var(--secondary-color);
            padding: 2.5rem;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.3);
            border: 1px solid rgba(102, 192, 244, 0.1);
        }

        .game-header {
            color: var(--primary-color);
            margin-bottom: 2rem;
            text-align: center;
            font-size: 2.2rem;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
        }

        .result-message {
            padding: 1.2rem;
            background: linear-gradient(135deg, rgba(42, 71, 94, 0.4) 0%, rgba(27, 40, 56, 0.6) 100%);
            border-radius: 8px;
            text-align: center;
            margin-bottom: 2rem;
            border: 1px solid rgba(102, 192, 244, 0.2);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .game-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-bottom: 2rem;
            border-radius: 8px;
            overflow: hidden;
            background-color: rgba(27, 40, 56, 0.7);
        }

        .game-table th {
            background: linear-gradient(to bottom, var(--table-border), var(--highlight));
            color: white;
            padding: 1rem;
            text-align: left;
            font-weight: 600;
            text-transform: uppercase;
        }

        .game-table td {
            padding: 1rem;
            border-bottom: 1px solid rgba(102, 192, 244, 0.1);
            background-color: rgba(27, 40, 56, 0.5);
        }

        .game-table tr:hover td {
            background-color: rgba(102, 192, 244, 0.15);
        }

        .game-image {
            width: 100px;
            height: 100px;
            object-fit: contain;
            border-radius: 6px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease;
        }

        .detail-image {
            width: 140px;
            height: 140px;
            object-fit: contain;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s ease;
        }

        .detail-image:hover,
        .game-image:hover {
            transform: scale(1.05);
        }

        .buy-form input[type="submit"] {
            padding: 0.6rem 1.2rem;
            background: linear-gradient(to bottom, var(--button-color), #4a6b0f);
            color: white;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 600;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        .buy-form input[type="submit"]:hover {
            background: linear-gradient(to bottom, var(--button-hover), #5c7e10);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }

        .no-data {
            text-align: center;
            padding: 2rem;
            background-color: rgba(42, 71, 94, 0.3);
            border-radius: 8px;
            border: 1px dashed rgba(102, 192, 244, 0.3);
        }

        .return-container {
            text-align: center;
            margin-top: 2rem;
        }

        .return-link {
            display: inline-block;
            padding: 0.8rem 1.8rem;
            background: linear-gradient(to bottom, var(--primary-color), #4fa8d3);
            color: white;
            text-decoration: none;
            border-radius: 20px;
            transition: all 0.3s ease;
            font-weight: 600;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .return-link:hover {
            background: linear-gradient(to bottom, #4fa8d3, var(--primary-color));
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>
<div class="game-container">
    <div class="game-header">
        <h1>Game Entity Data</h1>
    </div>

    <%
        List<GameEntity> gameEntities = (List<GameEntity>) request.getAttribute("gameEntities");
        GameEntity singleGame = (GameEntity) request.getAttribute("gameEntity");

        if (gameEntities != null && !gameEntities.isEmpty()) {
    %>
    <div class="result-message">
        <h2>搜索结果列表：</h2>
    </div>
    <table class="game-table" border="0">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Description</th>
            <th>Comment</th>
            <th>Pictures</th>
            <th>操作</th>
        </tr>
        <%
            for (GameEntity game : gameEntities) {
        %>
        <tr>
            <td><%= game.getId() %></td>
            <td><%= game.getName() %></td>
            <td><%= game.getPrice() %></td>
            <td><%= game.getDescription() %></td>
            <td><%= game.getComment() %></td>
            <td>
                <img src="<%= game.getPictures() %>" class="game-image" referrerpolicy="no-referrer" />
            </td>
            <td>
                <form class="buy-form" action="${pageContext.request.contextPath}/game/buyGame.do" method="post">
                    <input type="hidden" name="gameId" value="<%= game.getId() %>" />
                    <input type="submit" value="购买" />
                </form>
            </td>
        </tr>
        <% } %>
    </table>
    <%
    } else if (singleGame != null) {
    %>
    <div class="result-message">
        <h2>游戏详情：</h2>
    </div>
    <table class="game-table" border="0">
        <tr>
            <th>ID</th><td><%= singleGame.getId() %></td>
        </tr>
        <tr>
            <th>Name</th><td><%= singleGame.getName() %></td>
        </tr>
        <tr>
            <th>Price</th><td><%= singleGame.getPrice() %></td>
        </tr>
        <tr>
            <th>Description</th><td><%= singleGame.getDescription() %></td>
        </tr>
        <tr>
            <th>Comment</th><td><%= singleGame.getComment() %></td>
        </tr>
        <tr>
            <th>Pictures</th>
            <td>
                <img src="<%= singleGame.getPictures() %>" class="detail-image" referrerpolicy="no-referrer"/>
            </td>
        </tr>
        <tr>
            <th>操作</th>
            <td>
                <form class="buy-form" action="${pageContext.request.contextPath}/game/buyGame.do" method="post">
                    <input type="hidden" name="gameId" value="<%= singleGame.getId() %>" />
                    <input type="submit" value="购买" />
                </form>
            </td>
        </tr>
    </table>
    <div class="return-container">
        <a href="${pageContext.request.contextPath}/user/mainPage.do" class="return-link">返回主页面</a>
    </div>
    <%
    } else {
    %>
    <div class="no-data">
        <p>没有找到符合条件的游戏数据。</p>
    </div>
    <div class="return-container">
        <a href="${pageContext.request.contextPath}/user/mainPage.do" class="return-link">返回主页面</a>
    </div>
    <%
        }
    %>
</div>
</body>
</html>
