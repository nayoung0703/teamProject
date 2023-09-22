package net.hb.user.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.hb.user.CustomerDAO;

@WebServlet("/UserUpdate.dd")
public class UserUpdate extends HttpServlet {
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
		out.println("<h2>UserUpdate.dd 서블릿문서</h2>");
		
		int n_id = Integer.parseInt(request.getParameter("id"));
		int n_pwd = Integer.parseInt(request.getParameter("pwd"));
		String n_name = request.getParameter("name");
		String n_nick = request.getParameter("nick");
		
		
		CustomerDAO dao = new CustomerDAO();
		dao.userUpdate(n_id, n_pwd, n_name, n_nick);
		
		RequestDispatcher dis = request.getRequestDispatcher("author.jsp");
		dis.forward(request, response);
	}


}
