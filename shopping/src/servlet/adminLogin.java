package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin_db.login;
import javabean.adminBean;

public class adminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private login adminlogin;
	
    public adminLogin() {
        super();
        adminlogin = new login();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		adminBean res = adminlogin.getLogin();
		
		if(res.getUsername().equals(username) && res.getPassword().equals(password)){
			session.setAttribute("loginUser",res.getUsername());			
			response.sendRedirect(request.getContextPath() + "/admin/main.jsp");
		}else{
			Message(out, "账号or密码错误");
			return;
		}
	}
	
	private void Message(PrintWriter out, String message) {
		out.println("<script>alert('" + message
				+ "!');window.history.back();</script>");
		out.flush();
	}
}
