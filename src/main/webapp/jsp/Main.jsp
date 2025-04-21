<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>平台主界面</title>
</head>
<body>
<h1>欢迎来到游戏分发平台</h1>
<ul>
    <li><a href="${pageContext.request.contextPath}/jsp/gameShop.jsp">前往商店页面</a></li>
    <li><a href="${pageContext.request.contextPath}/jsp/userData.jsp">前往用户页面</a></li>
    <form action="${pageContext.request.contextPath}/game/findGameByUser.do" method="post">
        <input type="submit" value="查看我的库存"/>
    </form>
</ul>
</body>
</html>
