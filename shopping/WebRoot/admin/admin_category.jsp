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
		  <li class="active">分类管理</li>
		</ol>
	</div>
  </div>

    </div>
  </div>

	<div style="margin-top:20px">
		<form class="form-inline" role="form" action="<%=path%>/admin/adminCategory" method="post">
			<div class="form-group">
			<label class="sr-only" for="exampleInputPassword2">分类名</label>
			<input type="text" class="form-control" id="exampleInputPassword2" placeholder="请输入分类名" name="category">
			</div>
			<button type="submit" class="btn btn-default">添加</button>
		</form>
	</div>
				
  <!-- 正式内容  -->
  <div class="row">
	<div class="col-md-12">

<table class="table table-hover">
  <thead>
    <tr>
      <th>分类号</th>
      <th>分类名</th>
      <th>操作</th>
    </tr>
  </thead>
  <tbody>
  
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <c:forEach items="${Allcategory}" var="category">
    <tr class="active">
      <td>${category.category_id}</td>
      <td>${category.name}</td>
      <td>
      	<a href="<%=path%>/admin/adminCategory?del=${category.category_id}"><button class='btn btn-primary' type='button btn-sm'>删除</button></a>
      </td>
    </tr>
  </c:forEach>
  
  </tbody>
</table>
		
	</div>

  </div>
  

 
</div>


<jsp:include page="footer.jsp"></jsp:include>
