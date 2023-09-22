package net.hb.user;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import net.hb.common.DB;
import net.hb.common.Global;

public class CustomerDAO extends Global{

	public CustomerDAO() {
		CN = DB.getConnection();
	}
	
	public boolean idCheck(int userId){
		try {
		 msg = "select * from yjuser where userid = ? ";	
		 PST = CN.prepareStatement(msg);
		 PST.setInt(1, userId);
		 RS = PST.executeQuery();
		 if (RS.next()) {
			return true;
		 }else {
			return false;
		 }
		}catch(Exception ex) { }
	return false;
	}//end
	
	public String userJoin(int userId, int userPwd, String userName, String userNick, String userProfile) {
		String successJoin = "";
		try {
			msg = "insert into yjuser values (?,?,?,?,?)";
			PST = CN.prepareStatement(msg);
			PST.setInt(1, userId);
			PST.setInt(2, userPwd);
			PST.setString(3, userName);
			PST.setString(4, userNick);
			PST.setString(5, userProfile);
			int OK = PST.executeUpdate();
			if (OK>0) {
				successJoin = "회원가입 성공";
				return successJoin;
			}else {
				successJoin = "회원가입 실패";
				return successJoin;
			}
		}catch(Exception e) {System.out.println("error userJoin 메서드");}
		return successJoin;
	}//end
	
	public boolean Login(int user_id, int user_pwd){
		try {
		 msg = "select * from yjuser where userid = ? and userpwd = ? " ;	
		 PST = CN.prepareStatement(msg);
		 PST.setInt(1, user_id);
		 PST.setInt(2, user_pwd);
		 RS = PST.executeQuery();
		 if (RS.next()) {
			return true;
		 }else {
			return false;
		 }
		}catch(Exception ex) { }
	return false;
	}//end
	
	public boolean UserDelete(int user_id, int user_pwd) {
		try {
			msg="delete from yjuser where userid = ? and userpwd = ? " ;
			PST = CN.prepareStatement(msg);
			  PST.setInt(1, user_id);
			  PST.setInt(2, user_pwd);
			  RS = PST.executeQuery();
			if (RS.next()) {
				return true;
			}else{return false;}
		} catch (Exception ex) {}
	return false;
	}//end
	
	
	public int userUpdate(int n_id, int n_pwd, String n_name,String n_nick) {
	      try {
	         msg = "update yjuser set userpwd=?, username=?, usernick=? where userid=" + n_id;
	         PST = CN.prepareStatement(msg);
	              PST.setInt(1, n_pwd);
	              PST.setString(2, n_name);
	              PST.setString(3, n_nick);
	             
	         int OK = PST.executeUpdate();

	      }catch(Exception ex) { }
    return 0;
  }//end'
	
	public String userProfile(int id) {
		try {
			msg = "select userprofile from yjuser where userid = ?";
			PST = CN.prepareStatement(msg);
			PST.setInt(1, id);
			RS = PST.executeQuery();
			if(RS.next()) {
				return RS.getString("userprofile");
			}
		}catch(Exception ex){}
		return "";
	}
	
	public String userId(int id) {
		try {
			msg = "select userid from yjuser where userid = ?";
			PST = CN.prepareStatement(msg);
			PST.setInt(1, id);
			RS = PST.executeQuery();
			if(RS.next()) {
				return RS.getString("userid");
			}
		}catch(Exception ex){}
		return "";
	}
	
	public String userNick(int id) {
		try {
			msg = "select usernick from yjuser where userid = ?";
			PST = CN.prepareStatement(msg);
			PST.setInt(1, id);
			RS = PST.executeQuery();
			if(RS.next()) {
				return RS.getString("usernick");
			}
		}catch(Exception ex){}
		return "";
	}
	
	public boolean msgSendSave(int sendId, int receiveId, String msgCont) {
		try {
			msg = "insert into yjdirectmsg values(yjmsgseq.nextval,?,?,?,sysdate,null)";
			PST = CN.prepareStatement(msg);
			PST.setInt(1, sendId);
			PST.setInt(2, receiveId);
			PST.setString(3, msgCont);
			int OK = PST.executeUpdate();
			if(OK >0) {
				return true;
			}else {
				return false;
			}
		}catch(Exception ex) {System.out.println("error msgSendSave");}
		return false;				
	}
	public List<CustomerVO> alluser(){
		List<CustomerVO> list = new ArrayList<>();
		try {
			msg = "select userid from yjuser";
			PST = CN.prepareStatement(msg);
			RS = PST.executeQuery();
			while(RS.next()) {
				CustomerVO vo = new CustomerVO();
				vo.setId(RS.getInt("userid"));
				list.add(vo);
			}
		}catch(Exception ex) {}
		return list;
	}
	
	
}