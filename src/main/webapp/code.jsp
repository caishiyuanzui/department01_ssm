<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2019/7/30
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>验证码</title>
    <script>
        //获取验证码
        function getVerify(obj){
            obj.src = ${pageContext.request.contextPath} + "/sys/getVerify?"+Math.random();
        }
    </script>
</head>
<body>
<div class="row">
    <div class="col-xs-6 pull_left">
        <div class="form-group">
            <input class="form-control" type="tel" id="verify_input" placeholder="请输入验证码" maxlength="4">
        </div>
    </div>
    <div class="col-xs-6 pull_left">
        <a href="javascript:void(0);" title="点击更换验证码">
            <img id="imgVerify" src="" alt="更换验证码" height="36" width="100%" onclick="getVerify(this);">
        </a>
    </div>
</div>

</body>
</html>
