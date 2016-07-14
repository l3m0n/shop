package servlet;

import java.io.IOException;
import java.util.List;

import javabean.goodsBean;
import javabean.memberBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin_db.member;


public class adminMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private member memberModel;

    public adminMember() {
        super();
        memberModel = new member();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("del") != null){
			memberModel.del_member(request.getParameter("del"));
			response.sendRedirect("./adminMember");
			return;
		}
		
		if(request.getParameter("id") != null){
			memberBean member = memberModel.get_member(request.getParameter("id"));
			request.setAttribute("member",member);
			request.getRequestDispatcher("./member_detail.jsp").forward(request, response);
		}else{
			List<memberBean> Allmember = memberModel.getAll_member();
			request.setAttribute("Allmember",Allmember);
			request.getRequestDispatcher("./admin_member.jsp").forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		memberBean member = new memberBean();
		member.setHomesite(request.getParameter("homesite"));
		member.setMoney(Float.parseFloat(request.getParameter("money")));
		member.setName(request.getParameter("name"));
		member.setPass(request.getParameter("pass"));
		member.setRealname(request.getParameter("realname"));
		member.setTel(request.getParameter("tel"));
		
		member.setUid(Integer.parseInt(request.getParameter("edit")));
		memberModel.update_memebr(member);
		response.sendRedirect("./adminMember");
	}

}
