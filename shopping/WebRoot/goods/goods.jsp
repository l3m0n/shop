<%@ page pageEncoding="utf-8"%>
	  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  	  <c:forEach items="${Allgoods}" var="goods">
  	  <div class="col-md-3">
  	  
			<div class="container">
			    <div class="row">
			        <div class="col-xs-3 col-md-3">
			            <a href="./showGoods?id=${goods.goods_id}" class="thumbnail">
			                <img src=".${goods.imagePath}" style="height: 180px; width: 100%; display: block;" alt="">
			            </a>
			            <div class="caption">
			                <h3>${goods.name}</h3>
			                <p>¥: ${goods.price}</p>
			                <p>
			                    <a href="./showGoods?id=${goods.goods_id}" class="btn btn-primary">查看详情</a>
			                    <a href="./showGoods?id=${goods.goods_id}" class="btn btn-info">立即购买</a>
			                </p>
			            </div>
			        </div>
			    </div>
			</div>
			
		</div>
		</c:forEach>
		