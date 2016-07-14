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
		  <li class="active">会员管理</li>
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
      <th>会员号</th>
      <th>会员名</th>
      <th>手机号码</th>
      <th>余额</th>
      <th>操作</th>
    </tr>
  </thead>
  <tbody>
  
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <c:forEach items="${Allmember}" var="member">
    <tr class="active">
      <td>${member.uid}</td>
      <td>${member.name}</td>
      <td>${member.tel}</td>
      <td>${member.money}</td>
      <td>
      	<a href='<%=path%>/admin/adminMember?id=${member.uid}'><button class='btn btn-primary' type='button btn-sm'>查看</button></a>
      	<a href='<%=path%>/admin/adminMember?del=${member.uid}'><button class='btn btn-primary' type='button btn-sm'>删除</button></a>
      </td>
    </tr>
  </c:forEach>
  
  </tbody>
</table>
		
	</div>

  </div>
  

 
</div>


<jsp:include page="footer.jsp"></jsp:include>
