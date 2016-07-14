package servlet;

import java.io.IOException;
import java.util.List;

import javabean.categoryBean;
import javabean.goodsBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin_db.category;
import admin_db.goods;

public class index extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private category categoryModel;
	private goods goodsModel;
	
    public index() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String aim = request.getParameter("aim");
		
		/*
		 * 获取商品类型、carousel的商品获取
		 */
		if(aim.equals("header")){
			categoryModel = new category();
			List<categoryBean> Allcategory = categoryModel.get_category();
			request.setAttribute("Allcategory",Allcategory);
			request.getRequestDispatcher("./header.jsp").include(request, response);
		}else if(aim.equals("carousel")){
			goodsModel = new goods();
			List<goodsBean> Somegoods = goodsModel.getSome_goods(3);
			request.setAttribute("Somegoods",Somegoods);
			request.getRequestDispatcher("./index/carousel.jsp").include(request, response);
		}else if(aim.equals("login")){
			request.getRequestDispatcher("./index/login.jsp").include(request, response);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
