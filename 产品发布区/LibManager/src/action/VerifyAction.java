package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.Session;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import util.DBUtils;

import bean.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;



public class VerifyAction extends ActionSupport implements SessionAware{
	
	private Map<String,Object> session;
	private String password;
	private String newPassword;
	private String validatePassword;
	private String username;
	public String verifyPassword(){
		System.out.println(password);
		PrintWriter out=getWriter();
		User user=(User)session.get("User");
		//从session获取用户
		
		
		
		user=DBUtils.getUser(user.getUsername());
		
		if(password.equals(user.getPassword())){
			out.print(2);
			return null;
		}else{
			out.print(1);
			return null;
		}
		
	}
	public String verifyModifyPassword(){
		User user=new User();
		
		 user=DBUtils.getUser(((User)session.get("User")).getUsername());
		if(password.equals(user.getPassword())){
			if(newPassword.equals(validatePassword)){
				return SUCCESS;
			}else{
				return "Failed";
			}
		}else{
			return "Failed";
		}
		
	}
	public String nameVerify(){
		PrintWriter out=getWriter();
		System.out.println(username);
		Boolean has=false;
		
		has=DBUtils.IsExist(username);
		if(has){
			out.print(1);
			return null;
		}else{
			out.print(2);
			return null;
		}
		
	}
	private PrintWriter getWriter(){
		ServletResponse res=ServletActionContext.getResponse();
		try {
			return res.getWriter();
		} catch (IOException e) {
		
			e.printStackTrace();
		}
		return null;
		
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public String getValidatePassword() {
		return validatePassword;
	}
	public void setValidatePassword(String validatePassword) {
		this.validatePassword = validatePassword;
	}
	public String getUsername(){
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Override
	public void setSession(Map<String, Object> arg0) {
		session=arg0;
		
	}
	
}
