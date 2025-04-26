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
</head>
<body>
<h1>Game Entity Data</h1>
<%
    List<GameEntity> gameEntities = (List<GameEntity>) request.getAttribute("gameEntities");
    GameEntity singleGame = (GameEntity) request.getAttribute("gameEntity");

    if (gameEntities != null && !gameEntities.isEmpty()) {
%>
<h2>搜索结果列表：</h2>
<table border="1">
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
            <img src="<%= game.getPictures() %>" width="100" height="100" style="object-fit: contain;" />
        </td>
        <td>
            <form action="${pageContext.request.contextPath}/game/buyGame.do" method="post">
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
<h2>游戏详情：</h2>
<table border="1">
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
            <img src="<%= singleGame.getPictures() %>" width="120" height="120" style="object-fit: contain;"  referrerpolicy="no-referrer"/>
        </td>
    </tr>
    <tr>
        <th>操作</th>
        <td>
            <form action="${pageContext.request.contextPath}/game/buyGame.do" method="post">
                <input type="hidden" name="gameId" value="<%= singleGame.getId() %>" />
                <input type="submit" value="购买" />
            </form>
        </td>
    </tr>
</table>
<%
} else {
%>
<p>没有找到符合条件的游戏数据。</p>
<%
    }
%>

</body>
</html>
