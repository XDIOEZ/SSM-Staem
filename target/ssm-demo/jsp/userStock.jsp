<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ssmdemo.dao.entity.GameEntity" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>用户库存页面</title>
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
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            background-image:
                    radial-gradient(circle at 20% 30%, rgba(102, 192, 244, 0.15) 0%, transparent 30%),
                    radial-gradient(circle at 80% 70%, rgba(102, 192, 244, 0.15) 0%, transparent 30%);
        }

        .inventory-container {
            width: 90%;
            max-width: 1200px;
            margin: 2rem 0;
            background: linear-gradient(145deg, var(--secondary-color), #15202b);
            padding: 2.5rem;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.3);
            border: 1px solid rgba(102, 192, 244, 0.1);
        }

        .inventory-header {
            color: var(--primary-color);
            text-align: center;
            margin-bottom: 2rem;
            font-size: 2rem;
            text-shadow: 0 2px 4px rgba(0,0,0,0.3);
        }

        .game-count {
            margin-bottom: 2rem;
            padding: 1.2rem;
            background: linear-gradient(135deg, rgba(42,71,94,0.4) 0%, rgba(27,40,56,0.6) 100%);
            border-radius: 8px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            border: 1px solid rgba(102, 192, 244, 0.2);
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
            width: 120px;
            height: 120px;
            object-fit: contain;
            border-radius: 6px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            transition: transform 0.3s ease;
        }

        .game-image:hover {
            transform: scale(1.05);
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
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        .return-link:hover {
            background: linear-gradient(to bottom, #4fa8d3, var(--primary-color));
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.3);
        }

        .action-container {
            text-align: center;
            margin-top: 2rem;
        }
    </style>
</head>
<body>
<div class="inventory-container">
    <div class="inventory-header">
        <h1>用户库存</h1>
    </div>

    <div class="game-count">
        <p>你当前拥有的游戏数量：${gameCount}</p>
    </div>

    <c:if test="${not empty gameList}">
        <table class="game-table" border="0">
            <tr>
                <th>游戏名称</th>
                <th>价格</th>
                <th>简介</th>
                <th>图片</th>
            </tr>
            <c:forEach var="game" items="${gameList}">
                <tr>
                    <td>${game.name}</td>
                    <td>${game.price}</td>
                    <td>${game.description}</td>
                    <td>
                        <img src="${game.pictures}" class="game-image" alt="游戏图片" referrerpolicy="no-referrer"/>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <div class="action-container">
        <a href="${pageContext.request.contextPath}/user/mainPage.do" class="return-link">返回主页面</a>
    </div>
</div>
</body>
</html>
