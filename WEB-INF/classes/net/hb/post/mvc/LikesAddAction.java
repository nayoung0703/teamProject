package net.hb.post.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.hb.post.PostDAO;
import net.hb.post.PostVO;


@WebServlet("/LikesAddAction.do")
public class LikesAddAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doLikesAddAction(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doLikesAddAction(request, response);
	}
	
	
	protected void doLikesAddAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		
		int userId = Integer.parseInt(request.getParameter("id"));
		int postId = Integer.parseInt(request.getParameter("postId"));
		
    	PostDAO dao = new PostDAO();
    	
    	int isliked =  dao.Isliked(userId, postId);
		
    	if(isliked > 0) {
    		out.println("<script type=\"text/javascript\">");
    		out.println("alert('이미 좋아요한 게시글입니다 이전으로 돌아갑니다');");
    		out.println("location='postDetail.jsp';");
    		out.println("</script>");  		
    	}else {
    		dao.updateLikePost(userId, postId);

    		out.println("<script type=\"text/javascript\">");
    		//out.println("alert('좋아요 처리되었습니다');");
    		out.println("location='postDetail.jsp';");
    		out.println("</script>");
    	}
		
		
	}

}
