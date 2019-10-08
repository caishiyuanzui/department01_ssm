<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2019/9/14
  Time: 19:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>oracle连接</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.js"></script>
</head>
<body>
<div>
<button type="submit" id="connect" onclick="connect_db()">连接数据库</button>
<button type="submit" id="create" onclick="create_table()">创建数据库表</button>
<button type="submit" id="insertAndSelect" onclick="insertAndSelect()">添加查询操作</button>
</div>
<script type="text/javascript">
    function connect_db() {
        $.ajax({
            url: "${pageContext.request.contextPath}/connect",
            type:"GET",
            success:function (resule) {
                alert("123")
            }
        })
    }
    function create_table() {
        $.ajax({
            url: "${pageContext.request.contextPath}/create",
            type:"GET",
            success:function (resule) {
                alert("123")
            }
        })
    }
    function insertAndSelect() {
        $.ajax({
            url: "${pageContext.request.contextPath}/insertandselect",
            type:"GET",
            success:function (resule) {
                alert("123")
            }

        })
    }
</script>
</body>
</html>
