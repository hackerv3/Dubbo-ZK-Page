<%--
  Created by Rebirth
  User: Rebirth
  Date: 2019/9/25
  Time: 19:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <script src="js/jquery-3.3.1.min.js"></script>
    <title>Customer list</title>
    <script>
        function page_nav(pageIndex) {
            var frm = document.getElementById("page_frm");
            frm.pageIndex.value = pageIndex;
            frm.submit();
        }
    </script>

</head>
<body>
<!--导航栏-->
<div class="sidebar text-left">
    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand">Dubbo+ZooKeeper+SSM+PageHelper整合</a>
            </div>
            <div>
                <ul class="nav navbar-nav">
                    <li><a href="<%=basePath%>/customer/toSavePage"><strong>添加信息功能</strong></a></li>
                    <li><a href="<%=basePath%>/customer/toListPage"><strong>分页查询功能</strong></a></li>
                    <li><a>Create by Arebirth</a></li>
                </ul>
            </div>
        </div>
    </nav>
</div>
<br>
<div class="container">
    <h1 class="text-center">客户信息列表页面</h1>
    <hr>
    <br>
    <form class="form-inline text-center" action="customer/findByPage" method="post">
        <input type="hidden" name="pageSize" value="${requestScope.page.pageSize}">
        <div class="form-group">
            <label>客户姓名：</label>
            <input type="text" class="form-control" name="name" value="${customer.name}"/>
        </div>

        <div class="form-group">
            <label>客户电话：</label>
            <input type="text" class="form-control" name="telephone" value="${customer.telephone}"/>
        </div>

        <div class="form-group">
            <input type="submit" value="查询" class="form-control btn btn-info">
            <input type="reset" value="重置" class="form-control btn btn-danger">
        </div>
    </form>
    <br/>
    <hr/>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
            <tr>
                <th style="text-align: center;">客户编号</th>
                <th style="text-align: center;">客户姓名</th>
                <th style="text-align: center;">客户电话</th>
                <th style="text-align: center;">客户地址</th>
                <th style="text-align: center;">客户备注</th>
                <th style="text-align: center;">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.page.beanList}" var="customer">
                <tr class="text-center">
                    <td>${customer.id}</td>
                    <td>${customer.name}</td>
                    <td>${customer.telephone}</td>
                    <td>${customer.address}</td>
                    <td>${customer.remark}</td>
                    <td>
                        <a href="#" onclick="return edit(${customer.id})" style="text-decoration: none;">
                            <span class="fa fa-edit fa-fw"></span>
                        </a>
                        <a href="#" onclick="return trash(${customer.id})" style="text-decoration: none;"
                           data-toggle="modal" data-target="#trashModal">
                            <span class="fa fa-trash-o fa-fw"></span>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <!--  分页  -->
    <form class="listForm" method="post" action="customer/findByPage" id="page_frm">
        <input type="hidden" name="name" value="${customer.name}">
        <input type="hidden" name="telephone" value="${customer.telephone}">

        <div class="row">
            <div class="form-inline">
                <label style="font-size: 14px;margin-top: 22px;">
                    <strong>共<b>${requestScope.page.totalCount}</b>条记录，共<b>${requestScope.page.totalPage}</b>页</strong>

                    <strong>每页显示</strong>
                    <select class="form-control input-sm" name="pageSize">
                        <option value="2"
                                <c:if test="${requestScope.page.pageSize==2}">selected</c:if>>2
                        </option>
                        <option value="3"
                                <c:if test="${requestScope.page.pageSize == 3}">selected</c:if> >3
                        </option>
                        <option value="4"
                                <c:if test="${requestScope.page.pageSize == 4}">selected</c:if> >4
                        </option>
                        <option value="5"
                                <c:if test="${requestScope.page.pageSize == 5}">selected</c:if> >5
                        </option>
                    </select>
                    <strong>条</strong>


                    <strong>到第</strong> <input type="text" size="4" id="page" name="pageIndex"
                                               class="form-control input-sm text-center"
                                               value="<c:if test="${requestScope.page.pageIndex>=1 && requestScope.page.pageIndex<=requestScope.page.totalPage}">${requestScope.page.pageIndex}</c:if><c:if test="${requestScope.page.pageIndex>requestScope.page.totalPage}">${requestScope.page.totalPage}</c:if><c:if test="${requestScope.page.pageIndex < 1}">1</c:if>"
                                               style="width:14%;"> <strong>页</strong>

                    <button type="submit" class="btn btn-info input-sm">Go!</button>
                </label>

                <ul class="pagination" style="float: right;">
                    <li>
                        <a href="javascript:void(0);" onclick="page_nav(1)"><strong>首页</strong></a>
                    </li>
                    <li>
                        <c:if test="${requestScope.page.pageIndex>2}">
                            <a href="javascript:void(0);"
                               onclick="page_nav(${requestScope.page.pageIndex-1})">&laquo;</a>
                        </c:if>
                    </li>

                    <!--写关于分页页码的逻辑-->
                    <!--动态显示:
                            设计：动态的加载下一个分页按钮
                            前提：我们让分页按钮最多加载5个
                            -->
                    <c:choose>
                        <c:when test="${requestScope.page.totalPage <= 5}">
                            <c:set var="begin" value="1"/>
                            <c:set var="end" value="${requestScope.page.totalPage}"/>
                        </c:when>

                        <c:otherwise>
                            <c:set var="begin" value="${requestScope.page.pageIndex - 1}"/>
                            <c:set var="end" value="${requestScope.page.pageIndex + 3}"/>

                            <!--头溢出
                            当前pageIndex的位置是1 只有 1 - 1才会小于1
                            begin:1 肯定是1
                            end:5 因为每页显示5个分页按钮
                            -->
                            <c:if test="${begin < 1}">
                                <c:set var="begin" value="1"/>
                                <c:set var="end" value="5"/>
                            </c:if>

                            <!--尾溢出
                            当前的end 大于了最大的总页数，那么我们就要通过最大的总页数来获得分页按钮的属性值了
                            begin:totalPage - 4 因为我们最多显示5条 -4 之后正好就是第一个分页按钮该显示的属性值
                            end: 很好理解了，直接就是尾部最大的值
                            -->
                            <c:if test="${end > requestScope.page.totalPage}">
                                <c:set var="begin" value="${requestScope.page.totalPage - 4}"/>
                                <c:set var="end" value="${requestScope.page.totalPage}"/>
                            </c:if>
                        </c:otherwise>
                    </c:choose>

                    <!-- 显示页码 -->
                    <c:forEach var="i" begin="${begin}" end="${end}">
                        <!-- 判断是否是当前页 -->
                        <c:if test="${i == requestScope.page.pageIndex}">
                            <li class="active"><a href="javascript:void(0);">${i}</a></li>
                        </c:if>
                        <c:if test="${i != requestScope.page.pageIndex}">
                            <li>
                                <a href="javascript:void(0);" onclick="page_nav(${i});">${i}</a>
                            </li>
                        </c:if>
                    </c:forEach>

                    <li>
                        <c:if test="${requestScope.page.pageIndex < requestScope.page.totalPage}">
                            <a href="javascript:void(0);" onclick="page_nav(${requestScope.page.pageIndex + 1});">&raquo;</a>
                        </c:if>
                    </li>
                    <li>
                        <a href="javascript:void(0);"
                           onclick="page_nav(${requestScope.page.totalPage})"><strong>末页</strong></a>
                    </li>

                </ul>
            </div>
        </div>
    </form>
</div>
</body>
</html>
