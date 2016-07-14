<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title></title>
	<link rel="stylesheet" type="text/css" href="./asset/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="./asset/css/main.css">
  </head>

  <body>

<!-- 导航 -->
<div class="navbar navbar-default" role="navigation">
  　<div class="navbar-header">
  　    <a href="<%=path%>/admin/main.jsp" class="navbar-brand">后台管理</a>
  　</div>
    <ul class="nav navbar-nav">
       <li><a href="<%=path%>/admin/main.jsp">添加商品</a></li>
       <li><a href="<%=path%>/admin/adminGoods">商品管理</a></li>
       <li><a href="<%=path%>/admin/adminOrder">订单管理</a></li>
       <li><a href="<%=path%>/admin/adminCategory">分类管理</a></li>
       <li><a href="<%=path%>/admin/adminMember">会员管理</a></li>
    </ul>
    <ul style="float:right" class="nav navbar-nav">
       <li class="active"><a href="<%=path%>/admin/main.jsp">Admin</a></li>
       <li><a href="<%=path%>/logout">退出</a></li>
    </ul>
</div>