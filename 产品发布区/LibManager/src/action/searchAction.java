package action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import util.DBUtils;


import bean.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class searchAction extends ActionSupport{
	
	private String identity;
	private String username;	
	
	public String getIdentity(){
		return identity;
	}
	public void setIdentity(String identity){
		this.identity=identity;
	}
	public String getUsername(){
		return username;
	}
	public void setUsername(String username){
		this.username=username;
	}
	
	public String execute() throws Exception{
		HttpServletRequest request=(HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		
		
			User user=new User();
			
			
			// Get Admin'Username;
			//User userInfo(String username);找出与用户名相同的用户所有信息
			user=DBUtils.getUserBynameAndIden(username, identity);
			
			if(user==null){
				return "fail";
			}
			if(identity.equals("Admin")||identity.equals("Teacher")||identity.equals("Student")||identity.equals("OtherPeople"))
			{
				
				request.getSession().setAttribute("User2", user);
				
				return SUCCESS;
			}else{
				return "fail";
			}
		
		
	}
}
