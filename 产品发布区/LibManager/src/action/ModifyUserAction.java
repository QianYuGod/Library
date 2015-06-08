package action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import org.apache.catalina.Session;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import util.DBUtils;

import bean.Record;
import bean.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;



public class ModifyUserAction extends ActionSupport implements SessionAware{
	private String username;
	private Map<String ,Object> session;
	private String age;
	private String password;
	private String birthday;
	private String address;
	
	
	public String modifyPassword(){
		//数据库修改密码
		System.out.println("passwordSuccess"+password);
		//修改密码，String username ,String password
		//    return 
		User user=(User)session.get("User");
		DBUtils.modifyUserPassword(user.getUsername(),password);
		
		return SUCCESS;
		
	}
	public String toModifyPassword(){
		return SUCCESS;
	}
	public String modifyName(){
		Boolean has=false;
		// 用户是否存在   String username 用户名
		//如果存在，输出真，否则输出假
		HttpServletRequest request=(HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
	    User user=(User)request.getSession().getAttribute("User");
	    
		has=DBUtils.IsExist(username);
		if(!has){
			//  修改数据库中的UserName
			// @param String username 修改后的名字 ,String user 实际的名字
			System.out.println("ModifyNamesuccess"+username);
			DBUtils.modifyUsername(user.getUsername(),username);
			return SUCCESS;
		}else{
			return "failed";
		}
		
	}
	public String toModifyName(){
		User user=new User();
		//DBUtils.getUser(Session.get("User"));
		//User user=DBUtils.getUser("bob");
		HttpServletRequest request=(HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
	     user=(User)request.getSession().getAttribute("User");
	     String username=user.getUsername();
		//TODO  获取用户的所有信息
		
		 User user2=DBUtils.getUser(username);
		
		
		ServletActionContext.getRequest().setAttribute("username", user2.getUsername());
		return SUCCESS;
	}
	public String toEditInfo(){
		HttpServletRequest request=(HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
	     User user3=(User)request.getSession().getAttribute("User");
		User user=new User();
		 user=DBUtils.getUser(user3.getUsername());
		 //隐藏密码
		 user.setPassword("");
		ServletActionContext.getRequest().setAttribute("user", user);
		return SUCCESS;
	}
	public String editInfo(){
		System.out.println(age);
		if(birthday.equals("")||address.equals("")){
			return "Failed";
		}else{
			System.out.println("SuccessEditInfo"+birthday+address);
			//修改生日和地址
		  User user=(User)session.get("User");
		  
			DBUtils.UpdateAgeAndAddress(user.getUsername(),birthday, address);
			return SUCCESS;
		}
		
	}
	public String borrowReturn(){
		List<Record> records=new ArrayList<Record>();
		
		
		HttpServletRequest request=(HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
	     User user=(User)request.getSession().getAttribute("User");
		  //TODO获取借书的所有信息
	     records=DBUtils.getAllRecord(user.getUsername());
	     
		ServletActionContext.getRequest().setAttribute("records",records );
		return SUCCESS;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public void setSession(Map<String, Object> arg0) {
		session=arg0;
		
	}
	
}
