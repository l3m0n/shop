package admin_db;

import comm.dbconn;
import java.sql.*;
import javabean.adminBean;

public class login {
		Connection conn = null;
		
		public login(){
			conn = dbconn.getConnection();
		}
		
		public adminBean getLogin(){
			adminBean admin = new adminBean();
			try{
				Statement stmt = conn.createStatement();
				ResultSet res = stmt.executeQuery("select * from admin");
				if(res.next()){
					admin.setUsername(res.getString("name"));
					admin.setPassword(res.getString("pass"));
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			return admin;
		}
		
}
