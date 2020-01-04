<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%pageContext.setAttribute("path", request.getContextPath());%>
<html>
<head>
    <title>员工列表</title>
    <link rel="stylesheet" href="${path}/static/bootstrap-3.3.7-dist/css/bootstrap.css" type="text/css">
</head>
<body>


<!-- emp新增模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">员工新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <%--ename--%>
                    <div class="form-group">
                        <label for="empName_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_input"
                                   placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%--邮箱--%>
                    <div class="form-group">
                        <label for="email_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" id="email_input"
                                   placeholder="nyist@456.com">
                            <span id="helpBlock2" class="help-block"></span>
                        </div>
                    </div>
                    <%--性别--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_input" value="W"> 女
                            </label>
                        </div>
                    </div>
                    <%--部门名称--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-3">
                            <select class="form-control" name="dId" id="dName_select">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="add_emp">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- emp修改模态框 -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <%--ename--%>
                    <div class="form-group">
                        <label for="empName_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%--邮箱--%>
                    <div class="form-group">
                        <label for="email_update_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" id="email_update_input">
                            <span id="helpBlock" class="help-block"></span>
                        </div>
                    </div>
                    <%--性别--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="W"> 女
                            </label>
                        </div>
                    </div>
                    <%--部门名称--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-3">
                            <select class="form-control" name="deptno" id="dName_update_select">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>


<%--搭建显示员工列表--%>
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-md-12 col-lg-12">
            <h2>SSM-EMP-CRUD</h2>
        </div>

        <div class="row">
            <div class="col-md-offset-8 col-md-4">
                <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
                <button class="btn btn-danger" id="emp_delete_all_btn">删除选中</button>
            </div>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12 col-sm-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr>
                    <th><input type="checkbox" class="checkAll"></th>
                    <th>#</th>
                    <th>员工姓名</th>
                    <th>员工性别</th>
                    <th>email</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6 col-lg-6 col-sm-6" id="page_info_area">

        </div>
        <%--分页条信息--%>
        <div class="col-sm-6 col-md-6 col-lg-6" id="page_nav_area">

        </div>
    </div>
    <script src="${path}/static/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript">

        //验证添加用户时用户名是否成功
        $("#empName_input").change(function () {

            var v_ename = this.value;
            //发送ajax请求验证用户是否可用
            $.ajax({
                type: "POST",
                data: "empName=" + v_ename,
                url: "${path}/checkEmp",
                success: function (result) {
                    if (result.code == 400) {
                        //处理失败
                        show_validate_msg("#empName_input", "error", result.extend.va_msg);
                        $("#add_emp").attr("ajax_va", "error");
                    } else {
                        //处理成功
                        show_validate_msg("#empName_input", "success", "姓名可用");
                        $("#add_emp").attr("ajax_va", "success");
                    }

                }
            })

        });

        var totalRecord = 0;
        var currentPage = 0;

        $(function () {
            to_page(1);
        });

        //抽取ajax请求
        function to_page(num) {
            $.ajax({
                url: "${path}/getEmps",
                data: "pnum=" + num,
                type: "GET",
                success: function (result) {
                    //显示员工表数据
                    build_emp_table(result);
                    //显示分页数据
                    build_page_Info(result);
                    //显示分页条数据
                    build_page_nav(result);

                }
            });
        }

        function build_emp_table(result) {
            //清空表格中的信息
            $("#emps_table tbody").empty();

            var emps = result.extend.pageInfo.list;
            $.each(emps, function (index, item) {
                /*添加员工信息到表中*/

                var checkEmpTd = $("<td><input type='checkbox' class='check_item'/></td>");
                var empIdTd = $("<td></td>").append(item.empId);
                var empName = $("<td></td>").append(item.empName);

                var genderTd = $("<td></td>").append(item.gender == 'M' ? "男" : "女");
                var emailTd = $("<td></td>").append(item.email);

                /*添加操作按钮*/
                /*编辑按钮*/
                var ediBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                    .append("编辑");
                //给编辑按钮添加员工id属性
                ediBtn.attr("edit-id", item.empId);


                /*删除按钮*/
                var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                    .append("删除");
                //给删除按钮设置员工id属性
                delBtn.attr("delete-id", item.empId);


                var btnTd = $("<td></td>").append(ediBtn).append(" &nbsp;").append(delBtn);

                $("<tr></tr>")
                    .append(checkEmpTd)
                    .append(empIdTd)
                    .append(empName)
                    .append(genderTd)
                    .append(emailTd)
                    .append(btnTd)
                    .appendTo("#emps_table tbody");

            })
        }

        //构建分页信息

        function build_page_Info(result) {
            //在填充数据前先清空分页数据
            $("#page_info_area").empty();

            $("#page_info_area").append(" 当前  " + result.extend.pageInfo.pageNum + " 页,总共  "
                + result.extend.pageInfo.pages + "  页"
                + "共  " + result.extend.pageInfo.total + "  条记录数"
            );
            totalRecord = result.extend.pageInfo.total;
            currentPage = result.extend.pageInfo.pageNum;
        }

        //填充表单数据，根据分页信息，完成点击页码功能
        function build_page_nav(result) {

            $("#page_nav_area").empty();

            var ul = $("<ul></ul>").addClass("pagination");

            //首页li
            var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
            //末页li
            var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
            //前一页
            var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
            ul.append(firstPageLi).append(prePageLi);
            //后一页
            var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));

            if (result.extend.pageInfo.hasPreviousPage == false) {
                firstPageLi.addClass("disabled");
                prePageLi.addClass("disabled");
            } else {
                firstPageLi.click(function () {
                    to_page(1);
                })

                prePageLi.click(function () {
                    to_page(result.extend.pageInfo.pageNum - 1);
                })
            }


            if (result.extend.pageInfo.hasNextPage == false) {
                lastPageLi.attr("disabled", "disabled")
                nextPageLi.addClass("disabled");
            } else {
                lastPageLi.click(function () {
                    to_page(result.extend.pageInfo.pages);
                })

                nextPageLi.click(function () {
                    to_page(result.extend.pageInfo.pageNum + 1);
                })

            }


            $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
                var numLi = $("<li></li>").append($("<a></a>").append(item));
                //判断是不是当前页
                if (result.extend.pageInfo.pageNum == item) {
                    numLi.addClass("active");
                }
                numLi.click(function () {
                    to_page(item)
                });
                ul.append(numLi);
            })
            ul.append(nextPageLi).append(lastPageLi);

            var nav = $("<nav></nav>").append(ul);

            nav.appendTo("#page_nav_area");

        }

        //重置表单函数
        function reset_form(eml) {
            //重置表单内容
            $(eml)[0].reset();
            //重置表单样式
            $(eml).find("*").removeClass("has-success has-error");
            //重置提示框内容
            $(eml).find(".help-block").text("");
        }

        //每次新增需要重置表单和显示部门列表
        $("#emp_add_modal_btn").click(function () {

            //每次点击新增，重置模态框样式，重置表单内容

            reset_form("#empAddModal form");


            //发送ajax请求，查出部门信息，显示在下拉列表中。
            getDept("#dName_select");
            //为了避免点击背景处关闭模态框，需要将模态框的backdrop:static
            $("#empAddModal").modal({
                backdrop: "static"
            });
        });

        function getDept(ele) {
            //清空之前下拉列表的值
            $(ele).empty();
            $.ajax({
                url: "${path}/depts",
                type: "GET",
                success: function (result) {
                    //查询部门名称
                    //console.log(result);

                    var dept = result.extend.depts;
                    $.each(dept, function (index, item) {
                        var deptName = item.deptName;
                        var optionFile = $("<option></option>").append(deptName).attr("value", this.deptId);
                        $(ele).append(optionFile);
                    })
                }
            })
        }

        //前端校验表单格式函数（email和empName）
        function validate_add_form() {
            var empname = $("#empName_input").val();
            var rename = /(^[a-zA-Z0-9_-]{3,10}$)|(^[\u2E80-\u9FFF]{2,5})/;

            if (!rename.test(empname)) {//如果ename校验失败
                //在输入框下方显示错误信息
                show_validate_msg("#empName_input", "error", "员工姓名 3-10位英文和字母组合或2-5位中文!")

                return false;
            } else {
                show_validate_msg("#empName_input", "error", "")

            }

            //校验email
            var email = $("#email_input").val();
            var remail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;

            if (!remail.test(email)) {
                show_validate_msg("#email_input", "error", "邮箱格式错误！")

                return false;
            } else {
                show_validate_msg("#email_input", "error", "")
            }

            return true;

        }

        //校验的时候提示信息显示函数
        function show_validate_msg(ele, status, msg) {
            //在显示提示信息前清空以前所有提示信息
            $(ele).parent().removeClass("has-success has-error");
            if (status == "success") {
                $(ele).parent().addClass("has-success");

            } else if (status == "error") {
                $(ele).parent().addClass("has-error");
            }
            $(ele).next("span").text(msg);
        }

        //增加员工
        $("#add_emp").click(function () {

            //1. 保存员工信息之前先校验用户名和邮箱的书写符合规范否，返回如果返回false，就提示信息并return
            if (!validate_add_form()) {
                //如果校验失败
                return false;
            }
            //2.再判断员工名是否重复
            //如果验证失败，直接返回；不能保存

            if ($(this).attr("ajax_va") == "error") {
                return false;
            }

            $.ajax({
                url: "${path}/emp",
                type: "POST",
                data: $("#empAddModal form").serialize(),
                success: function (result) {
                    if (result.code == 400) {
                        //如果后端返回有错
                        if (undefined != result.extend.errorFields.email) {
                            //如果邮箱格式错误，就在span中提示
                            show_validate_msg("#email_input", "error", "邮箱格式不正确！");
                        }

                        if (undefined != result.extend.errorFields.empName) {
                            show_validate_msg("#empName_input", "error", "用户名不正确！")
                        }

                    } else {
                        //前后端都校验成功才插入，插入成功后，关闭模态框
                        $("#empAddModal").modal('hide');
                        //2.返回末页，显示插入后的数据
                        to_page(totalRecord);//传入记录数作为当前页，
                        // 分页插件会自动将大于总页数的值修改为最后一页。这就显示了最后一页的数据
                    }
                }
            })
        })

        //根据id查询员工信息
        function getEmp(id) {
            $.ajax({
                type: "GET",
                url: "${path}/emp/" + id,
                success: function (result) {
                    var empData = result.extend.emp;
                    $("#empName_update_static").text(empData.empName);
                    $("#email_update_input").val(empData.email);
                    $("#empUpdateModal input[name=gender]").val([empData.gender]);
                    $("#empUpdateModal select").val(empData.deptno);
                }
            })
        }

        //修改员工信息
        $(document).on("click", ".edit_btn", function () {
            //1.在模态框显示之前需要在摸她四矿的部门下拉列表中查到有关数据并填充
            //2.将点击的员工信息查到并显示在模态框中

            getDept("#dName_update_select");

            getEmp($(this).attr("edit-id"));
            //给更新按钮也增加一个员工id属性
            $("#emp_update_btn").attr("edit-id", $(this).attr("edit-id"));


            //为了避免点击背景处关闭模态框，需要将模态框的backdrop:static
            $("#empUpdateModal").modal({
                backdrop: "static"
            });

        })

        //给更新按钮绑定一个click事件
        $("#emp_update_btn").click(function () {
            //1.check email
            var email = $("#email_update_input").val();
            var remail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;

            if (!remail.test(email)) {
                show_validate_msg("#email_update_input", "error", "邮箱格式错误！");
                return false;
            } else {
                show_validate_msg("#email_update_input", "error", "");
            }

            //2. 按照id修改员工信息
            $.ajax({
                url: "${path}/emp/put/" + $(this).attr("edit-id"),
                type: "PUT",
                data: $("#empUpdateModal form").serialize(),
                success: function (result) {
                    //更新成功后，要关闭模态框
                    $("#empUpdateModal").modal("hide");
                    //第二，显示到更改数据那一页
                    to_page(currentPage);
                }
            })

        })

        //给删除按钮添加一个点击事件
        $(document).on("click", ".delete_btn", function () {
            var empName = $(this).parents("tr").find("td:eq(2)").text();
            var empId = $(this).attr("delete-id");


            //单个删除
            if (confirm("确认删除[" + empName + "] ?")) {
                //发送ajax请求
                $.ajax({
                    url: "${path}/emp/" + empId,
                    type: "DELETE",
                    success: function () {
                        to_page(currentPage);
                    }
                })
            }


        })

        //给checkAll绑定单击事件，选中全部check_item
        $(".checkAll").click(function () {
            $(".check_item").prop("checked", $(this).prop("checked"));
        })

        $(document).on("click", ".check_item", function () {
            //每次点击单选框，如果选中的单选框数量等于当前页显示的单选框数量，也就是说
            //当以单选的方式选中所有，那么checkAll也将被选中
            var flag = $(".check_item:checked").length == $(".check_item").length;
            //alert(flag);
            $(".checkAll").prop("checked", flag);
        })

        //删除全部，给emp_delete_all_btn绑定click事件。
        $("#emp_delete_all_btn").click(function () {
            var empNames = "";
            var empIDs = "";
            $.each($(".check_item:checked"), function () {
                empNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
                empIDs += $(this).parents("tr").find("td:eq(1)").text() + ",";

            })

            empNames = empNames.substring(0, empNames.length - 1);
            empIDs = empIDs.substring(0, empNames.length - 1);
            if (confirm("确认删除【" + empNames + "】 ?")) {
                //发送ajax请求，
                $.ajax({
                    url: "${path}/emp/" + empIDs,
                    type: "DELETE",
                    success: function () {
                        to_page(currentPage);
                        $(".checkAll").prop("checked", false);
                    }
                })
            }
        })

    </script>
</div>


</body>

</html>
