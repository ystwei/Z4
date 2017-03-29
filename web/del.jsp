<%@ page import="com.weikun.service.IUserService" %>
<%@ page import="com.weikun.service.UserServiceImpl" %>
<%@ page import="java.util.*,com.weikun.vo.*" %>
<%@ page language="java" pageEncoding="utf-8"%>

<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/29
  Time: 18:03
  To change this template use File | Settings | File Templates.
--%>
<%
    IUserService service=new UserServiceImpl();
    String id=request.getParameter("id");
    if(service.del(Integer.parseInt(id))){
        request.setAttribute("msg","删除成功！");
%>
        <jsp:forward page="index.jsp"/>
<%
    }else{

        request.setAttribute("msg","删除失败！");
%>
        <jsp:forward page="index.jsp"/>
<%

    }
%>
