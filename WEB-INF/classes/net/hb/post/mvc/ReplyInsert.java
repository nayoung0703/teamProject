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

import net.hb.post.PostDAO;
import net.hb.post.PostVO;


@WebServlet("/replyInsert.do")
public class ReplyInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;


    protected void dopost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doUser(request,response);	
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request,response);
	}

	
	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		int userId = Integer.parseInt(request.getParameter("userId"));
		int postId = Integer.parseInt(request.getParameter("postId"));
		String rcontent = request.getParameter("r_content");
		
		
		PostDAO dao = new PostDAO();
    	PostVO vo = new PostVO();
    	
    	vo.setUserid(userId);
    	vo.setRcontent(rcontent);
    	vo.setPostid(postId);
    	
    	
    	boolean flag = dao.insertReply(vo);
    	
    	if(flag) {
    		response.sendRedirect("postDetail.jsp");
    	}else {
    		response.sendRedirect("postDetail.jsp");
    	}

		
	}

}
