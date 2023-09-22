package net.hb.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;


import java.net.URLEncoder;
import java.io.File;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.hb.store.*;
import net.hb.user.*;
import net.hb.post.*;

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
	protected int userId=0, postId=0, postGrade=0;
	protected String storeName="", postImg="", postText="";
	protected Date postdate;
	
	protected int storeId = 0;
	protected int lat=0;
	protected int lng=0;
	
	protected StoreVO svo = new StoreVO();
	protected PostVO pvo = new PostVO();
	protected CustomerVO cvo = new CustomerVO();
	
	
}
