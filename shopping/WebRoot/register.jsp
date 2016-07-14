<%@ page pageEncoding="utf-8"%>
<% String path = request.getContextPath(); %>
<jsp:include page="/index.do">
	<jsp:param name="aim" value="header" />
</jsp:include>
  
  <div class="row" style="margin-top:10px">
  	<div class="col-md-12" style="background: #f5f5f5;width: 100%;height: 35px;">
		<ol class="breadcrumb">
		  <li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
		  <li class="active">用户注册</li>
		</ol>
	</div>
  </div>
  

  <div class="row" style="margin-top:20px">
	<div class="col-md-4">
	
<form class="form-horizontal" role="form" action="./register" method="POST">

  <div class="form-group">
    <label for="inputName3" class="col-sm-2 control-label">姓名</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputName3" placeholder="请输入您的用户名" name="name">
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputName3" class="col-sm-2 control-label">真实姓名</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputName3" placeholder="请输入您的真实姓名" name="realname">
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputPassword3" placeholder="请输入您的密码" name="pass">
    </div>
  </div>
  
 <!--   <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputPassword3" placeholder="再次输入您的密码">
    </div>
  </div> -->
  
  <div class="form-group">
    <label for="inputTel3" class="col-sm-2 control-label">tel</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputTel3" placeholder="请输入您的手机号码" name="tel">
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputSite3" class="col-sm-2 control-label">住址</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputSite3" placeholder="请输入您的住址" name="homesite">
    </div>
  </div>
  
  <div class="form-group" style="float: left;margin-left: 50px;">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">注册账号</button>
    </div>
  </div>
  
  <div class="form-group" style="float: left;margin-left: 10px;">
    <div class="col-sm-offset-2 col-sm-10">
      <a href="./index.jsp"><button type="button" class="btn btn-default">返回登录</button></a>
    </div>
  </div>
  
</form>
		
		
	</div>
	<div class="col-md-8"></div>
  </div>
  
  

  

</div>


<jsp:include page="footer.jsp"></jsp:include>
