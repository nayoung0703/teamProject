package net.hb.store;

import net.hb.common.DB;
import net.hb.common.Global;
import java.util.List;
import java.util.ArrayList;

public class StoreDAO extends Global{
	
	public StoreDAO() {
		try {
			CN=DB.getConnection();
		}
		catch(Exception ex) { }
	}//GuestDAO constructor
	public boolean storeIdCheck(String storeName, String lat, String lng) {
		try {
			msg ="select * from yjstore where storeName=? and lati =? and longi=?";
			PST = CN.prepareStatement(msg);
			PST.setString(1, storeName);
			PST.setString(2, lat);
			PST.setString(3, lng);
			RS = PST.executeQuery();
			if(RS.next()) {
				return true;
			}else {
				return storeRegistration(storeName, lat,lng);
			}
		}catch(Exception e) {return false;}
	}
	
	
	public boolean storeRegistration(String storeName, String lat, String lng) {
		try {
			msg = "insert into yjstore values (yjstoreseq.nextval,?,?,?)";
			PST = CN.prepareStatement(msg);
			PST.setString(1, storeName);
			PST.setString(2, lat);
			PST.setString(3, lng);
			int OK = PST.executeUpdate();
			if (OK>0) {
				return true;
			}else {
				return false;
			}
		}catch(Exception e) {System.out.println("error storeRegistration 메서드");}
		return false;
	}
	
	public StoreVO storeIdGet(String storeName,String lat, String lng) {
		svo = new StoreVO();
		try {
			msg = "select storeid from yjstore where storename=? and lati=? and longi=?";
			PST = CN.prepareStatement(msg);
			PST.setString(1, storeName);
			PST.setString(2, lat);
			PST.setString(3, lng);
			RS = PST.executeQuery();
			if(RS.next()) {
				svo.setStoreId(RS.getInt("storeid"));
				svo.setStoreName(storeName);
				svo.setLat(lat);
				svo.setLat(lng);
				return svo;
			}return svo;
		}catch(Exception e) {System.out.print("error storeIdGet 매서드");}
		
		return svo;
	}

}
