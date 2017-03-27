<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/23
  Time: 19:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  import="com.weikun.vo.User" %>
<jsp:useBean id="service" class="com.weikun.service.UserServiceImpl"/>
<%

    String username=request.getParameter("userName");

    String password=request.getParameter("password");

    User user=new User();

    user.setUsername(username);
    user.setPassword(password);


    if(service.add(user)==true){//增加成功
 %>
        <script>
            alert("增加成功！");
            window.location="index.jsp";
        </script>
<%



    }else{

%>
        <script>

            alert("增加失败！");
            window.location="index.jsp";
        </script>
<%

    }

%>
