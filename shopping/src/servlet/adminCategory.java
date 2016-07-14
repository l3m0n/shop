package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin_db.category;
import javabean.categoryBean;

public class adminCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private category categoryModel;

    public adminCategory() {
        super();
        categoryModel = new category();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 获取类型
		 */
		if(request.getParameter("del") == null){
			List<categoryBean> Allcategory = categoryModel.get_category();
			request.setAttribute("Allcategory",Allcategory);
			request.getRequestDispatcher("./admin_category.jsp").forward(request, response);
		}else{
			/*
			 * 删除类型
			 */
			categoryModel.del_category(request.getParameter("del"));
			response.sendRedirect("./adminCategory");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 添加类型
		 */
		categoryBean category = new categoryBean();
		
		category.setName(request.getParameter("category"));
		categoryModel.add_category(category);
		response.sendRedirect("./adminCategory");
	}

}
