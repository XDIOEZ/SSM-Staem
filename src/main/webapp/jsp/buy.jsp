<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>购买结果</title>
  <style>
    :root {
      --primary-color: #66c0f4;
      --secondary-color: #1b2838;
      --background-color: #171a21;
      --button-color: #5c7e10;
      --button-hover: #6b8e23;
      --text-color: #c7d5e0;
      --success-color: #4CAF50;
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
      padding: 0;
      margin: 0;
      background-image: radial-gradient(circle at 20% 30%, rgba(102, 192, 244, 0.1) 0%, transparent 30%),
      radial-gradient(circle at 80% 70%, rgba(102, 192, 244, 0.1) 0%, transparent 30%);
    }

    h1 {
      color: var(--success-color);
      margin-bottom: 1.5rem;
    }

    .image-container {
      margin: 1.5rem 0;
      padding: 10px;
      background-color: rgba(42, 71, 94, 0.3);
      border-radius: 8px;
    }

    .image-container img {
      border-radius: 4px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    .button-container {
      margin-top: 2rem;
    }

    .btn {
      display: inline-block;
      padding: 0.9rem 1.8rem;
      background-color: var(--button-color);
      color: white;
      border: none;
      border-radius: 6px;
      text-decoration: none;
      font-size: 1rem;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.3s ease;
    }

    .btn:hover {
      background-color: var(--button-hover);
      transform: translateY(-2px);
    }
  </style>
</head>
<body>
<div class="image-container">
  <img src="https://raw.githubusercontent.com/XDIOEZ/SSM-Staem/refs/heads/main/src/main/webapp/images/getMoney.jpg" width="216" height="324"/>
</div>

<div class="button-container">
  <a href="${pageContext.request.contextPath}/jsp/Main.jsp" class="btn">已支付--返回首页</a>
</div>
</body>
</html>