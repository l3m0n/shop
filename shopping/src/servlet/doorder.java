package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javabean.memberBean;
import javabean.orderBean;
import admin_db.member;
import admin_db.order;

import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class doorder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private order orderModel;
    
	public doorder() {
        super();
        orderModel = new order();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		try{
		if(request.getParameter("do") != null){
			/*
			 * 取消订单
			 */
			if(request.getParameter("do").equals("del")){
				session.setAttribute("orderList", null);
				response.sendRedirect("./order.jsp");
				return;
			}else if(request.getParameter("do").equals("submit")){
			/*
			 * 提交订单
			 */
				List<orderBean> orderSession = (List<orderBean>)session.getAttribute("orderList");
				Float Allmoney = (float)0;
				for(int i=0;i<orderSession.size();i++){
					orderModel.add_order(orderSession.get(i));
					Allmoney = Allmoney + orderSession.get(i).getPrice() * orderSession.get(i).getBuy_quantity();
				}
				/*
				 * 用户money减少
				 */
				orderModel.d_money(Allmoney, (String)session.getAttribute("memberUser"));
				session.setAttribute("orderList", null);
				response.sendRedirect("./member_info.jsp");
			}
		}else{
			/*
			 * 用户中心查询订单
			 */
			List<orderBean> orderList = orderModel.getMember_order((String)session.getAttribute("memberUser"));
			
			request.setAttribute("orderList",orderList);
			request.getRequestDispatcher("./member/order.jsp").include(request, response);
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		orderBean temporder = new orderBean();
		
		if(session.getAttribute("memberUser") == null){
			Message(out, "未登录");
			return;
		}
		
		temporder.setBuy_quantity(Integer.parseInt(request.getParameter("buy_quantity")));
		temporder.setGoods_id(Integer.parseInt(request.getParameter("goods_id")));
		temporder.setPrice(Float.parseFloat(request.getParameter("price")));
		temporder.setName((String)session.getAttribute("memberUser"));
		
        try {
            Date add_time = new Date();
            temporder.setOrder_date(add_time);
        } catch (Exception e) {
            e.printStackTrace();
        }
		
		if(session.getAttribute("orderList") == null){
			List<orderBean> orderSession = new ArrayList<orderBean>();
			orderSession.add(temporder);
			session.setAttribute("orderList",orderSession);
		}else{
			List<orderBean> orderSession = (List<orderBean>)session.getAttribute("orderList");
			orderSession.add(temporder);
			session.setAttribute("orderList",orderSession);	
		}
		response.sendRedirect("./order.jsp");
	}
	
	
	
	private void Message(PrintWriter out, String message) {
		out.println("<script>alert('" + message
				+ "!');window.history.back();</script>");
		out.flush();
	}

}
