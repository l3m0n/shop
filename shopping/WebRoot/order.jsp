<%@ page import="javax.servlet.http.HttpSession" pageEncoding="utf-8"%>
<%@ page import="javabean.orderBean" %>
<%@ page import="java.util.*" %>

<% String path = request.getContextPath(); %>
<jsp:include page="/index.do">
	<jsp:param name="aim" value="header" />
</jsp:include>
  
  <div class="row" style="margin-top:10px">
  	<div class="col-md-12" style="background: #f5f5f5;width: 100%;height: 35px;">
		<ol class="breadcrumb">
		  <li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
		  <li class="active">订单详情</li>
		</ol>
	</div>
  </div>

  
  <div class="row" style="margin-top:10px">
	<div class="col-md-12">
	
<table class="table table-hover">
  <thead>
    <tr>
      <th>商品名</th>
      <th>单价</th>
      <th>数量</th>
      <th>小计</th>
    </tr>
  </thead>
  <tbody>
	<%
	Float Allmoney = (float)0;
	try{
		List<orderBean> orderSession = (List<orderBean>)session.getAttribute("orderList");
		for(int i = 0; i < orderSession.size(); i++) {  
		orderBean order = orderSession.get(i);
		Float money =  order.getPrice() * order.getBuy_quantity();
		Allmoney = Allmoney + money;
	%>
      <tr class="active">
	      <td><%=order.getGoods_id()%></td>
	      <td><%=order.getPrice()%></td>
	      <td><%=order.getBuy_quantity()%></td>
	      <td><%=money%></td>
      </tr>
    <%
        }}catch(Exception e){}
	%>

  </tbody>
</table>

	</div>
  </div>

 
  <div class="row" style="margin-top:10px">
	<div class="col-md-9"></div>
	<div class="col-md-3" style="font-size: 30px">
		总价：<font style="color: red"><%=Allmoney%></font>
	</div>
  </div>

  <div class="row" style="margin-top:10px">
	<div class="col-md-9"></div>
	<div class="col-md-3">

  <div class="form-group" style="float: left">
    <div class="col-sm-offset-2 col-sm-10">
      <a href="./order?do=submit"><button type="submit" class="btn btn-default">提交订单</button></a>
    </div>
  </div>
  
  <div class="form-group" style="float: left">
    <div class="col-sm-offset-2 col-sm-10">
      <a href="./order?do=del"><button type="button" class="btn btn-default">取消订单</button></a>
    </div>
  </div>
  
	</div>
  </div>
  

</div>


<jsp:include page="footer.jsp"></jsp:include>
