package action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import util.DBUtils;


import bean.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class deleteAction extends ActionSupport{
	
	public String execute() throws Exception{
		HttpServletRequest request=(HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		User user = new User();
		user=(User) request.getSession().getAttribute("User2");
		String name=user.getUsername();
		//�û���Ϣɾ���������û�����
		//����һ���ӿڣ�void Dbutil.delteUserInfo(String name);
		DBUtils.deleteUserInfo(name);
		return SUCCESS;
	}
}
