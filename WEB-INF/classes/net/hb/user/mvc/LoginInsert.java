package net.hb.user.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.hb.user.CustomerDAO;
import net.hb.user.CustomerVO;

@WebServlet("/loginInsert.dd")
public class LoginInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}
	
	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<h2>loginInsert.dd 서블릿문서</h2>");
		HttpSession session = request.getSession();
	
		int u_id = Integer.parseInt(request.getParameter("user_id"));
		int u_pwd = Integer.parseInt(request.getParameter("user_pwd"));
		
		
		
		CustomerDAO dao = new CustomerDAO();
		
		boolean flag = false;
		flag = (boolean)dao.Login(u_id,u_pwd);
		
		// 로그인 성공시에 session.setAttribute(key,value);로 저장
		// response.sendRedirect(이동할 파일);
		if(flag) {
			session.setAttribute("id",u_id);
			response.sendRedirect("index.jsp");
		}else {
			response.sendRedirect("login.jsp");
			session.invalidate();
		}
		
	}

}
