package admin_db;

import comm.dbconn;

import java.sql.*;
import java.util.*;
import javabean.categoryBean;


public class category {
	Connection conn = null;
	
	public category(){
		conn = dbconn.getConnection();
	}
	
	/*
	 * 返回所有商品类型
	 */
	public List<categoryBean> get_category(){
		List<categoryBean> Allcategory = new ArrayList<categoryBean>();
		try{
			Statement stmt = conn.createStatement();
			ResultSet res = stmt.executeQuery("select * from goods_category order by category_id");
			while(res.next()){
				categoryBean category = new categoryBean();
				category.setCategory_id(res.getInt("category_id"));
				category.setName(res.getString("name"));
				Allcategory.add(category);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return Allcategory;
	}
	
	/*
	 * 添加商品类型
	 */
	public void add_category(categoryBean category){
		try{
			PreparedStatement pStmt = conn.prepareStatement("insert into goods_category (`name`) values (?) ");
			pStmt.setString(1, category.getName());;
			pStmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	/*
	 * 删除商品类型
	 */
	public void del_category(String category_id){
		try{
			PreparedStatement pStmt = conn.prepareStatement("delete from goods_category where category_id=?");
			pStmt.setString(1, category_id);
			pStmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
}
