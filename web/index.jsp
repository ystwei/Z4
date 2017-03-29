<%@ page import="com.weikun.service.IUserService" %>
<%@ page import="com.weikun.service.UserServiceImpl" %>
<%@ page import="java.util.*,com.weikun.vo.*" %>
<%@ page language="java" pageEncoding="utf-8"%>

<html>
<head >
  <title>易圣通课堂练习</title>
  <meta charset="utf-8">
  <style>
    .username.ng-valid {
      background-color: lightgreen;
    }
    .username.ng-dirty.ng-invalid-required {
      background-color: red;
    }
    .username.ng-dirty.ng-invalid-minlength {
      background-color: yellow;
    }

    .email.ng-valid {
      background-color: lightgreen;
    }
    .email.ng-dirty.ng-invalid-required {
      background-color: red;
    }
    .email.ng-dirty.ng-invalid-email {
      background-color: yellow;
    }

  </style>
  <script type="text/javascript" src="js/jquery-1.11.0.js"></script>
  <script>
    $(function(){
        $("#rst").click(function(){
            $("#userName").val("");
            $("#password").val("");
            $("#uerror").html("");
            $("#perror").html("");
        });
        $("#form1").submit(function(){
            var username=$("#userName").val();
            var pwd=$("#password").val();

            if(username==""){
               $("#uerror").html("用户不能为空！");

                return false;
            }else{
                $("#uerror").html("");

            }
            if(pwd==""){
                $("#perror").html("密码不能为空！");

                return false;
            }else{

                $("#perror").html("");
            }

            $("#form1").submit();

        });


    });

  </script>


  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <link href="css/app.css" rel="stylesheet"/>
</head>
<body>
<div class="generic-container" >
  <div class="panel panel-default" >
    <div class="panel-heading">
      <span class="lead">注册用户 </span>
      <span class="lead"><%=request.getAttribute("msg")==null?"":request.getAttribute("msg")%></span>
    </div>
    <div class="formcontainer">
      <%
        IUserService service=new UserServiceImpl();
        User u=null;
        if(request.getParameter("id")!="" && request.getParameter("id")!=null) {//有id这个参数，一定是编辑
          String id = request.getParameter("id");
          u = service.queryUserByid(Integer.parseInt(id));
        }


      %>
      <form  name="myForm" class="form-horizontal" id="form1"
             action="<%=u==null?"add.jsp":"update.jsp"%>"
             method="post">


        <div class="row">
          <div class="form-group col-md-12">
            <label class="col-md-2 control-lable">姓名</label>
            <div class="col-md-7">
              <input type="hidden" name="id"
                     value="<%=u==null?"":u.getId()%>"/>
              <input type="text" name="userName" id="userName"
                     value="<%=u==null?"":u.getUsername()%>"
                     class="username form-control input-sm"
                     placeholder="输入你的姓名"/>
              <div class="has-error">
                <span id="uerror"></span>
              </div>
            </div>
          </div>
        </div>


        <div class="row">
          <div class="form-group col-md-12">
            <label class="col-md-2 control-lable" >密码</label>
            <div class="col-md-7">
              <input type="text" name="password" id="password"
                     value="<%=u==null?"":u.getPassword()%>"
                     class="password form-control input-sm"
                     placeholder="输入你的密码"
              />
              <div class="has-error" >
                <span id="perror"></span>

              </div>
            </div>
          </div>
        </div>



        <div class="row">
          <div class="form-actions floatRight">
            <input type="submit" id="add"
                   value="提交"
                   class="btn btn-primary btn-sm"
            >
            <button type="button" id="rst"
                    class="btn btn-warning btn-sm">复原</button>
          </div>
        </div>
      </form>
    </div>
  </div>
  <div class="panel panel-default">
    <!-- Default panel contents -->
    <div class="panel-heading"><span class="lead">用户列表 </span></div>
    <div class="tablecontainer">
      <table class="table table-hover">
        <thead>
        <tr>
          <th>ID.</th>
          <th>用户名</th>
          <th>密码</th>
          <th width="20%">操作</th>
        </tr>
        </thead>
        <tbody>
          <%

            List <User>list=service.queryAll();
            Iterator<User> it=list.iterator();
            int id=0;
            while(it.hasNext()){
                User user=it.next();

          %>
        <tr>
          <td>
              <%=++id%>
          </td>
          <td>
              <%=user.getUsername()%>
          </td>
          <td>
              <%=user.getPassword()%>
          </td>
          <td>
            <a href="index.jsp?id=<%=user.getId()%>"  class="btn btn-success custom-width">编辑</a>
            <a href="del.jsp?id=<%=user.getId()%>"  class="btn btn-danger custom-width">删除</a>
          </td>
        </tr>
        <%
          }

        %>
        </tbody>
      </table>
    </div>
  </div>
</div>


</body>
</html>