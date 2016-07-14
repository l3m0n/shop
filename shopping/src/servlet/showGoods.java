package servlet;

import java.io.IOException;
import java.util.List;

import javabean.goodsBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin_db.goods;


public class showGoods extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private goods goodsModel;

    public showGoods() {
        super();
        goodsModel = new goods();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("id") == null &&  request.getParameter("type") == null){
			int query = Integer.parseInt(request.getParameter("query"));
			List<goodsBean> Allgoods = goodsModel.getSome_goods(query);
			request.setAttribute("Allgoods",Allgoods);
			request.getRequestDispatcher("./goods/goods.jsp").include(request, response);
		}else if(request.getParameter("type") != null){
			List<goodsBean> Allgoods = goodsModel.getType_goods(request.getParameter("type"));
			request.setAttribute("Allgoods",Allgoods);
			request.getRequestDispatcher("./goods/goods.jsp").include(request, response);
		}else{
			goodsBean goods = goodsModel.get_goods(request.getParameter("id"));
			request.setAttribute("goods",goods);
			request.getRequestDispatcher("./goods_detail.jsp").forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}

}
