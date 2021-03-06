<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2019/7/28
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>部门管理</title>
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.js"></script>
    <!--加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
</head>
<body>
<%--单击添加按钮弹出的模态框--%>
<div class="modal fade" id="deptAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <center><h4 class="modal-title" id="myModalLabel">添加部门</h4></center>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="addDeptform">
                    <div class="form-group">
                        <label for="input_add_DeptNo" class="col-sm-3 control-label">部门名称：</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="dname" id="input_add_DeptNo"
                                   placeholder="部门名称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input_add_DeptName" class="col-sm-3 control-label">部门主管：</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="dmanager" id="input_add_DeptName"
                                   placeholder="部门主管">
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="dept_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<%--//单击编辑按钮弹出的模态框--%>
<div class="modal fade" id="deptUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" align="center">修改部门</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="upateDeptform" method="post">
                    <div class="form-group">
                        <label for="input_update_DeptNo" class="col-sm-3 control-label">部门编号：</label>
                        <div class="col-sm-9">
                            <p class="form-control-static" id="input_update_DeptNo"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input_update_DeptName" class="col-sm-3 control-label">部门名称：</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="dname" id="input_update_DeptName"
                                   placeholder="部门名称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input_update_DeptName" class="col-sm-3 control-label">部门主管：</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="dmanager" id="input_update_DeptManager"
                                   placeholder="部门名称">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="dept_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-lg-4 col-lg-offset-4"></div>
        <h3 align="center">部门管理</h3>
        <hr>
    </div>
    <div class="row">
        <div class="col-lg-1 col-lg-offset-3">
            <button class="btn btn-success" id="add_dept" onclick="adddept()">添加</button>
        </div>
        <div class="col-lg-3 col-lg-offset-3">
            <div class="input-group">
                <div class="input-group-btn">
                    <button type="button" id="selButton" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true">查找条件<span class="caret"></span></button>
                    <ul class="dropdown-menu">
                        <li><a href="#" onclick="document.getElementById('selButton').innerText='部门编号'" id="deid">部门编号</a></li>
                        <li><a href="#" onclick="document.getElementById('selButton').innerText='部门名称'" id="dename">部门名称</a></li>
                        <li><a href="#" onclick="document.getElementById('selButton').innerText='部门主管'" id="demg">部门主管</a></li>
                    </ul>
                </div><!-- /btn-group -->
                <input type="text" class="form-control" placeholder="Search for..." id="text_search">
                <!--                    <button><span class="input-group-btn  glyphicon glyphicon-search"></span></button>-->
            </div><!-- /input-group -->
        </div><!-- /.col-lg-6 -->
        <div class="col-lg-1">
            <button type="submit" class="btn btn-success search_btn" id="search_btn" onclick="search_id()"><span class="glyphicon glyphicon-search"></span>搜索</button>
        </div>
    </div>
    <div><p>   </p></div>
    <div class="row"><p></p></div>
    <div class="row">
        <div class="col-lg-3"></div>
        <div class="col-lg-6">
            <table class="table table-hover" id="emps_table" >
                <thead>
                <tr>
                    <td>部门编号</td>
                    <td>部门名称</td>
                    <td>部门主管</td>
                    <td>操作</td>
                </tr>
                </thead>
                <tbody id="add"></tbody>
                <tfoot></tfoot>
            </table>
        </div>
    </div>
    <!--显示分页信息-->
    <div class="row">
        <%--  分页文字信息--%>
        <div class="col-md-4 col-lg-offset-2" id="page_info_area"></div>
        <%--  分页条信息--%>
        <div class="col-md-5 col-lg-offset-1"  id="page_nav_area"></div>
    </div>
</div>
<script type="text/javascript">
    var totalRecord,currentPage;
    //页面加载后，发送ajax请求获取到分页数据
    $(function () {
        to_page(1);
    });

    function to_page(pn) {
        $.ajax({
            url:"${pageContext.request.contextPath}/dept",
            data:"pn="+pn,
            type:"GET",
            success:function (result) {
            // //打印数据
            //console.log(result);
            //1、解析并显示员工信息
            build_emps_table(result);
            //2、解析并显示分页信息
            build_emps_info(result);
            //3、解析显示分页条
            // build_dept_nav(result);
        }
    })
    }
    //显示所有部门信息并进行分页处理
    function build_emps_table(result) {
        $("#emps_table tbody").empty();
        var emps = result.extend.PageInfo.list;
        $.each(emps,function (index,item) {
            // alert(item.dname);
            // var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            var deid = $("<td></td>").append(item.did);
            var dename = $("<td></td>").append(item.dname);
            var demanager = $("<td></td>").append(item.dmanager);
            var edtBtn = $("<button></button>").addClass("btn btn-success btn-sm edit_btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append(" ").append("编辑");
            //为编辑按钮添加一个自定义的属性，来表示当前员工id
            edtBtn.attr("edit-id", item.did);
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>").addClass("glyphicon glyphicon-trash")).append(" ").append("删除");
            //为删除按钮添加一个自定义的属性来表示当前删除的员工id
            delBtn.attr("del-id", item.did);
            var btnTd = $("<td></td>").append(edtBtn).append(" ").append(delBtn);
            $("<tr></tr>").append()
                .append(deid)
                .append(dename)
                .append(demanager)
                .append(btnTd)
                .appendTo("#emps_table tbody");
        });
    }
    function build_emps_info(result) {
        // $("#page_info_area").empty();
        // $("#page_info_area").append("当前为第" + result.extend.PageInfo.pageNum + "页，总共有" +
        //     result.extend.PageInfo.pages + "页，总共有" +
        //     result.extend.PageInfo.total + "条记录");
        totalRecord = result.extend.PageInfo.total;
        currentPage = result.extend.PageInfo.pageNum;
    }
    function build_dept_nav(result) {
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        //构建li元素  firstPageLi:首页  prePageLi：往前
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"))
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        //如果没有下一页，则这两个按钮不能点
        if (result.extend.PageInfo.hasPreviousPage == false) {
            // alert(result.extend.PageInfo.hasPreviousPage);
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            //为元素添加翻页事件
            firstPageLi.click(function () {
                to_page(1);
            });
            prePageLi.click(function () {
                to_page((result.extend.PageInfo.pageNum)-1);
            });
        }

        //添加首页和前一页的提示
        ul.append(firstPageLi).append(prePageLi);

        //遍历navigatepageNums页码提示
        $.each(result.extend.PageInfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if (result.extend.PageInfo.pageNum == item) {
                numLi.addClass("active");
            }
            //添加条目单击事件
            numLi.click(function () {
                to_page(item);
            });
            ul.append(numLi);
        });
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"))
        if (result.extend.PageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            //为元素添加翻页事件
            nextPageLi.click(function () {
                to_page(result.extend.PageInfo.pageNum + 1);
            });
            lastPageLi.click(function () {
                to_page(result.extend.PageInfo.pages);
            });
        }
        //添加下一页和末页的提示
        ul.append(nextPageLi).append(lastPageLi);
        //把ul添加到nav
        var navEle = $("<nav></nav>").addClass("Page navigation").append(ul);
        $("#page_nav_area").append(navEle);
    }
    //点击删除按键
    $(document).on("click",".delete_btn",function () {
        //1、弹出确认删除对话框
        var deptName = $(this).parents("tr").find("td:eq(1)").text();
        var deptId = $(this).attr("del-id");
        // alert(deptId);
        if(confirm("确认删除("+deptName+")吗？")){
            //发送ajax请求删除
            $.ajax({
                url:"${pageContext.request.contextPath}/delD/"+deptId,
                type:"DELETE",
                success:function (result) {
                    alert(result.msg);
                    //回到本页
                    to_page(currentPage);
                }
            });
        }
    });
    //根据不同条件进行查询
    function search_id(){
        var value = document.getElementById("selButton").innerText;
        if($("#text_search").val()==""){
            to_page(1);
        }
        if (value=="部门编号"){
            var deptId = $("#text_search").val();
            // alert(deptId);
            $.ajax({
                url:"${pageContext.request.contextPath}/deptId/"+deptId,
                type:"GET",
                success:function (result) {
                    rebuliderid(result);
                    build_dept_nav(result);
                    build_emps_info(result);
                }
            });
        }
        else if (value=="部门名称"){
            var deptName = $("#text_search").val();
            // alert(deptName);
            $.ajax({
                url:"${pageContext.request.contextPath}/deptName/"+deptName,
                type:"GET",
                success:function (result) {
                    rebulider(result);
                }
            });
        }
        else if (value=="部门主管"){
            var deptMag = $("#text_search").val();
            // alert(deptMag);
            $.ajax({
                url:"${pageContext.request.contextPath}/deptMag/"+deptMag,
                type:"GET",
                success:function (result) {
                    rebulider(result);
                }
            });
        }
    }
    //根据不同条件查找重建数据表格
    function rebulider(result){
        $("#emps_table tbody").empty();
        $("#page_info_area").empty();
        $("#page_nav_area").empty();
        var dep = result.extend.dept;
        $.each(dep,function (index,depts) {
            var tb1 =$("<td></td>").append(depts.did);
            var tb2 =$("<td></td>").append(depts.dname);
            var tb3 =$("<td></td>").append(depts.dmanager);
            var tb4 =$("<td></td>").append("无");
            $("<tr></tr>").append(tb1).append(tb2).append(tb3).append(tb4).appendTo("#emps_table tbody")
        });
    }
    function rebuliderid(result){
        $("#emps_table tbody").empty();
        $("#page_info_area").empty();
        $("#page_nav_area").empty();
        var depid = result.extend.dept;
            var tb1 =$("<td></td>").append(depid.did);
            var tb2 =$("<td></td>").append(depid.dname);
            var tb3 =$("<td></td>").append(depid.dmanager);
            var tb4 =$("<td></td>").append("无");
            $("<tr></tr>").append(tb1).append(tb2).append(tb3).append(tb4).appendTo("#emps_table tbody")
    }
/*
修改部门信息
 */
    //编辑按键
    $(document).on("click", ".edit_btn", function () {
        //查出部门信息，显示部门信息
        var deptId = ($(this).attr("edit-id"));
        //把部门的id传递给模态框的更新按钮;
        $("#dept_update_btn").attr("edit-id", $(this).attr("edit-id"));
        getDeptByNo(deptId);
        $('#deptUpdateModal').modal({
            backdrop: 'static'
        });
    });
    //根据部门编号查询部门信息
    function getDeptByNo(deptId) {
        $.ajax({
            url: "${pageContext.request.contextPath}/deptId/"+deptId,
            async: false,//同步，会阻塞操作
            type: "GET",
            success: function (result) {
                var deptData = result.extend.dept;
                $("#input_update_DeptNo").text(deptData.did);
                $("#input_update_DeptName").val(deptData.dname);
                $("#input_update_DeptManager").val(deptData.dmanager);
            }

        });
    }
    //更新部门数据
    $(dept_update_btn).click(function () {
        var deptId = ($(this).attr("edit-id"));
        alert(deptId);
        $.ajax({
            url: "${pageContext.request.contextPath}/updept/"+ $(this).attr("edit-id"),
            type: "PUT",
            data: $("#deptUpdateModal form").serialize(),
            success: function (result) {
                // alert(result.msg);
                //1、模态框关闭
                $('#deptUpdateModal').modal('hide');
                //2、来到本页，显示刚才保存的数据
                //发送ajax请求显示本页数据即可
                to_page(currentPage);
            }
        });
    });

    /*
* 添加部门
* */
    //添加按钮事件,弹出新增模态框
    $(add_dept).click(function () {
        $('#deptAddModal').modal({
            backdrop: 'static'
        });
    });
    //添加部门保存按钮事件
    $(dept_save_btn).click(function () {
        // 发送ajax请求
        // alert($("#deptAddModal form").serialize());
        //进行表单验证

        $.ajax({
            url: "${pageContext.request.contextPath}/addD",
            type: "POST",
            data: $("#deptAddModal form").serialize(),
            success: function (result) {
                alert(result.msg);
                //数据保存成功
                //1、模态框关闭
                $('#deptAddModal').modal('hide');
                //2、来到最后一页，显示刚才保存的数据
                //发送ajax请求显示最后一页数据即可
                to_page(totalRecord);
            }
        });
    });
</script>

</body>
</html>
