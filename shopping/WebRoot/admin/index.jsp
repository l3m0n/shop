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
		<div class="container">

		  <div class="row">
		    <div class="col-md-4"></div>
		    <div class="col-md-4">
		    	<div style="margin-top: 50%; text-align:center;"><h2>后台管理<h2></div>

				<form class="form-horizontal" role="form" action="<%=request.getContextPath()%>/admin/adminlogin" method="POST">

				  	<div class="form-group" style="margin-top: 1%;">
				    <label for="input1" class="col-sm-2 control-label">用户</label>
				    <div class="col-sm-10">
				      	<input type="text" class="form-control" id="input1" placeholder="请输入用户名" name="username">
				    </div>
				  	</div>

				  	<div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
				    <div class="col-sm-10">
				      	<input type="password" class="form-control" id="inputPassword3" placeholder="请输入密码" name="password">
				    </div>
				 	</div>

				  	<div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      	<div class="checkbox">
				        <label>
				          <input type="checkbox"> 记住密码
				        </label>
				      	</div>
				    </div>
				  	</div>

				  	<div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      	<button type="submit" class="btn btn-default">登录</button>
				    </div>
				  	</div>

				</form>

		    </div>
		    <div class="col-md-4"></div>
		  </div>
		</div>
		
  </body>
</html>
