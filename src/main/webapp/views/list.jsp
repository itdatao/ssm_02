<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%pageContext.setAttribute("path", request.getContextPath());%>
<html>
<head>
    <title>员工列表</title>
    <link rel="stylesheet" href="${path}/static/bootstrap-3.3.7-dist/css/bootstrap.css" type="text/css">

</head>
<body>
<%--搭建显示员工列表--%>
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-md-12 col-lg-12">
            <h2>SSM-EMP-CRUD</h2>
        </div>

        <div class="row">
            <div class="col-md-offset-8 col-md-4">
                <button class="btn btn-primary">新增</button>
                <button class="btn btn-danger">删除</button>
            </div>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12 col-sm-12">
            <table class="table table-hover">
                <tr>
                    <th>#</th>
                    <th>员工姓名</th>
                    <th>员工性别</th>
                    <th>email</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="emp">
                    <tr>
                        <th>${emp.empId}</th>
                        <th>${emp.empName}</th>
                        <th>${emp.gender=="M"?"男":"女"}</th>
                        <th>${emp.email}</th>
                        <th>
                            <button class="btn btn-info btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                编辑
                            </button>
                            <button class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                删除
                            </button>
                        </th>
                    </tr>
                </c:forEach>

            </table>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6 col-lg-6 col-sm-6">
            当前${pageInfo.pageNum}页,总共${pageInfo.pages}页
        </div>
        <%--分页条信息--%>
        <div class="col-sm-6 col-md-6 col-lg-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${path}/getEmps?pnum=1">首页</a></li>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="${path}/getEmps?pnum=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                        <c:if test="${pageInfo.pageNum == page_Num}">
                            <li class="active"><a href="#">${page_Num}</a></li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum != page_Num}">
                            <li><a href="${path}/getEmps?pnum=${page_Num}">${page_Num}</a></li>
                        </c:if>


                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="${path}/getEmps?pnum=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <li><a href="${path}/getEmps?pnum=${pageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<script src="${path}/static/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="${path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>

</body>

</html>
