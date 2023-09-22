package net.hb.post.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.text.ParseException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.hb.post.PostDAO;

@WebServlet("/replyDelete.do")
public class ReplyDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ReplyDelete() {
        super();
     
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}
	
	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int duserId = Integer.parseInt(request.getParameter("duserId"));
		int dpostId = Integer.parseInt(request.getParameter("dpostId"));
		String drContent= request.getParameter("drContent");
		System.out.println(duserId);
		
		PostDAO dao = new PostDAO();
		
		
		dao.deleteReply(duserId,dpostId,drContent);
		
		response.sendRedirect("postDetail.jsp");
		
	}

}
