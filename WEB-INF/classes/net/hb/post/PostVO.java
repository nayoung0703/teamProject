package net.hb.post;

public class PostVO {
	 int userId=0, postId=0, postGrade=0;
	 String storeName="", postImg="", postText="";
	 java.util.Date postdate;
	 String fileName="";

	 int Rdata;
	 int Rnum, postid, userid;
	 String Rcontent = "" ;
	 java.util.Date Rdate;
	 
	 
	public java.util.Date getRdate() {
		return Rdate;
	}
	public void setRdate(java.util.Date rdate) {
		Rdate = rdate;
	}
	public int getRdata() {
		return Rdata;
	}
	public void setRdata(int rdata) {
		Rdata = rdata;
	}
	public int getRnum() {
		return Rnum;
	}
	public void setRnum(int rnum) {
		Rnum = rnum;
	}
	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getRcontent() {
		return Rcontent;
	}
	public void setRcontent(String rcontent) {
		Rcontent = rcontent;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	
	public int getPostGrade() {
		return postGrade;
	}
	public void setPostGrade(int postGrade) {
		this.postGrade = postGrade;
	}
	
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	
	public String getPostImg() {
		return postImg;
	}
	public void setPostImg(String postImg) {
		this.postImg = postImg;
	}
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public String getPostText() {
		return postText;
	}
	public void setPostText(String postText) {
		this.postText = postText;
	}
	
	public java.util.Date getPostdate() {
		return postdate;
	}
	public void setPostdate(java.util.Date postdate) {
		this.postdate = postdate;
	}
}
