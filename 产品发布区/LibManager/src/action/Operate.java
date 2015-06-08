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
			//��ȡ���е��鱾���֣�����״̬��   
			//books �鱾������Ϣ
		
			
			//TODO ͨ������ȥ��ȡ�û�����ı���
			User user=(User)request.getSession().getAttribute("User");
			int number=DBUtils.getNumberBBook(user.getUsername());
			request.setAttribute("BBokkNum", number);
			
			 books=DBUtils.getAllBookInfo();
			//request ��ȡֵ
		
			request.setAttribute("bookList", books);
			
			return "borrow";
		}else if(operate!=null&&operate.equals("return")){
			User user=(User)request.getSession().getAttribute("User");
			// ͨ�����ֲ������н���ļ�¼
			//@param name  ����������
			//return     �����¼
			//TODO
			
			List<String> records=new ArrayList<String>();
			records=DBUtils.getReturnBook(user.getUsername());
			request.setAttribute("records", records);
			return "return";
		}
		else if(operate!=null&&operate.equals("change")){
			
			Record record=CreateRecord("borrow");
			// ����ı��鱾����״̬����state������һ��record�������ݿ�
			//@param String bookname �鱾��
			 DBUtils.saveRecord(record);
			
			
			return "success";
		}
		else if(operate!=null&&operate.equals("change2")){
			
			Record record=CreateRecord("return");
			
			// �ı��鱾����״̬������һ��record�������ݿ�
			//@param String bookname �鱾��
			DBUtils.saveRecord(record);
			
			
			return "success2";
		}
		return "";
	}
	//����һ���軹���¼������Ĳ����Ľ���״̬���ǻ���״̬
	private Record CreateRecord(String state) throws UnsupportedEncodingException{
		Record record=new Record();
		String bookName=new String(request.getParameter("bookName").getBytes("ISO-8859-1"),"UTF-8");
	
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ	
		record.setTime(df.format(new Date()));
		record.setBookName(bookName);
		record.setState(state);
		User user=(User)request.getSession().getAttribute("User");
		record.setUsername(user.getUsername());
		return record;
	}
}
