package net.hb.store.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.hb.store.*;

@WebServlet("/MapToStoreInsertToPostInsert.dd")
public class MapToStoreInsertToPostInsert extends HttpServlet{
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}
	
	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String storeName = request.getParameter("storeName");
		String lat = request.getParameter("lat");
		String lng = request.getParameter("lng");
		
		StoreDAO sdao = new StoreDAO();
		StoreVO svo = new StoreVO();
		boolean storeRegiOk = sdao.storeIdCheck(storeName, lat, lng);
		
		if(storeRegiOk) {
			svo = sdao.storeIdGet(storeName, lat, lng);
			request.setAttribute("svo", svo);
			RequestDispatcher dis = request.getRequestDispatcher("/postInsert.jsp");
			dis.forward(request, response);
		}else {
			out.print("<script>alert('등록이 실패하였습니다 다시 시도해주세요'); history.back(); </script>");
		}
		
	}

}
