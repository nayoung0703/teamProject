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

import net.hb.user.CustomerDAO;
import net.hb.user.CustomerVO;

@WebServlet("/deleteInsert.dd")
public class DeleteInsert extends HttpServlet {
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
		out.println("deleteInsert.dd");
		
		int u_id = Integer.parseInt(request.getParameter("user_id"));
		int u_pwd = Integer.parseInt(request.getParameter("user_pwd"));
		
		CustomerDAO dao = new CustomerDAO();
		
		boolean flag = (boolean)dao.UserDelete(u_id, u_pwd);
		
		if(flag) {
			request.setAttribute("id", u_id);
			RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis = request.getRequestDispatcher("");
			dis.forward(request, response);
			out.println("탈퇴 실패");
		}
		
	}

}
