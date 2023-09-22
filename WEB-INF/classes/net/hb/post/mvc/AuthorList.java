package net.hb.post.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.Date;
import java.util.List;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.hb.post.PostDAO;
import net.hb.post.PostVO;

@WebServlet("/AuthorList.do")
public class AuthorList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAuthorList(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAuthorList(request, response);
	}
	
	protected void doAuthorList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();		
		
		int user_id = Integer.parseInt(request.getParameter("id"));
		
		PostDAO dao = new PostDAO();
		List<PostVO> vo = new ArrayList<PostVO>();
		
		vo = dao.authorListAll(user_id);
		request.setAttribute("list", vo);
		
	    RequestDispatcher dis = request.getRequestDispatcher("author.jsp");
		dis.forward(request, response);
		
	}
}
