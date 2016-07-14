package admin_db;

import java.sql.*;
import java.sql.Date;
import java.util.*;

import comm.dbconn;
import javabean.goodsBean;
import javabean.orderBean;

public class order {
	Connection conn = null;
	
	public order(){
		conn = dbconn.getConnection();
	}
	/*
	 * 添加订单
	 */
	public void add_order(orderBean order){
		try{
			PreparedStatement pStmt = conn.prepareStatement("insert into orders (`goods_id`,`order_date`,`processed`,`buy_quantity`,`price`,`name` ) values (?,?,'1',?,?,?) ");
			pStmt.setInt(1, order.getGoods_id());
			pStmt.setDate(2, new Date(order.getOrder_date().getTime()));
			pStmt.setInt(3, order.getBuy_quantity());
			pStmt.setFloat(4, order.getPrice());
			pStmt.setString(5, order.getName());
			pStmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	/*
	 * 查询某人订单
	 */
	public List<orderBean> getMember_order(String memberUser){
		List<orderBean> memberOrder = new ArrayList<orderBean>();
		try{
			PreparedStatement pStmt = conn.prepareStatement("select * from `orders` where name=? order by order_id desc");
			pStmt.setString(1, memberUser);
			ResultSet res = pStmt.executeQuery();
			while(res.next()){
				orderBean order = new orderBean();
				order.setBuy_quantity(res.getInt("buy_quantity"));
				order.setGoods_id(res.getInt("goods_id"));
				order.setName(res.getString("name"));
				order.setOrder_date(res.getDate("order_date"));
				order.setOrder_id(res.getInt("order_id"));
				order.setPrice(res.getFloat("price"));
				order.setProcessed(res.getString("processed"));
				memberOrder.add(order);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return memberOrder;
	}
	/*
	 * 列出所有订单
	 */
	public List<orderBean> getAll_order(){
		List<orderBean> Allorder = new ArrayList<orderBean>();
		try{
			Statement stmt = conn.createStatement();
			ResultSet res = stmt.executeQuery("select * from `orders` order by order_id desc");
			while(res.next()){
				orderBean order = new orderBean();
				order.setBuy_quantity(res.getInt("buy_quantity"));
				order.setGoods_id(res.getInt("goods_id"));
				order.setName(res.getString("name"));
				order.setOrder_date(res.getDate("order_date"));
				order.setOrder_id(res.getInt("order_id"));
				order.setPrice(res.getFloat("price"));
				order.setProcessed(res.getString("processed"));
				Allorder.add(order);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return Allorder;
	}
	
	/*
	 * 订单删除
	 */
	public void del_order(String order_id){
		try{
			PreparedStatement pStmt = conn.prepareStatement("delete from `orders` where order_id=?");
			pStmt.setString(1, order_id);
			pStmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	/*
	 * 订单处理
	 */
	public void do_order(String order_id){
		try{
			PreparedStatement pStmt = conn.prepareStatement("update `orders` set `processed`='2' where order_id=?");
			pStmt.setString(1, order_id);
			pStmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
		
	}
	/*
	 * 查询一条订单数据
	 */
	public orderBean get_order(String order_id){
		orderBean order = new orderBean();
		try{
			PreparedStatement pStmt = conn.prepareStatement("select * from `orders` where order_id=?");
			pStmt.setString(1, order_id);
			ResultSet res = pStmt.executeQuery();
			if(res.next()){
				order.setBuy_quantity(res.getInt("buy_quantity"));
				order.setGoods_id(res.getInt("goods_id"));
				order.setName(res.getString("name"));
				order.setOrder_date(res.getDate("order_date"));
				order.setOrder_id(res.getInt("order_id"));
				order.setPrice(res.getFloat("price"));
				order.setProcessed(res.getString("processed"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return order;
	}
	/*
	 * 用户money减少
	 */
	public void d_money(float money,String user){
		try{
			PreparedStatement pStmt = conn.prepareStatement("UPDATE `member` SET `money`=((select a from (select (select money from member where name =?)a)b)-?) where name=?");
			pStmt.setString(1, user);
			pStmt.setFloat(2, money);
			pStmt.setString(3, user);
			pStmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
}
