package action;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import util.DBUtils;

import com.opensymphony.xwork2.ActionContext;

import bean.Book;
import bean.Record;
import bean.User;

public class Operate {
	public String operate;
	public HttpServletRequest request=(HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
	public String getOperate() {
		return operate;
	}

	public void setOperate(String operate) {
		this.operate = operate;
	}

	public String execute() throws UnsupportedEncodingException{
		
		
		ArrayList<Book> books=new ArrayList<Book>();
		
		if(operate!=null&&operate.equals("borrow")){
			//获取所有的书本名字，借阅状态；   
			//books 书本所有信息
		
			
			//TODO 通过名字去获取用户借书的本数
			User user=(User)request.getSession().getAttribute("User");
			int number=DBUtils.getNumberBBook(user.getUsername());
			request.setAttribute("BBokkNum", number);
			
			 books=DBUtils.getAllBookInfo();
			//request 获取值
		
			request.setAttribute("bookList", books);
			
			return "borrow";
		}else if(operate!=null&&operate.equals("return")){
			User user=(User)request.getSession().getAttribute("User");
			// 通过名字查找所有借书的记录
			//@param name  借书人名字
			//return     借书记录
			//TODO
			
			List<String> records=new ArrayList<String>();
			records=DBUtils.getReturnBook(user.getUsername());
			request.setAttribute("records", records);
			return "return";
		}
		else if(operate!=null&&operate.equals("change")){
			
			Record record=CreateRecord("borrow");
			// 借书改变书本借阅状态更改state并生成一条record存入数据库
			//@param String bookname 书本名
			 DBUtils.saveRecord(record);
			
			
			return "success";
		}
		else if(operate!=null&&operate.equals("change2")){
			
			Record record=CreateRecord("return");
			
			// 改变书本借阅状态并生成一条record存于数据库
			//@param String bookname 书本名
			DBUtils.saveRecord(record);
			
			
			return "success2";
		}
		return "";
	}
	//生成一条借还书记录，传入的参数的借书状态还是还书状态
	private Record CreateRecord(String state) throws UnsupportedEncodingException{
		Record record=new Record();
		String bookName=new String(request.getParameter("bookName").getBytes("ISO-8859-1"),"UTF-8");
	
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式	
		record.setTime(df.format(new Date()));
		record.setBookName(bookName);
		record.setState(state);
		User user=(User)request.getSession().getAttribute("User");
		record.setUsername(user.getUsername());
		return record;
	}
}
