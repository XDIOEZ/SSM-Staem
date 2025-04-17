<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商店页面</title>
</head>
<body>//todo 完善页面 1.要求有一个搜索栏 点击搜索按钮后根据输入的游戏名字跳转到 搜索页面GameSearch.jsp
    //2.在此页面输出数据库中所有的游戏 实现分页功能
<h1>游戏商店</h1>
<p>这里是可以购买游戏的地方。</p>

<form action="${pageContext.request.contextPath}/game/FindByPartialName.do" method="post">
    <input type="text" name="name" placeholder="搜索游戏名称">
    <button type="submit">搜索</button>
</form>

<a href="Main.jsp">返回主页面</a>
</body>
</html>
