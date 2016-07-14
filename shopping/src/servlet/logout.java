package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public logout() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("loginUser"));
		
		if(session.getAttribute("loginUser") != null){
			if(session.getAttribute("loginUser").equals("admin")){
				session.setAttribute("loginUser", null);
				session.removeAttribute("loginUser");
				response.sendRedirect(request.getContextPath() + "/admin/index.jsp");
				return;
			}
		}
		
		if(session.getAttribute("memberUser") != null){
			session.setAttribute("memberUser", null);
			session.removeAttribute("memberUser");
			response.sendRedirect(request.getContextPath() + "/index.jsp");
			return;
		}else{
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		}
		
	}

}
