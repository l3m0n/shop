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
		  <li class="active">订单详情</li>
		</ol>
	</div>
  </div>

    </div>
  </div>

  <!-- 正式内容  -->
  <div class="row" style="margin-top:20px">
	<div class="col-md-6">

<form class="form-horizontal" role="form">

  <div class="form-group">
    <label for="inputName3" class="col-sm-2 control-label">用户名</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputName3" placeholder="" value="${member.name}">
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputSite3" class="col-sm-2 control-label">商品号</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputSite3" placeholder="" value="${order.goods_id}">
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputTel3" class="col-sm-2 control-label">数量</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputTel3" placeholder="" value="${order.buy_quantity}">
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputSite3" class="col-sm-2 control-label">下单时间</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputSite3" placeholder="" value="${order.order_date}">
    </div>
  </div>
  
    <div class="form-group">
    <label for="inputSite3" class="col-sm-2 control-label">tel</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputSite3" placeholder="" value="${member.tel}">
    </div>
  </div>
  
    <div class="form-group">
    <label for="inputSite3" class="col-sm-2 control-label">住址</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputSite3" placeholder="" value="${member.homesite}">
    </div>
  </div>
  
  <div class="form-group" style="float: left;margin-left: 50px;">
    <div class="col-sm-offset-2 col-sm-10">
      <a href="./admin/adminOrder?do=${order.order_id}"><button type="button" class="btn btn-default">处理</button></a>
    </div>
  </div>
  
   <div class="form-group" style="float: left;margin-left: 10px;">
    <div class="col-sm-offset-2 col-sm-10">
      <a href="./admin/adminOrder"><button type="button" class="btn btn-default">返回</button></a>
    </div>
  </div>
  
</form>
		
	</div>
	<div class="col-md-6"></div>
  </div>
  

 
</div>


<jsp:include page="footer.jsp"></jsp:include>
