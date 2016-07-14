<%@ page pageEncoding="utf-8"%>
其中状态：1表示未处理，2表示已发货
<table class="table table-hover">
  <thead>
    <tr>
      <th>商品名</th>
      <th>单价</th>
      <th>数量</th>
      <th>小计</th>
      <th>处理状态</th>
    </tr>
  </thead>
  <tbody>
  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  	<c:forEach items="${orderList}" var="order">
    <tr class="active">
      <td>${order.goods_id}</td>
      <td>${order.price}</td>
      <td>${order.buy_quantity}</td>
      <td>${order.price*order.buy_quantity}</td>
      <td>${order.processed}</td>
    </tr>
	</c:forEach>

  </tbody>
</table>

<a href="./order.jsp"><button type="submit" class="btn btn-default">查看当前订单</button></a>