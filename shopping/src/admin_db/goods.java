package admin_db;


import java.sql.*;
import java.sql.Date;
import java.util.*;

import comm.dbconn;
import javabean.goodsBean;

public class goods {
	Connection conn = null;
	
	public goods(){
		conn = dbconn.getConnection();
	}
	
	/*
	 * 添加商品
	 */
	public void add_goods(goodsBean goods){
		try{
			PreparedStatement pStmt = conn.prepareStatement("insert into goods (`name`,`price`,`quantity`,`description`,`imagePath`,`add_time`,`category_id`) values (?,?,?,?,?,?,?) ");
			pStmt.setString(1, goods.getName());
			pStmt.setLong(2, (long) goods.getPrice());
			pStmt.setLong(3, goods.getQuantity());
			pStmt.setString(4, goods.getDescription());
			pStmt.setString(5, goods.getImagePath());
			pStmt.setDate(6, new Date(goods.getAdd_time().getTime()));
			pStmt.setLong(7, goods.getCategory_id());
			pStmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	/*
	 * 查询所有商品
	 */
	public List<goodsBean> getAll_goods(){
		List<goodsBean> Allgoods = new ArrayList<goodsBean>();
		try{
			Statement stmt = conn.createStatement();
			ResultSet res = stmt.executeQuery("select * from goods order by goods_id desc");
			while(res.next()){
				goodsBean goods = new goodsBean();
				goods.setAdd_time(res.getDate("add_time"));
				goods.setCategory_id(res.getInt("category_id"));
				goods.setDescription(res.getString("description"));
				goods.setGoods_id(res.getInt("goods_id"));
				goods.setImagePath(res.getString("imagePath"));
				goods.setName(res.getNString("name"));
				goods.setPrice(res.getFloat("price"));
				goods.setQuantity(res.getInt("quantity"));
				Allgoods.add(goods);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return Allgoods;
	}
	
	/*
	 * 修改商品
	 */
	
	public void update_goods(goodsBean goods){
		try{
			PreparedStatement pStmt = conn.prepareStatement("update goods set name=?, price=?, quantity=?, description=?, imagePath=?, add_time=?, category_id=? where goods_id=?");
			pStmt.setString(1, goods.getName());
			pStmt.setLong(2, (long) goods.getPrice());
			pStmt.setLong(3, goods.getQuantity());
			pStmt.setString(4, goods.getDescription());
			pStmt.setString(5, goods.getImagePath());
			pStmt.setDate(6, new Date(goods.getAdd_time().getTime()));
			pStmt.setLong(7, goods.getCategory_id());
			pStmt.setInt(8, goods.getGoods_id());
			pStmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
		
	}
	
	/*
	 * 查看商品某一条数据
	 */
	public goodsBean get_goods(String goods_id){
		goodsBean goods = new goodsBean();
		try{
			PreparedStatement pStmt = conn.prepareStatement("select * from goods where goods_id=?");
			pStmt.setString(1, goods_id);
			ResultSet res = pStmt.executeQuery();
			if(res.next()){
				goods.setAdd_time(res.getDate("add_time"));
				goods.setCategory_id(res.getInt("category_id"));
				goods.setDescription(res.getString("description"));
				goods.setGoods_id(res.getInt("goods_id"));
				goods.setImagePath(res.getString("imagePath"));
				goods.setName(res.getNString("name"));
				goods.setPrice(res.getFloat("price"));
				goods.setQuantity(res.getInt("quantity"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return goods;
	}
	
	/*
	 * 限制数量查询
	 */
	public List<goodsBean> getSome_goods(int limit){
		List<goodsBean> Allgoods = new ArrayList<goodsBean>();
		try{
			PreparedStatement pStmt = conn.prepareStatement("select * from goods order by goods_id desc limit 0,?");
			pStmt.setInt(1, limit);
			ResultSet res = pStmt.executeQuery();
			while(res.next()){
				goodsBean goods = new goodsBean();
				goods.setAdd_time(res.getDate("add_time"));
				goods.setCategory_id(res.getInt("category_id"));
				goods.setDescription(res.getString("description"));
				goods.setGoods_id(res.getInt("goods_id"));
				goods.setImagePath(res.getString("imagePath"));
				goods.setName(res.getNString("name"));
				goods.setPrice(res.getFloat("price"));
				goods.setQuantity(res.getInt("quantity"));
				Allgoods.add(goods);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return Allgoods;
	}
	
	/*
	 * 删除商品
	 */
	public void del_goods(String goods_id){
		try{
			PreparedStatement pStmt = conn.prepareStatement("delete from goods where goods_id=?");
			pStmt.setString(1, goods_id);
			pStmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	/*
	 * 分类型的商品
	 */
	public List<goodsBean> getType_goods(String category_id){
		List<goodsBean> Typegoods = new ArrayList<goodsBean>();
		try{
			PreparedStatement pStmt = conn.prepareStatement("select * from goods where category_id=? order by goods_id desc");
			pStmt.setString(1, category_id);
			ResultSet res = pStmt.executeQuery();
			while(res.next()){
				goodsBean goods = new goodsBean();
				goods.setAdd_time(res.getDate("add_time"));
				goods.setCategory_id(res.getInt("category_id"));
				goods.setDescription(res.getString("description"));
				goods.setGoods_id(res.getInt("goods_id"));
				goods.setImagePath(res.getString("imagePath"));
				goods.setName(res.getNString("name"));
				goods.setPrice(res.getFloat("price"));
				goods.setQuantity(res.getInt("quantity"));
				Typegoods.add(goods);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return Typegoods;
	}
}
