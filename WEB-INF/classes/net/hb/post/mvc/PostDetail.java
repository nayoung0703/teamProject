package net.hb.post.mvc;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/postDetail.do")
public class PostDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPostDetail(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPostDetail(request, response);
	}
	
	protected void doPostDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		//특정 게시글 postid 유지시키기
		HttpSession session = request.getSession();
		
    	int postId = Integer.parseInt(request.getParameter("postid")); 

    	session.setAttribute("poId",postId);
		
		RequestDispatcher dis = request.getRequestDispatcher("postDetail.jsp");
		dis.forward(request, response); 
		
	}
}
