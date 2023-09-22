package net.hb.post.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.hb.post.PostDAO;
import net.hb.post.PostVO;

@WebServlet("/postDelete.do")
public class PostDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPostDelete(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPostDelete(request, response);
	}
	
	protected void doPostDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();	
		
		int userId = Integer.parseInt(request.getParameter("id"));
		int postId = Integer.parseInt(request.getParameter("postId"));
		
		PostDAO dao = new PostDAO();
    	
		int deleteSuccess = dao.postDelete(userId, postId);

		if(deleteSuccess > 0 ) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('삭제처리되었습니다');");
			out.println("location='author.jsp';");
			out.println("</script>");

		}
		else {
			out.println("<script>alert('삭제처리가 실패하였습니다'); history.back();</script>");
		}	
	}

}
