<%@ page pageEncoding="utf-8"%>
<% String path = request.getContextPath(); %>
<jsp:include page="/index.do">
	<jsp:param name="aim" value="header" />
</jsp:include>

  <!-- pic -->
<div class="row" style="margin-top:8px">
	<div class="col-md-8">
		<jsp:include page="/index.do">
			<jsp:param name="aim" value="carousel" />
		</jsp:include>
	</div>
		
	<!-- member info && login -->
    <div class="col-md-4">
		<jsp:include page="/index.do">
			<jsp:param name="aim" value="login" />
		</jsp:include>
    </div>
    
  </div>
  
  <div class="row" style="margin-top:10px">
  	<div class="col-md-12" style="background: #f5f5f5;width: 100%;height: 35px;">
		<ol class="breadcrumb">
		  <li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
		  <li class="active">商品</li>
		  <li><a href="./goods.jsp">查看更多</a></li>
		</ol>
	</div>
  </div>
  
  <!-- goods info -->
	<div class="row" style="margin-top:10px">
		
		<jsp:include page="/showGoods">
			<jsp:param name="query" value="8" />
		</jsp:include>

	</div>

  <!-- pager -->

	<ul class="pager">
	  <li><a href="#">&laquo;上一页</a></li>
	  <li><a href="#">下一页&raquo;</a></li>
	</ul>

<jsp:include page="footer.jsp"></jsp:include>
