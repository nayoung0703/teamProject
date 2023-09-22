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

@WebServlet("/PostEdit.do")
public class PostEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		doPostUpdate(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		doPostUpdate(request, response);
	}
		
	protected void doPostUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();	
		
    	//C:\mtest\workjsp\dev\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\projectTeam\docs\assets\img 실제저장장소
    	String savePath = request.getServletContext().getRealPath("img");
    	
    	int sizeLimit = 1024*1024*15; // size 및 최대 파일 크기 설정
    	
    	MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8");
    	
    	// postInsert.jsp의 enctype=multipart/form-data 그에 따른 객체로 multi 사용, multi객체로 값 받아옴
    	int userId =  Integer.parseInt(multi.getParameter("edituid"));
    	String storeName = multi.getParameter("editSname");
    	int postId = Integer.parseInt(multi.getParameter("editpid"));
    	String postText = multi.getParameter("editPtext");
    	int postGrade = Integer.parseInt(multi.getParameter("editPgrade"));
    	String postImg = multi.getFilesystemName("editfile");

    	PostDAO dao = new PostDAO();
    	PostVO vo = new PostVO();
    	
    	vo.setUserId(userId);
    	vo.setStoreName(storeName);
    	vo.setPostId(postId);
    	vo.setPostImg(postImg);
    	vo.setPostText(postText);
    	vo.setPostGrade(postGrade);
    	
    	int editSuccess = dao.editPost(vo);
   
    	if(editSuccess > 0) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('수정처리되었습니다');");
			out.println("location='author.jsp';");
			out.println("</script>");
    	}
    	else {
    		out.println("<script>alert('수정처리가 실패하였습니다'); history.back();</script>");
    	}	

	}

}
