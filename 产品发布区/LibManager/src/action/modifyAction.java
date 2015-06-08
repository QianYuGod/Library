package action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import util.DBUtils;


import bean.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class modifyAction extends ActionSupport{
	private String operate;
	private String username;		//用户名
	private String password;		//密码
	private String identity;		//身份
	private String name;			//姓名
	private String birthday;		//出生日期
	private String major;			//学生专业(其他身份此为null)
	private String teacherTitle;	//教师职称(其他身份此为null)
	private String id;				//学生学号、教师工号
	private String address;			//学生、教师所在学院，校外人员工作单位
	
	
	public String execute() throws Exception{
		HttpServletRequest request=(HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		User user = new User();
		user=(User) request.getSession().getAttribute("User");
		
		if(operate.equals("modify")){
			request.getSession().setAttribute("User", user);
			return "modify";
		}else if(operate.equals("modify_sure")){
			user.setUsername(username);
			user.setPassword(password);
			user.setBirthday(birthday);
			user.setMajor(major);
			user.setTeacherTitle(teacherTitle);
			user.setIdentity(identity);
			user.setId(id);
			user.setAddress(address);
			// 定义一个接口，void modifyUser(User user),通过name来修改其余所有信息
			DBUtils.modifyUser(user);
			request.getSession().setAttribute("User", user);
			
			return SUCCESS;
		}
		
		
		return null;
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
	public String getIdentity() {
		return identity;
	}
	public void setIdentity(String identity) {
		this.identity = identity;
	}
	public String getTeacherTitle() {
		return teacherTitle;
	}
	public void setTeacherTitle(String teacherTitle) {
		this.teacherTitle = teacherTitle;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}


	public String getOperate() {
		return operate;
	}


	public void setOperate(String operate) {
		this.operate = operate;
	}
	
	
}
