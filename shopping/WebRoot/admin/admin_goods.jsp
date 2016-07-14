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
		  <li class="active">商品管理</li>
		</ol>
	</div>
  </div>

    </div>
  </div>

  <!-- 正式内容  -->
  <div class="row" style="margin-top:20px">
	<div class="col-md-12">

<table class="table table-hover">
  <thead>
    <tr>
      <th>商品号</th>
      <th>商品名</th>
      <th>单价</th>
      <th>数量</th>
      <th>操作</th>
    </tr>
  </thead>
  <tbody>
  
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <c:forEach items="${Allgoods}" var="goods">
    <tr class="active">
      <td>${goods.goods_id}</td>
      <td>${goods.name}</td>
      <td>${goods.price}</td>
      <td>${goods.quantity}</td>
      <td>
      	<a href="<%=path%>/admin/adminGoods?id=${goods.goods_id}"><button class='btn btn-primary' type='button btn-sm'>修改</button></a>
      	<a href="<%=path%>/admin/adminGoods?del=${goods.goods_id}"><button class='btn btn-primary' type='button btn-sm'>删除</button></a>
      </td>
    </tr>
   </c:forEach>
  
  </tbody>
</table>
		
	</div>

  </div>
  

 
</div>


<jsp:include page="footer.jsp"></jsp:include>
