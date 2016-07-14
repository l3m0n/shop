package javabean;

import java.util.Date;

public class goodsBean {
	private int goods_id;
	private float price;
	private int quantity;
	private String description;
	private String name;
	private String imagePath;
	private Date add_time;
	private int category_id;
	
	public goodsBean(){
	}
	
	public goodsBean(int goods_id, float price, int quantity, String description, String name, String imagePath, Date add_time, int category_id){
		this.goods_id = goods_id;
		this.price = price;
		this.quantity = quantity;
		this.description = description;
		this.name = name;
		this.imagePath = imagePath;
		this.add_time = add_time;
		this.category_id = category_id;
	}
	
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public Date getAdd_time() {
		return add_time;
	}
	public void setAdd_time(Date add_time) {
		this.add_time = add_time;
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	
}
