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
  <!-- nav -->
  	<div class="top-nav">
            <div>
            <% if(session.getAttribute("memberUser") == null){ %>
            	<a href="#">登录</a>
            	<a href="./register.jsp">注册</a>
            <% }else{ %>
            	<span class="glyphicon glyphicon-user" style="margin-top: 8px;"></span>
            	<a href="./member_info.jsp"><%=session.getAttribute("memberUser")%>用户</a>
            	<a href="./logout">注销</a>
            <%} %>
            	<a href="#">返回首页</a>
            </div>
  	</div>
  <div class="container" style="margin-top:20px;">
  
  <!-- search -->
  <div class="row">
  	<div class="col-md-2"></div>
    <div class="col-md-6">	
	    <form role="form">
		<div class="form-group">
		<input type="text" class="form-control" placeholder="搜一搜">
		</div>
		</form>
	</div>
	<div class="col-md-4">
		<button class="btn btn-default" type="button">
			搜索&nbsp;<span class="glyphicon glyphicon-search"></span>
		</button>
	</div>
  </div>
  
  <!-- nav -->
  <div class="row">
    <div class="col-md-12">
	    <ul class="nav nav-tabs" style="border-top:3px solid #ddd;">
	      <li><a href="./goods.jsp">All</a></li>
	      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  		  <c:forEach items="${Allcategory}" var="category">
	    	<li><a href="./goods.jsp?type=${category.category_id}">${category.name}</a></li>
	      </c:forEach>
	      
		</ul>
    </div>
  </div>