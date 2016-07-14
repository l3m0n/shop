<%@ page pageEncoding="utf-8"%>
<% String path = request.getContextPath(); %>
<jsp:include page="/index.do">
	<jsp:param name="aim" value="header" />
</jsp:include>
  
  <div class="row" style="margin-top:10px">
  	<div class="col-md-12" style="background: #f5f5f5;width: 100%;height: 35px;">
		<ol class="breadcrumb">
		  <li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
		  <li class="active">用户信息</li>
		</ol>
	</div>
  </div>
  
  <!-- 标题 -->
    <div class="row" style="margin-top:10px">
		<div class="col-md-6">
			用户信息：
		</div>
		<div class="col-md-6">
			订单管理：
		</div>
	</div>
  
  <!-- 用户信息和订单管理 -->
  <div class="row" style="margin-top:10px">
	<div class="col-md-6">

		<!-- 用户信息 -->
		<jsp:include page="/member_info"></jsp:include>

	</div>
	<div class="col-md-6">
		<!-- 订单信息 -->
		<jsp:include page="/order"></jsp:include>

	</div>
  </div>


  

  

</div>


 <jsp:include page="footer.jsp"></jsp:include>
