package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import util.DBUtils;

import bean.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class MenuAction extends ActionSupport{
	private String select;

	public String getSelect() {
		return select;
	}

	public void setSelect(String select) {
		this.select = select;
	}
	
	public String execute() throws Exception{
		HttpServletRequest request=(HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		User user = new User();
		user = (User) request.getSession().getAttribute("User");
		List<String> bookNameList = new ArrayList<String>();
		// 数据库操作 bookNameList = DAO中所有图书的名字。
		   bookNameList=DBUtils.getAllBookName();
		
		request.getSession().setAttribute("bookNameList", bookNameList);
		//System.out.println(user.getId());
		if(select.equals("userManage")){
			return "userManage_Manager";
		}else if(select.equals("bookManage")){
			if(user.getIdentity().equals("Admin")){
				return "bookManage_Manager";
			}else {
				return "bookManage_NormalUser";
			}
		}else {
			return null;
		}
	}
}
