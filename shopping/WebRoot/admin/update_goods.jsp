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
			  <li><a href="<%=path%>/admin/main.jsp"><span class="glyphicon glyphicon-home"></span></a></li>
			  <li class="active">修改商品</li>
			</ol>
		</div>
	  </div>
    </div>
  </div>

  <!-- 正式内容  -->
  <div class="row" style="margin-top:20px">
	<div class="col-md-4">
  
  <form action="<%=path%>/admin/adminGoods" class="form-horizontal" role="form" method="POST">
	<!-- 更新操作判断的id  -->
	<input type="text" name="edit" value="${goods.goods_id}" hidden>
	
  <div class="form-group">
    <label for="inputName3" class="col-sm-2 control-label">名字</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputName3" placeholder="商品名" name="name" value="${goods.name}">
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputName3" class="col-sm-2 control-label">数量</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputName3" placeholder="商品数量" name="quantity" value="${goods.quantity}">
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputTel3" class="col-sm-2 control-label">价格</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputTel3" placeholder="价格" name="price" value="${goods.price}">
    </div>
  </div>
    
	<div class="form-group">
	<label for="input1" class="col-sm-2 control-label">分类</label>
		<div class="col-sm-10">
			<select class="form-control" name="category_id">
			  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 			  <c:forEach items="${Allcategory}" var="category">
				<option value="${category.category_id}">${category.name}</option>
			  </c:forEach>
			</select>
		</div>
	</div>
  
  <div class="form-group">
    <label for="inputSite3" class="col-sm-2 control-label">描述</label>
    <div class="col-sm-10">
      <textarea class="form-control" name="description">${goods.description}</textarea>
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputSite3" class="col-sm-2 control-label">图片</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="imagePath" placeholder="图片地址" name="imagePath" value="${goods.imagePath}${message}">
    </div>
  </div>
  
  <div class="form-group" style="float: left;margin-left: 50px;">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">更新</button>
    </div>
  </div>
  
</form>
		
		
	</div>
	<!-- 图片上传 -->
	<div class="col-md-4">
		<form action="<%=path%>/admin/upload" method="POST" enctype="multipart/form-data">
			<input type="file" class="form-control" id="inputSite3" name="fileName">
			<button type="submit" class="btn btn-default">上传</button>
		</form>
	</div>
	<div class="col-md-4"></div>
  </div>
  

 
</div>
<jsp:include page="footer.jsp"></jsp:include>