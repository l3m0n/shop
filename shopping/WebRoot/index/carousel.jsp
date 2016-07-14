
	   <div id="myCarousel" class="carousel slide">
	       <ol class="carousel-indicators">
	         <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	         <li data-target="#myCarousel" data-slide-to="1"></li>
	         <li data-target="#myCarousel" data-slide-to="2"></li>
	       </ol>
	       <div class="carousel-inner">
	       
	        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	        <% int i = 0; %>
  			<c:forEach items="${Somegoods}" var="goods">
  			<%
  				if(i == 0){
  			%>
  			<div class="active item">
  			<% 	}else{ %>
	        <div class="item" >
	        <% 
	        	}
	        	i=1;
	        %>
	          	<a href="./showGoods?id=${goods.goods_id}"><img src="./asset/img/01.jpg" /></a>
	          	<div class="carousel-caption">
	          		<h4>${goods.name}</h4>
	          		<p>${goods.description}</p>
	          	</div>
	          </div>
	         </c:forEach>
	          
	       </div>
	       <a role="button" class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
	       <a role="button" class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
	  </div>