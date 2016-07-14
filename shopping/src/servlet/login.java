package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javabean.memberBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin_db.member;


public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private member memberModel;  
	
    public login() {
        super();
        memberModel = new member();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		
		HttpSession session = request.getSession();
		try{
			memberBean member = memberModel.get_userInfo(name);
			if(member.getPass().equals(pass)){
				session.setAttribute("memberUser",member.getName());
				response.sendRedirect(request.getContextPath() + "/index.jsp");
			}else{
				Message(out, "账号或者密码错误");
			}
		}catch(Exception e){
			Message(out, "账号或者密码错误");
		}
	}
	
	private void Message(PrintWriter out, String message) {
		out.println("<script>alert('" + message
				+ "!');window.history.back();</script>");
		out.flush();
	}
}
