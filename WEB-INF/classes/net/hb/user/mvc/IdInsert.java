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


@WebServlet("/Idinsert.dd")
public class IdInsert extends HttpServlet {
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
		out.println("<h2>IdInsert.dd 서블릿문서</h2>");
		
		int userId = Integer.parseInt(request.getParameter("userId"));
		
		CustomerDAO dao = new CustomerDAO();
		// idcheck에서 중복이면 true 아니며 false
		boolean idOk = (boolean)dao.idCheck(userId);
	
		request.setAttribute("id", userId);
		request.setAttribute("idOk" ,idOk);
		RequestDispatcher dis = request.getRequestDispatcher("openIdCheckSave.jsp");
		dis.forward(request, response); //자원넘김
		
	}

}
