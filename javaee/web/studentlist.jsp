<%@ page import="com.java.code.model.StudentHomework" %>
<%@ page import="com.java.code.jdbc.StudentHomeworkJdbc" %>
<%@ page import="java.util.List" %>
<%@ page import="com.java.code.model.Student" %>
<%--
  Created by IntelliJ IDEA.
  User: gaike
  Date: 2020/3/11
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>学生作业管理系统</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="apple-touch-icon-precomposed" href="aaa/images/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="aaa/css/amazeui.min.css" />
    <link rel="stylesheet" href="aaa/css/admin.css">
    <link rel="stylesheet" href="aaa/css/app.css">
</head>

<body data-type="generalComponents">


<header class="am-topbar am-topbar-inverse admin-header">
    <div class="am-topbar-brand">

    </div>
    <div class="am-icon-list tpl-header-nav-hover-ico am-fl am-margin-right">

    </div>

    <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

    <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

        <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list tpl-header-list">
            <li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>


            <li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
                <a class="am-dropdown-toggle tpl-header-list-link" href="javascript:;">
                    <span class="tpl-header-list-user-nick">欢迎您的使用</span>
                </a>
                <script type="text/javascript">
                    function f1(){
                        window.location.href="/retry";
                    }

                </script>
                <ul class="am-dropdown-content">
                    <li><a onclick="f1()"><span class="am-icon-power-off"></span> 退出</a></li>
                </ul>
            </li>
            <li><a onclick="f1()" class="tpl-header-list-link"><span class="am-icon-sign-out tpl-header-list-ico-out-size"></span></a></li>
        </ul>
    </div>
</header>






<div class="tpl-page-container tpl-page-header-fixed">


    <div class="tpl-left-nav tpl-left-nav-hover">
        <div class="tpl-left-nav-title">
            学生作业管理系统
        </div>
        <div class="tpl-left-nav-list">
            <ul class="tpl-left-nav-menu">

                <li class="tpl-left-nav-item">
                    <a href="studentlist.jsp" class="nav-link active">
                        <span>学生管理</span>
                    </a>
                </li>


                <li class="tpl-left-nav-item">
                    <a href="index.jsp" class="nav-link">
                        <span>学生作业管理</span>
                    </a>
                </li>

                <li class="tpl-left-nav-item">
                    <a href="homework.jsp" class="nav-link">
                        <span>老师作业布置</span>
                    </a>
                </li>


            </ul>
        </div>
    </div>



    <div class="tpl-content-wrapper">
        <div class="tpl-content-page-title">
            学生作业管理系统
        </div>
        <ol class="am-breadcrumb">
            <li><a href="#"></a></li>

        </ol>
        <div class="tpl-portlet-components">
            <div class="portlet-title">
                <div class="caption font-green bold">
                    <span class="am-icon-code"></span>学生列表
                </div>



            </div>
            <div class="tpl-block">
                <div class="am-g">
                    <div class="am-u-sm-12 am-u-md-6">
                        <div class="am-btn-toolbar">
                            <div class="am-btn-group am-btn-group-xs">
                                <button type="button" class="am-btn am-btn-default am-btn-success" onclick="window.location.href='addstudent.jsp'"><span class="am-icon-plus"></span> 新增</button>

                            </div>
                        </div>
                    </div>

                    <div class="am-u-sm-12 am-u-md-3">
                        <div class="am-input-group am-input-group-sm">
                            <input type="text" class="am-form-field" placeholder="要查询的学生名" id="key" onkeydown="onSearch(this)" >

                            <script type="text/javascript">
                                function onSearch(obj){//js函数开始
                                    setTimeout(function(){//因为是即时查询，需要用setTimeout进行延迟，让值写入到input内，再读取
                                        var storeId = document.getElementById('HTlist');//获取table的id标识
                                        var rowsLength = storeId.rows.length;//表格总共有多少行
                                        var key = obj.value;//获取输入框的值
                                        var searchCol = 2;//要搜索的哪一列，这里是第一列，从0开始数起
                                        for(var i=1;i<rowsLength;i++){//按表的行数进行循环，本例第一行是标题，所以i=1，从第二行开始筛选（从0数起）
                                            var searchText = storeId.rows[i].cells[searchCol].innerHTML;//取得table行，列的值
                                            if(searchText.match(key)){//用match函数进行筛选，如果input的值，即变量 key的值为空，返回的是ture，
                                                storeId.rows[i].style.display='';//显示行操作，
                                            }
                                            else{
                                                storeId.rows[i].style.display='none';//隐藏行操作
                                            }
                                        }
                                    },200);//200为延时时间
                                }
                            </script>
                            <span class="am-input-group-btn">
            <button class="am-btn  am-btn-default am-btn-success tpl-am-btn-success am-icon-search" type="button"
            ></button>
          </span>
                        </div>
                    </div>
                </div>
                <script type="text/javascript">
                    window.onload = function () {
                        var btns = document.getElementsByTagName("button");
                        for (var i=4, length=btns.length; i<=length; i++) {
                            var btn = btns[i];
                            //将btn所对应的下标保存在btn上
                            btn.index = i;
                            if(i%2==0){
                                btn.onclick = function () {
                                    window.localStorage.setItem('user',this.index+1);
                                    alert('第'+(this.index+1)+'个');
                                    window.location.href="/editKH";

                                };
                            }
                            else {
                                btn.onclick = function (){
                                    window.localStorage.setItem('user1',this.index+1);
                                    alert('第'+(this.index+1)+'个');
                                    window.location.href="/deleteKH";
                                };
                            }
                        }
                    }
                </script>
                <div class="am-g">
                    <div class="am-u-sm-12">
                        <form class="am-form">
                            <table class="am-table am-table-striped am-table-hover table-main" id="HTlist">
                                <thead>
                                <tr>
                                    <th class="table-check"><input type="checkbox" class="tpl-table-fz-check"></th>
                                    <th class="table-id">学号</th>
                                    <th class="table-title">学生名称</th>
                                    <th class="table-title">添加时间呢</th>
                                    <th class="table-set">操作</th>
                                </tr>

                                </thead>

                                <%
                                    List<Student> list = StudentHomeworkJdbc.selectstudent();
                                    if(null == list || list.size() <= 0){
                                        out.print("None data.");
                                    }else {
                                        for (Student s : list){
                                %>

                                <tbody>

                                <tr>
                                    <div class="row">
                                        <td><input type="checkbox"></td>
                                        <td><%=s.getId()%></td>
                                        <td><%=s.getName()%></td>
                                        <td><%=s.getCreateTime()%></td>
                                        <td>
                                            <div class="am-btn-toolbar">
                                                <div class="am-btn-group am-btn-group-xs">
                                                    <button  type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary"onclick="window.location.href='/editKH'"><span class="am-icon-pencil-square-o"></span> 编辑</button>

                                                    <button  type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" onclick="window.location.href='/deleteKH'" ><span class="am-icon-trash-o"></span> 删除</button>
                                                </div>
                                            </div>
                                        </td>
                                    </div>
                                </tr>

                                <%
                                        }
                                    }
                                %>

                                </tbody>
                            </table>

                            <hr>

                        </form>
                    </div>

                </div>
            </div>
            <div class="tpl-alert"></div>
        </div>










    </div>

</div>


<script src="aaa/js/jquery.min.js"></script>
<script src="aaa/js/amazeui.min.js"></script>
<script src="aaa/js/app.js"></script>
</body>

</html>