package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import util.DBUtils;

import bean.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport{
	private String username;
	private String password;
	private String identity;

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	
	public String execute() throws Exception{
		//System.out.println(id);
		HttpServletRequest request=(HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		String action=request.getParameter("action");
		// if action is register
		if(action!=null&&action.equals("register")){
			return "register";
		}
		else if(action!=null&&action.equals("saveUser")){
				//save user information 
			SaveInfo(request);	
		
			return "login";
		}
		else{
			User user = new User();
			user.setIdentity(identity);
			user.setUsername(username);
			//in there choice administrator or reader login paper;
			
			request.getSession().setAttribute("User", user);
			
			
			//在此进行DAO操作 注意数据库的比较回结果赋给returnvalue
			Boolean returnvalue = false;//此为数据库匹配返回结果（如果正确为true�?		
			returnvalue=DBUtils.valite(username, password, identity);
			if(returnvalue){
				
				 if(identity.equals("Admin"))
					//管理员  进入用户管理和书本管理
				    return "success";
				 	//区分管理员身份和读者身份
					
				   //普通用户查看   
				   return "menu";

			}
			return "login";
			
		}
		
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getIdentity() {
		return identity;
	}
	public void setIdentity(String identity) {
		this.identity = identity;
	}
	private void SaveInfo(HttpServletRequest requset){
		// save userinfo;
		 String administrator = requset.getParameter("administrator");
		 String password = requset.getParameter("password");
		 String password1 = requset.getParameter("password1");
		 String name = requset.getParameter("name");
		 String number = requset.getParameter("number");
				 
		 String birthday = requset.getParameter("birthday");
		 String college = requset.getParameter("college");
		 String major = requset.getParameter("major");
		 String id = requset.getParameter("id");
		 
		if(password.equals(password1)){
			
			User use = new User();
			use.setUsername(administrator);
			use.setPassword(password);
			use.setName(name);
			use.setId(number);
			use.setBirthday(birthday);
			use.setAddress(college);
			use.setMajor(major);
			use.setIdentity(id);
			//TODO database DAO();insert information(use) to database for Persistence
			DBUtils.insertUserInfo(use);
		}
	}
}
