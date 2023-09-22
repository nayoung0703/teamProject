package net.hb.post.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import net.hb.post.PostDAO;
import net.hb.post.PostVO;

//기존에 저장된 게시글 정보 불러오기
@WebServlet("/postEditHistory.do")
public class PostEditHistory extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPostEditHistory(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPostEditHistory(request, response);
	}
	
	protected void doPostEditHistory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();	
		
		int userId = Integer.parseInt(request.getParameter("id"));
		int postId = Integer.parseInt(request.getParameter("postId"));
		
		PostDAO dao = new PostDAO();
		
		PostVO historyVo = dao.postHistory(userId, postId);
		
		int historyUserId = historyVo.getUserId();
		int historyPostId = historyVo.getPostId();
		String historyStorename = historyVo.getStoreName();
		String historyPostText = historyVo.getPostText();
		String historyPostImg = historyVo.getPostImg();
		int historyPostGrade = historyVo.getPostGrade();
		
		
		request.setAttribute("id", historyUserId);
		request.setAttribute("postId", historyPostId);
		request.setAttribute("storeName", historyStorename);
		request.setAttribute("postText", historyPostText);
		request.setAttribute("postImg", historyPostImg);
		request.setAttribute("postGrade", historyPostGrade);
		
		RequestDispatcher dis = request.getRequestDispatcher("postEdit.jsp");
		dis.forward(request, response); //자원넘김
		
		
	}
}
