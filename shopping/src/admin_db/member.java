package admin_db;

import comm.dbconn;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javabean.goodsBean;
import javabean.memberBean;

public class member {
	Connection conn = null;
	
	public member(){
		conn = dbconn.getConnection();
	}
	
	/*
	 * 用户注册
	 */
	public void register(memberBean member){
		try{
			PreparedStatement pStmt = conn.prepareStatement("insert into member (`realname`,`name`,`pass`,`tel`,`homesite`) values (?,?,?,?,?) ");
			pStmt.setString(1, member.getRealname());
			pStmt.setString(2, member.getName());
			pStmt.setString(3, member.getPass());
			pStmt.setString(4, member.getTel());
			pStmt.setString(5, member.getHomesite());
			pStmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	/*
	 * 查询用户信息
	 */
	public memberBean get_userInfo(String name){
		memberBean member = new memberBean();
		try{
			PreparedStatement pStmt = conn.prepareStatement("select * from member where name=?");
			pStmt.setString(1, name);
			ResultSet res = pStmt.executeQuery();
			if(res.next()){
				member.setUid(res.getInt("uid"));
				member.setRealname(res.getString("realname"));
				member.setName(res.getString("name"));
				member.setPass(res.getString("pass"));
				member.setTel(res.getString("tel"));
				member.setHomesite(res.getString("homesite"));
				member.setMoney(res.getFloat("money"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return member;
	}
	/*
	 * 获取所有用户信息
	 */
	public List<memberBean> getAll_member(){
		List<memberBean> Allmember = new ArrayList<memberBean>();
		try{
			Statement stmt = conn.createStatement();
			ResultSet res = stmt.executeQuery("select * from member order by uid desc");
			while(res.next()){
				memberBean member = new memberBean();
				member.setUid(res.getInt("uid"));
				member.setHomesite(res.getString("homesite"));
				member.setMoney(res.getFloat("money"));
				member.setName(res.getString("name"));
				member.setRealname(res.getString("realname"));
				member.setTel(res.getString("tel"));
				Allmember.add(member);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return Allmember;
	}
	/*
	 * 删除用户
	 */
	public void del_member(String uid){
		try{
			PreparedStatement pStmt = conn.prepareStatement("delete from member where uid=?");
			pStmt.setString(1, uid);
			pStmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	/*
	 * 更新用户
	 */
	public void update_memebr(memberBean member){
		try{
			PreparedStatement pStmt = conn.prepareStatement("update member set realname=?, name=?, pass=?, tel=?, homesite=?, money=? where uid=?");
			pStmt.setString(1, member.getRealname());
			pStmt.setString(2, member.getName());
			pStmt.setString(3, member.getPass());
			pStmt.setString(4, member.getTel());
			pStmt.setString(5, member.getHomesite());
			pStmt.setFloat(6, member.getMoney());
			pStmt.setInt(7, member.getUid());
			pStmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
		
	}
	/*
	 * 查询某某一用户
	 */
	public memberBean get_member(String uid){
		memberBean member = new memberBean();
		try{
			PreparedStatement pStmt = conn.prepareStatement("select * from member where uid=?");
			pStmt.setString(1, uid);
			ResultSet res = pStmt.executeQuery();
			if(res.next()){
				member.setHomesite(res.getNString("homesite"));
				member.setMoney(res.getFloat("money"));
				member.setName(res.getString("name"));
				member.setPass(res.getString("pass"));
				member.setRealname(res.getString("realname"));
				member.setTel(res.getString("tel"));
				member.setUid(res.getInt("uid"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return member;
	}
}
