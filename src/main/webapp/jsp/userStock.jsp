<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ssmdemo.dao.entity.GameEntity" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>用户库存页面</title>
</head>
<body>
<h1>用户库存</h1>

<p>你当前拥有的游戏数量：${gameCount}</p>

<c:if test="${not empty gameList}">
    <table border="1">
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
                    <img src="${game.pictures}" style="width: 100px; height: auto;" alt="游戏图片" referrerpolicy="no-referrer"/>
                </td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<a href="${pageContext.request.contextPath}/jsp/Main.jsp">返回主页面</a>
</body>
</html>
