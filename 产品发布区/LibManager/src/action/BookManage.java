package action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import util.DBUtils;

import bean.Book;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BookManage extends ActionSupport{
	HttpServletRequest request=(HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
	private String operate;
	private String bookName;
	private String bookNumber;		
	private String bookAuthor;		
	private String bookPublicHouse;	
	private String bookShelf;		
	private String bookInfo;		
	private int bookState;
	
	public String getOperate() {
		return operate;
	}

	public void setOperate(String operate) {
		this.operate = operate;
	}
	
	public String execute() throws Exception{
		if(operate.equals("add")){
			return "BookAdd";
		}else if(operate.equals("change")){
			return "BookAlter";
		}else if(operate.equals("query")){
			Book book = new Book();
			//TODO 需要返回值为Book的函数
			//book = DAO.getBook(bookName);
			//Book DAO.getBook(String bookName);
			String BookName=new String(bookName.getBytes("ISO-8859-1"),"UTF-8");
			book=DBUtils.getBook(BookName);
			request.getSession().removeAttribute("Book");
			request.getSession().setAttribute("Book", book);
			return "BookInfo";
		}else if(operate.equals("entry")){
			Book book = saveBook();
			
			//写入数据库操纵 void addBook(Book book);
			
			DBUtils.addBook(book);
			
			return SUCCESS;
		}else if(operate.equals("alter")){
			Book book =saveBook();
			
			// 修改数据库操作 void alterBook(Book book);
			DBUtils.alterBook(book);
			return SUCCESS;
		}else if(operate.equals("delete")){
			// 删除数据库中数据 void delBook(String bookName);
			DBUtils.delBook(bookName);
			return SUCCESS;
		}
			return null;
	}
	//保存信息到一个bean中
	private Book saveBook(){
		Book book = new Book();
		book.setBookName(bookName);
		book.setBookAuthor(bookAuthor);
		book.setBookInfo(bookInfo);
		book.setBookNumber(bookNumber);
		book.setBookPublicHouse(bookPublicHouse);
		book.setBookShelf(bookShelf);
		book.setBookState(bookState);
		return book;
	}
	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getBookNumber() {
		return bookNumber;
	}

	public void setBookNumber(String bookNumber) {
		this.bookNumber = bookNumber;
	}

	public String getBookAuthor() {
		return bookAuthor;
	}

	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}

	public String getBookPublicHouse() {
		return bookPublicHouse;
	}

	public void setBookPublicHouse(String bookPublicHouse) {
		this.bookPublicHouse = bookPublicHouse;
	}

	public String getBookShelf() {
		return bookShelf;
	}

	public void setBookShelf(String bookShelf) {
		this.bookShelf = bookShelf;
	}

	public String getBookInfo() {
		return bookInfo;
	}

	public void setBookInfo(String bookInfo) {
		this.bookInfo = bookInfo;
	}

	public int getBookState() {
		return bookState;
	}

	public void setBookState(int bookState) {
		this.bookState = bookState;
	}
}
