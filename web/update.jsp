<%@ page contentType="text/html;charset=UTF-8" language="java"
         import="com.weikun.vo.User" %>
<%@ page import="com.weikun.service.UserServiceImpl" %>
<%@ page import="com.weikun.service.IUserService" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/29
  Time: 18:47
  To change this template use File | Settings | File Templates.
--%>
<%
    IUserService service=new UserServiceImpl();

    User user=new User();
    user.setId(Integer.parseInt(request.getParameter("id")));
    String username=new String(request.getParameter("userName").toString().getBytes("ISO8859-1"),"utf-8");

    user.setUsername(username);
    user.setPassword(request.getParameter("password"));
    if(service.update(user)){
        request.setAttribute("msg","修改成功！");
%>
        <jsp:forward page="index.jsp"/>
<%
    }else{

        request.setAttribute("msg","修改失败！");
%>
        <jsp:forward page="index.jsp"/>
<%
    }
%>