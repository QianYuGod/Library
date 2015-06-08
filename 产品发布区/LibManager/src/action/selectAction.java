package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import util.DBUtils;


import bean.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class selectAction extends ActionSupport{
	HttpServletRequest request=(HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
	
	private String select;
	
	User user=new User();
	
	
	public String execute() throws Exception{
		if(select.equals("userSearch")){
			return "user_search";
		}
		else if(select.equals("userModify")){
			return "user_modify";
		}else if(select.equals("userDelete")){
			List<String> namelist = new ArrayList<String>();
			//TODO 取出人员名字
			//形成一个namelist在userDelete中显示出来。
			
			/*
			namelist.add("A");
			namelist.add("B");
			namelist.add("C");
			*/
			namelist=DBUtils.getnameList();
			request.getSession().setAttribute("Namelist", namelist);
			return "user_delete";
		}else
			return "fail";
	}

	
	public String getSelect() {
		return select;
	}

	public void setSelect(String select) {
		this.select = select;
	}
	
}
