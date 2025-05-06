<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商店页面</title>
    <style>
        :root {
            --primary-color: #66c0f4;
            --secondary-color: #1b2838;
            --background-color: #171a21;
            --button-color: #5c7e10;
            --button-hover: #6b8e23;
            --text-color: #c7d5e0;
            --input-bg: #2a475e;
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

        .shop-container {
            background: linear-gradient(145deg, var(--secondary-color), #15202b);
            padding: 2.5rem;
            border-radius: 12px;
            width: 560px;
            max-width: 90%;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.3);
            border: 1px solid rgba(102, 192, 244, 0.1);
        }

        .shop-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .shop-header h1 {
            color: var(--primary-color);
            font-size: 2.2rem;
            text-shadow: 0 2px 4px rgba(0,0,0,0.3);
            margin: 0 0 0.8rem 0;
            background: linear-gradient(90deg, var(--primary-color), #4fa8d3);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .shop-header p {
            color: rgba(199, 213, 224, 0.9);
            font-size: 1.1rem;
            text-shadow: 0 1px 2px rgba(0,0,0,0.2);
        }

        .search-form {
            margin: 2rem 0;
            display: flex;
            gap: 1rem;
        }

        .search-form input[type="text"] {
            flex: 1;
            padding: 1rem;
            background: linear-gradient(135deg, rgba(42,71,94,0.6) 0%, rgba(27,40,56,0.8) 100%);
            border: 1px solid rgba(102, 192, 244, 0.3);
            border-radius: 25px;
            color: var(--text-color);
            font-size: 1rem;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            transition: all 0.3s ease;
        }

        .search-form input[type="text"]:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 12px rgba(102, 192, 244, 0.3);
        }

        .search-form button {
            padding: 1rem 1.8rem;
            background: linear-gradient(to bottom, var(--button-color), #4a6b0f);
            color: white;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            font-weight: 600;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        .search-form button:hover {
            background: linear-gradient(to bottom, var(--button-hover), #5c7e10);
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.3);
        }

        .return-link {
            display: inline-block;
            padding: 0.8rem 1.8rem;
            background: linear-gradient(to bottom, var(--primary-color), #4fa8d3);
            color: white;
            text-decoration: none;
            border-radius: 25px;
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
<div class="shop-container">
    <div class="shop-header">
        <h1>游戏商店</h1>
        <p>探索精彩游戏世界</p>
    </div>

    <form class="search-form" action="${pageContext.request.contextPath}/game/FindByPartialName.do" method="post">
        <input type="text" name="name" placeholder="搜索游戏名称">
        <button type="submit">立即搜索</button>
    </form>

    <div class="action-container">
        <a href="${pageContext.request.contextPath}/user/mainPage.do" class="return-link">返回主页面</a>
    </div>
</div>
</body>
</html>