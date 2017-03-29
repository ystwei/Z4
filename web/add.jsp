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
    String username=new String(request.getParameter("userName").toString().getBytes("ISO8859-1"),"utf-8");


    String password=request.getParameter("password");

    User user=new User();

    user.setUsername(username);
    user.setPassword(password);


    if(service.add(user)==true){//增加成功
        request.setAttribute("msg","增加成功！");
 %>
      <jsp:forward page="index.jsp"/>
<%



    }else{
        request.setAttribute("msg","增加失败！");
%>
        <jsp:forward page="index.jsp"/>
<%

    }

%>
