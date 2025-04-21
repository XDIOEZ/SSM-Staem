<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>购买结果</title>
  <style>
    body {
      font-family: "微软雅黑", sans-serif;
      text-align: center;
      padding-top: 100px;
      background-color: #f4f4f4;
    }
    h1 {
      color: #4CAF50;
    }
    p {
      font-size: 18px;
      color: #333;
    }
    .btn {
      margin-top: 20px;
      padding: 10px 20px;
      background-color: #4CAF50;
      color: white;
      border: none;
      text-decoration: none;
      font-size: 16px;
      border-radius: 5px;
    }
    .btn:hover {
      background-color: #45a049;
    }
  </style>
</head>
<body>

<td>
  <img src="<%= "${pageContext.request.contextPath}/jsp/getMoney.jpg" %>"
       alt="Game Image"
       width="100"
       height="100"
       style="object-fit: contain; background-color: #f0f0f0; display: block;"
       referrerpolicy="no-referrer"/>
</td>

<img src="${pageContext.request.contextPath}/jsp/getMoney.jpg" width="216" height="324"/>

<a href="${pageContext.request.contextPath}/jsp/Main.jsp" class="btn">返回首页</a>

</body>
</html>
