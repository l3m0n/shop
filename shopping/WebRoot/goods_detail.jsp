<%@ page pageEncoding="utf-8"%>
<% String path = request.getContextPath(); %>
<jsp:include page="/index.do">
	<jsp:param name="aim" value="header" />
</jsp:include>
  
  <div class="row" style="margin-top:10px">
  	<div class="col-md-12" style="background: #f5f5f5;width: 100%;height: 35px;">
		<ol class="breadcrumb">
		  <li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
		  <li class="active">商品详情</li>
		</ol>
	</div>
  </div>
  

	<div class="row" style="margin-top:20px">
		<div class="col-md-12">
		
			<div class="media">
			    <a class="pull-left" href="#">
			        <img class="media-object" src=".${goods.imagePath}" alt="..." style="height: 300px; width: 380px; display: block;">
			      </a>
			      <div class="media-body">
			        <h4 class="media-heading">${goods.name}</h4>
			        <div>
			        	${goods.description}
			        </div>
			        
			        <div>

						<form role="form" action="./order" method="POST">
						<!-- 表单数据提交 -->
						<input type="text" name="goods_id" value="${goods.goods_id}" hidden>
						<input type="text" name="price" value="${goods.price}" hidden>
						
						  <div style="float: left;font-size: 25px;">
						  单价：${goods.price}
						  </div>
						  <div class="form-group" style="float: left;margin-left: 20px;">
						    <select class="form-control" style="width: 80px;" name="buy_quantity">
						      <option>1</option>
						      <option>2</option>
						      <option>3</option>
						      <option>4</option>
						      <option>5</option>
						      </select>
						  </div>
						  <div style="float: left;margin-left: 20px;">
						  	<button class="btn btn-primary" type="submit">购买</button>
						  </div>
						</form>
			        </div>
			      </div>
			</div>
			
		</div>
	</div>
  
  

  

</div>


<jsp:include page="footer.jsp"></jsp:include>
