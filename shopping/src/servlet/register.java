package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin_db.member;
import javabean.memberBean;

public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private member memberModel;
	
    public register() {
        super();
        memberModel = new member();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		memberBean member = new memberBean();
		
		member.setName(request.getParameter("name"));
		member.setRealname(request.getParameter("realname"));
		member.setHomesite(request.getParameter("homesite"));
		member.setPass(request.getParameter("pass"));
		member.setTel(request.getParameter("tel"));
		try{
			memberModel.register(member);
			response.sendRedirect("./index.jsp");
		}catch(Exception e){
			e.printStackTrace();
		}

	}
}
