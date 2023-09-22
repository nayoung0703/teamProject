package net.hb.post.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.hb.post.PostDAO;
import net.hb.post.PostVO;

@WebServlet("/AuthorDetail.do")
public class AuthorDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAuthorDetaill(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAuthorDetaill(request, response);
	}
	
	protected void doAuthorDetaill(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		//author 게시글 postid 유지시키기
		HttpSession session = request.getSession();
    	int poId = Integer.parseInt(request.getParameter("postid"));
    	
    	session.setAttribute("authorPoId",poId);
		response.sendRedirect("authorPost.jsp");
	}
}
