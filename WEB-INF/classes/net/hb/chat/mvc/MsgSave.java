package net.hb.chat.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.io.FileWriter;
import java.io.FileReader;
import java.io.IOException;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.hb.chat.*;

@WebServlet("/MsgSave.dd")
public class MsgSave extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}
	
	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		int sendId  = Integer.parseInt(request.getParameter("sendId"));
		int receiveId  = Integer.parseInt(request.getParameter("receiveId"));
		String msgCont = request.getParameter("msgCont");
		
		ChatDAO cdao = new ChatDAO();
		Gson gson = new Gson();
		ArrayList<ChatVO> chatList = new ArrayList<ChatVO>();
		
		chatList = cdao.jsonToList();
		
		ArrayList<MessagesVO> messages = cdao.messageSave(receiveId, msgCont);
		ArrayList<ChatVO> chattings = cdao.chatSave(chatList,sendId, messages);
				
		try {
			// customer.json를 경로 지정하여 저장하기 \\\\192.168.0.83\\공통프로그램(송주환)\\chatdata\\chat.json
			FileWriter fw = new FileWriter("\\\\192.168.0.83\\공통프로그램(송주환)\\chatdata\\chat.json");
			
			// ArrayList 형태의 CustomerLists -> json 문자열로 변환
			gson.toJson(chattings,fw);
			
			// 덮어씌우기 아마도?
			fw.flush();
			fw.close();
		}catch(IOException e) {e.printStackTrace();}
		
		
		response.sendRedirect("directmessage.jsp");
	
	}

}
