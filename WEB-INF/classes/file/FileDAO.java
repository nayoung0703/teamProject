package file;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class FileDAO {
	
	private Connection CN;
	private PreparedStatement PST;
	
	public FileDAO(){
		CN = FileDAO.getConnection();
	}
	
	public static Connection getConnection() {
		Connection CN=null;
		 try{ 
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
			CN=DriverManager.getConnection(url,"system", "1234");
			System.out.println("------ db connect success 23-07-18 ------ ");
		 }catch(Exception ex){System.out.println("db error :"+ex);}
		 return CN;
	 }//end
	
	public int upload(int id, String fileSystemName) {
		
		PreparedStatement PST = null;
		try {
			String SQL = "update yjuser set userprofile=? where userid = ?";
			PST = CN.prepareStatement(SQL);
			PST.setString(1, fileSystemName);
			PST.setInt(2, id);
			return PST.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
}
