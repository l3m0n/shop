package javabean;

public class adminBean {
	public String username;
	public String password;
	
	//不定义的话，new对象没有结构体
	public adminBean(){
	}
	
	public adminBean(String username, String password){
		this.username = username;
		this.password = password;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
