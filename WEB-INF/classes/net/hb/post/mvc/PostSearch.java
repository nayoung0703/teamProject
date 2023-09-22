package net.hb.post.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.hb.post.PostDAO;
import net.hb.post.PostVO;

@WebServlet("/postSearch.do")
public class PostSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPostSearch(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPostSearch(request, response);
	}

	protected void doPostSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		//특정 게시글 postid 유지시키기
		//HttpSession sessionSearch = request.getSession();
		
		String postSearch = request.getParameter("search-input");
		
		if(postSearch =="" || postSearch==null) {
			postSearch = "";
		}
		
		PostDAO pdao = new PostDAO();
		PostVO pvo = new PostVO();
		
		List<PostVO> searchList = pdao.searchListAll(postSearch);
		request.setAttribute("search-input", postSearch);
		request.setAttribute("postSearchList", searchList);
		RequestDispatcher dis = request.getRequestDispatcher("postSearch.jsp");
		dis.forward(request, response);
	}
}
