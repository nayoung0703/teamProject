package net.hb.user.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.net.URLEncoder;
import java.io.File;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.hb.user.CustomerDAO;

import com.oreilly.servlet.MultipartRequest;
import java.util.Enumeration;
import java.io.FileInputStream;
import java.io.OutputStream;


@WebServlet("/JoinInsert.dd")
public class JoinInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}
	
	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<h2>JoinInsert.dd 서블릿문서</h2>");
		
		request.setCharacterEncoding("utf-8");
		
		String location = request.getSession().getServletContext().getRealPath("/userimg");
		System.out.println(location);
		int maxSize = 1024 * 1024 * 5; // 키로바이트 * 메가바이트 * 기가바이트   
		MultipartRequest multi = new MultipartRequest(request,
				  location,
				  maxSize,
				  "utf-8",
				  new DefaultFileRenamePolicy());
		
		int userId = Integer.parseInt(multi.getParameter("userId"));
		int userPwd = Integer.parseInt(multi.getParameter("userPwd"));
		String userName = multi.getParameter("userName");
		String userNick = multi.getParameter("userNick");
		Enumeration<?> files = multi.getFileNames();
		
		String element = "";
		String filesystemName = "";
				
		if (files.hasMoreElements()) { 
			element = (String)files.nextElement(); 
			filesystemName 			= multi.getFilesystemName(element); 
		}
		
		if (filesystemName==null) {
			filesystemName = "av.png";
		}
		
		CustomerDAO dao = new CustomerDAO();	
		
		request.setAttribute("id", userId);
		String message = dao.userJoin(userId, userPwd, userName, userNick,filesystemName);
		RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
		dis.forward(request, response); //자원넘김	
	}

}
