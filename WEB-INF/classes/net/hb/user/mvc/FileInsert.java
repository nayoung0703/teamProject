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


@WebServlet("/FileInsert.dd")
public class FileInsert extends HttpServlet {
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
		out.println("<h2>FileInsert.dd 서블릿문서</h2>");
		
		int userId = Integer.parseInt(request.getParameter("userId"));
		int userPwd = Integer.parseInt(request.getParameter("userPwd"));
		String userName = request.getParameter("userName");
		String userNick = request.getParameter("userNick");
		
		
		request.setAttribute("id", userId);
		request.setAttribute("pwd", userPwd);
		request.setAttribute("name", userName);
		request.setAttribute("nick", userNick);
		RequestDispatcher dis = request.getRequestDispatcher("profile.jsp");
		dis.forward(request, response); //자원넘김	
	}

}
