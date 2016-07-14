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
		  <li class="active">订单管理</li>
		</ol>
	</div>
  </div>

    </div>
  </div>

其中状态：1表示未处理，2表示已发货
  <!-- 正式内容  -->
  <div class="row" style="margin-top:20px">
	<div class="col-md-12">

<table class="table table-hover">
  <thead>
    <tr>
      <th>订单号</th>
      <th>商品名</th>
      <th>总价</th>
      <th>购买者</th>
      <th>购买时间</th>
      <th>状态</th>
      <th>操作</th>
    </tr>
  </thead>
  <tbody>
  
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<c:forEach items="${Allorder}" var="order">
    <tr class="active">
      <td>${order.order_id}</td>
      <td>${order.goods_id}</td>
      <td>${order.buy_quantity*order.price}</td>
      <td>${order.name}</td>
      <td>${order.order_date}</td>
      <td>${order.processed}</td>
      <td>
      	<a href='./admin/adminOrder?id=${order.order_id}'><button class='btn btn-primary' type='button btn-sm'>查看</button></a>
      	<a href='./admin/adminOrder?del=${order.order_id}'><button class='btn btn-primary' type='button btn-sm'>删除</button></a>
      </td>
    </tr>
	</c:forEach>
  </tbody>
</table>
		
	</div>

  </div>
  

 
</div>


<jsp:include page="footer.jsp"></jsp:include>
