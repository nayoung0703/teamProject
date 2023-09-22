package file;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;


import java.net.URLEncoder;
import java.io.File;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;
import java.util.Enumeration;
import java.io.FileInputStream;
import java.io.OutputStream;

public class Global {
	protected Connection CN = null;
	protected Statement ST = null;
	protected PreparedStatement PST = null;
	protected ResultSet RS = null ;
	protected String msg = "";
	protected boolean falg = false;
	
	protected int user_id = 0 , user_pwd = 0;	
}
