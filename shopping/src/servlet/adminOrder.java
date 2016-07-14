package servlet;

import java.io.IOException;
import java.util.List;

import javabean.categoryBean;
import javabean.memberBean;
import javabean.orderBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin_db.category;
import admin_db.order;
import admin_db.member;

public class adminOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private order orderModel;
    
    public adminOrder() {
        super();
        orderModel = new order();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("del") != null){
			orderModel.del_order(request.getParameter("del"));
			response.sendRedirect("./adminOrder");
			return;
		}
		
		if(request.getParameter("do") != null){
			System.out.println(request.getParameter("do"));
			orderModel.do_order(request.getParameter("do"));
			response.sendRedirect("./adminOrder");
			return;
		}
		
		if(request.getParameter("id") != null){
			orderBean order = orderModel.get_order(request.getParameter("id"));
			
			member memberModel = new member();
			memberBean member = memberModel.get_userInfo(order.getName());
			
			request.setAttribute("member",member);
			request.setAttribute("order",order);
			request.getRequestDispatcher("./order_detail.jsp").forward(request, response);
		}else{
			List<orderBean> Allorder = orderModel.getAll_order();
			request.setAttribute("Allorder",Allorder);
			request.getRequestDispatcher("./admin_order.jsp").forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}

}
