package comm;

import java.sql.Connection;
import java.sql.DriverManager;


public class dbconn {
	static Connection conn = null;
	static String driverClass = "com.mysql.jdbc.Driver";
	static String url="jdbc:mysql://10.211.55.3:3306/shopping?useUnicode=true&characterEncoding=UTF8";
	static String username = "root";
	static String password = "root";
	
	public static Connection getConnection(){
		if(conn!=null){
			return conn;
		}else{
			try{
				//加载驱动
				Class.forName(driverClass);
				Connection res = DriverManager.getConnection(url, username, password);
				return res;
			}catch(Exception e){
				System.out.println("Db Error:"+e.getMessage());
				return null;
			}
		}
	}
	
	public void close(){
		try {
			if (conn != null)
				conn.close();
		} catch (Exception ex) {
		}
	}
		
}
	
	
