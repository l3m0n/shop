<%@ page pageEncoding="utf-8"%>
<% String path = request.getContextPath(); %>
<jsp:include page="header.jsp"></jsp:include>

  <div class="container">
  
  <!-- 二级导航 -->
  <div class="row">
    <div class="col-md-12">
    
  <div class="row">
  	<div class="col-md-12" style="background: #f5f5f5;width: 100%;height: 35px;">
		<ol class="breadcrumb">
		  <li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
		  <li class="active">用户详情</li>
		</ol>
	</div>
  </div>

    </div>
  </div>

  <!-- 正式内容  -->
  <div class="row" style="margin-top:20px">
	<div class="col-md-6">

<form class="form-horizontal" role="form" action="./admin/adminMember" method="POST">

<input type="text" name="edit" value="${member.uid}" hidden>

  <div class="form-group">
    <label for="inputName3" class="col-sm-2 control-label">用户名</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputName3" placeholder="" value="${member.name}" name="name">
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputName3" class="col-sm-2 control-label">真实姓名</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputName3" placeholder="" value="${member.realname}" name="realname">
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputName3" class="col-sm-2 control-label">手机号</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputName3" placeholder="" value="${member.tel}" name="tel">
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputSite3" class="col-sm-2 control-label">家庭住址</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputSite3" placeholder="" value="${member.homesite}" name="homesite">
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputTel3" class="col-sm-2 control-label">余额</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputTel3" placeholder="" value="${member.money}" name="money">
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputSite3" class="col-sm-2 control-label">密码</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputSite3" placeholder="" value="${member.pass}" name="pass">
    </div>
  </div>
  
  
  
  <div class="form-group" style="float: left;margin-left: 50px;">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">更新信息</button>
    </div>
  </div>
  
   <div class="form-group" style="float: left;margin-left: 10px;">
    <div class="col-sm-offset-2 col-sm-10">
      <a href="./admin/adminMember"><button type="button" class="btn btn-default">返回</button></a>
    </div>
  </div>
  
</form>
		
	</div>
	<div class="col-md-6"></div>
  </div>
  

 
</div>


<jsp:include page="footer.jsp"></jsp:include>
