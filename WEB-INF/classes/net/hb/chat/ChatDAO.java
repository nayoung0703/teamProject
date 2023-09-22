package net.hb.chat;

import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;

public class ChatDAO {

	public ArrayList<MessagesVO> messageSave(int receiveId, String textContent) {
		ArrayList<MessagesVO> messages = new ArrayList<>();
		MessagesVO mvo = new MessagesVO();
		mvo.setReceiveId(receiveId);
		mvo.setTextContent(textContent);
		messages.add(mvo);
		return messages;
	}
	
	public ArrayList<ChatVO> chatSave(ArrayList<ChatVO> chattings,int sendId, ArrayList<MessagesVO> messages) {
		ChatVO cvo = new ChatVO();
		cvo.setSendId(sendId);
		cvo.setMessages(messages);
		chattings.add(cvo);
		return chattings;
	}
	
	public ArrayList<ChatVO> jsonToList(){
		Gson gson = new Gson();
		ArrayList<ChatVO> chatList = new ArrayList<ChatVO>();
		
		try {
			// "경로\\파일명.json" 에 있는 json 형식 파일 불러오기
			FileReader reader = new FileReader("\\\\192.168.0.83\\공통프로그램(송주환)\\chatdata\\chat.json");
			
			// JsonArray로 ArrayList 형태로 저장된 Json 문자열 불러오기
			JsonArray obj = gson.fromJson(reader, JsonArray.class);
			
			// Json 문자열 -> ArrayList 형태로 불러오기
			//<Customer> : 입력받는 전역변수 id, pwd, name의 getter setter 클래스 
			ArrayList<ChatVO> list = gson.fromJson(obj, new TypeToken<ArrayList<ChatVO>>(){}.getType());
			
			//미리 선언한 CustomerLists에 list로 저장 
			chatList = list;
				
		}catch (IOException e) {e.printStackTrace();}
		
		return chatList;
	}
	
	

}
