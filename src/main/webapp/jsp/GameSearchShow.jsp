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
    // 假设模糊搜索结果作为 List<GameEntity> 传入
    List<GameEntity> gameEntities = (List<GameEntity>) request.getAttribute("gameEntities");

    if (gameEntities != null && !gameEntities.isEmpty())
    {
%>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Price</th>
        <th>Description</th>
        <th>Comment</th>
        <th>Pictures</th>
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
        <td><%= game.getPictures() %></td>
    </tr>
    <%
        }
    %>
</table>
<%
} else {
%>
<p>No GameEntity data available or matching results found.</p>
<%
    }
%>
</body>
</html>
