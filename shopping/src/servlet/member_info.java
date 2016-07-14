package servlet;

import java.io.IOException;

import javabean.memberBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin_db.member;


public class member_info extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private member memberModel;  
	
    public member_info() {
        super();
        memberModel = new member();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("memberUser");
		if(username != null){
			memberBean member = memberModel.get_userInfo(username);
			request.setAttribute("memberInfo",member);
			request.getRequestDispatcher("./member/info.jsp").include(request, response);
		}else{
			response.sendRedirect("./index.jsp");
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
