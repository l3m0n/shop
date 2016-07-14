<%@ page pageEncoding="utf-8"%>
		<div class="panel panel-default">

				<%
					if(session.getAttribute("memberUser") == null){
				%>
				<!-- 未登录时 -->
				
			  <div class="panel-heading">用户登录</div>
			  <div id="login">
				<form role="form" action="./login" method="POST">
				  <div class="form-group" style="margin-top:20px;">
				    <span class="glyphicon glyphicon-user" style="margin-top: 8px;margin-left: 20px;float:left;"></span>
				    <input type="text" class="form-control" placeholder="请输入您的用户名" style="width: 75%;margin-left: 50px;" name="name">
				  </div>
				  <div class="form-group">
				    <span class="glyphicon glyphicon-lock" style="margin-top: 8px;margin-left: 20px;float:left;"></span>
				    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="请输入您的密码" style="width: 75%;margin-left: 50px;" name="pass">
				  </div>
				  <div style="margin-left: 50px;">
					  <button type="submit" class="btn btn-default">登录</button>
					  <a href="./register.jsp"><button type="button" class="btn btn-default">注册</button></a>
					   <a href="" style="margin-left: 100px;text-decoration: none;color: red;">忘记密码?</a>
				  </div>
				</form>
				</div>
				
				<%
				}else{
				 %>
				 
			  <!-- 登录成功后 -->
			  <div class="panel-heading">用户信息</div>
			  <div id="login">
			  	<div style="margin-top:10px;margin-left: 20px;">
					你好！<%=session.getAttribute("memberUser")%>
					<div style="margin-top:50px">
					<a href="./member_info.jsp"><button type="submit" class="btn btn-default">会员详情</button></a>
					<a href="./logout"><button type="submit" class="btn btn-default">注销</button></a>
					</div>
				</div>
			  </div>
				 
				 <%} %>
		</div>