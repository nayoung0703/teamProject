package net.hb.chat;

import java.util.List;

public class ChatVO {
	private int sendId; 
	private List<MessagesVO> messages;
	
	public int getSendId() {
		return sendId;
	}
	public void setSendId(int sendId) {
		this.sendId = sendId;
	}
	public List<MessagesVO> getMessages() {
		return messages;
	}
	public void setMessages(List<MessagesVO> messages) {
		this.messages = messages;
	}
}
