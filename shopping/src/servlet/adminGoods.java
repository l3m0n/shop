package servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin_db.category;
import admin_db.goods;
import javabean.categoryBean;
import javabean.goodsBean;

public class adminGoods extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private goods goodsModel;
    
    public adminGoods() {
        super();
        goodsModel = new goods();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 商品删除
		 */
		if(request.getParameter("del") != null){
			goodsModel.del_goods(request.getParameter("del"));
			response.sendRedirect("./adminGoods");
			return;
		}
		
		if(request.getParameter("do") != null){
			
		}
			/*
			 * 获取某一条商品信息
			 */
		if(request.getParameter("id") != null){
			goodsBean goods = goodsModel.get_goods(request.getParameter("id"));
			
			/*
			 * 获取category
			 */
			category categoryModel = new category();
			List<categoryBean> Allcategory = categoryModel.get_category();
			request.setAttribute("Allcategory",Allcategory);
			
			request.setAttribute("goods",goods);
			request.getRequestDispatcher("./update_goods.jsp").forward(request, response);
		}else{
			/*
			 * 获取所有商品,注意response的sendRedirect执行后还是会往下执行
			 */
			List<goodsBean> Allgoods = goodsModel.getAll_goods();
			request.setAttribute("Allgoods",Allgoods);
			request.getRequestDispatcher("./admin_goods.jsp").forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		goodsBean goods = new goodsBean();
		
		/*
		 * 获取表单数据
		 */
		goods.setName(request.getParameter("name"));
		goods.setPrice(Float.parseFloat(request.getParameter("price")));
		goods.setQuantity(Integer.parseInt(request.getParameter("quantity")));
		goods.setDescription(request.getParameter("description"));
		goods.setImagePath(request.getParameter("imagePath"));
        try {
            Date add_time = new Date();
            goods.setAdd_time(add_time);
        } catch (Exception e) {
            e.printStackTrace();
        }
		goods.setCategory_id(Integer.parseInt(request.getParameter("category_id")));
		
		/*
		 * 根据是否有edit来判断是否修改(传入goods的id)或者是添加商品 
		 */
		try{
			if(request.getParameter("edit") == null){
				goodsModel.add_goods(goods);
				response.sendRedirect("./main.jsp");
			}else{
				goods.setGoods_id(Integer.parseInt(request.getParameter("edit")));
				goodsModel.update_goods(goods);
				response.sendRedirect("./adminGoods");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
