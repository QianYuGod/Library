package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.*;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.Book;
import bean.Record;
import bean.User;

public class DBUtils{
	public static Connection getconnection() throws SQLException
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}
		String url="jdbc:mysql://localhost:3306/test";
		Connection con=DriverManager.getConnection(url,"root","mysqladmin");
		
		return con;
		
	}
	//---------------------------------鐢ㄦ埛------
	/*修改生日和地址
	 * username
	 * birthday 
	 * address
	 * 
	 * */
	public static void UpdateAgeAndAddress(String username,String birthday,String Address){
		
		String sql = "update users set birthday= '"+birthday+"' , address='"+Address+"' where username= '"+username+"'";
		try {
			Connection conn=getconnection();
			Statement stmt =conn.createStatement();
			int rs=stmt.executeUpdate(sql);
			
			stmt.close();
			conn.close();
			if(rs>0){
				System.out.println("change address Success "+rs);
				
			}else{
				System.out.println("update fail");
				
			}
			
			stmt.close();
			conn.close();
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
	}
	/*验证登陆的时候密码和账号是否正确
	 *@param String username 用户名
	 * String password 密码
	 * String type 账户类型
	 * return boolean 是否存在该账号
	 * */
	public static boolean valite(String username,String password,String type){
		boolean result=false;
		int reu=-1;
		String sql="select count(*) as cou from users where username='"+username+"' and password='"+password+"' and identity='"+type+"';";
		
		try {
			Connection conn=getconnection();
			Statement stmt =conn.createStatement();
			ResultSet rs=stmt.executeQuery(sql);
			
			
			while(rs.next()){
				 reu=rs.getInt("cou");
			}
		
			if(reu==1){
				System.out.println(" Success "+rs);
				result=true;
			}else{
				System.out.println(" fail");
				result=false;
			}
			
			stmt.close();
			conn.close();
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return result;
	}
	public static List<String> getnameList(){
		List<String> nameList=new ArrayList<String>();
		String sql="select username from users;";
		
		try {
			Connection conn=getconnection();
			Statement stmt =conn.createStatement();
			ResultSet rs=stmt.executeQuery(sql);
			
			
			while(rs.next()){
				String str=rs.getString("username");
				nameList.add(str);
			}
			stmt.close();
			conn.close();
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return nameList;
	}
	public static void insertUserInfo(User user){
		String sql="insert into users(username,password,identity,name,birthday,major,teacherTitle,id,address) values('"+user.getUsername()+"','"+user.getPassword()+"','"+user.getIdentity()+"','"+user.getName()+"','"+user.getBirthday()+"','"+user.getMajor()+"','"+user.getTeacherTitle()+"','"+user.getId()+"','"+user.getAddress()+"');";
		try {
			Connection conn=getconnection();
			Statement stmt =conn.createStatement();
			int rs=stmt.executeUpdate(sql);
			
			stmt.close();
			conn.close();
			if(rs>0){
				System.out.println("insert Success "+rs);
				
			}else{
				System.out.println("update fail");
				
			}
			
			stmt.close();
			conn.close();
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
	}
	public static Boolean  IsExist(String administrator){
		int num=0;
		String sql="select count(*) as num from users where username='"+administrator+"' ;";
		System.out.println("sql="+sql);
		try {
			Connection conn=getconnection();
			Statement stmt=conn.createStatement();
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()){
			    num=rs.getInt("num");
			   if(num==1){
				   return true;
			   }
			   break;
			}
			
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		return false;
	}
	//输入用户名和身份，输出用户的所有信息
	public static User getUserBynameAndIden(String username,String identity){
		User user = getUser(username);
		if(identity.equals(user.getIdentity())){
			return user;
		}
		
		
		return null;
	}
	public static User getUser(String username){
		User user = new User();
		String sql = "select * from users where username ='"+username+"'";
		Connection conn;
		try {
			conn = getconnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setIdentity(rs.getString("identity"));
				user.setName(rs.getString("name"));
				user.setBirthday(rs.getString("birthday"));
				user.setMajor(rs.getString("major"));
				user.setTeacherTitle(rs.getString("teacherTitle"));
				user.setId(rs.getString("id"));
				user.setAddress(rs.getString("address"));
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return user;
	}
	
	public static void deleteUserInfo(String username){
		String sql ="delete from test.users where username ='"+username+"'";
		try {
			Connection conn=getconnection();
			Statement stmt=conn.createStatement();
			stmt.execute(sql);
			
			stmt.close();
			conn.close();
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
	}
	public static void modifyUser(User user){
		if(getUser(user.getUsername()).getUsername()!=null){
			deleteUserInfo(user.getUsername());
			insertUserInfo(user);
		}
	}
	public static void modifyUserPassword(String username ,String password){
		String sql = "update users set password= '"+password+"' where username= '"+username+"'";
		try {
			Connection conn=getconnection();
			Statement stmt =conn.createStatement();
			int rs=stmt.executeUpdate(sql);
			
			stmt.close();
			conn.close();
			if(rs>0){
				System.out.println("change password Success "+rs);
				
			}else{
				System.out.println("update fail");
				
			}
			
			stmt.close();
			conn.close();
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
	}
	//不仅修改用户名，并且修改借书记录里面的名字
	
	public static void modifyUsername(String username,String newusername){
		String sql = "update users set username= '"+newusername+"' where username= '"+username+"'";
		String sql2 = "update records set username= '"+newusername+"' where username= '"+username+"'";
		String sql3 = "update books set username= '"+newusername+"' where username= '"+username+"'";
		
	
		try {
			Connection conn=getconnection();
			Statement stmt =conn.createStatement();
			stmt.addBatch(sql);
			stmt.addBatch(sql2);
			stmt.addBatch(sql3);
			int[] rs=stmt.executeBatch();
			
			stmt.close();
			conn.close();
			if(rs[0]>0&&rs[1]>0&&rs[2]>0){
				System.out.println("change username Success "+rs);
				
			}else{
				System.out.println("update fail");
				
			}
			
			stmt.close();
			conn.close();
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
	}
	
	//-------------------------------------------------book----------------
	public static void addBook(Book book){
		String sql ="insert into books(bookName,bookNumber,bookAuthor,bookPublicHouse,bookShelf,bookInfo,bookState) values('"+book.getBookName()+"','"+book.getBookNumber()+"','"+book.getBookAuthor()+"','"+book.getBookPublicHouse()+"','"+book.getBookShelf()+"','"+book.getBookInfo()+"','"+book.getBookState()+"');";
		try {
			Connection conn=getconnection();
			Statement stmt =conn.createStatement();
			int rs=stmt.executeUpdate(sql);
			
			stmt.close();
			conn.close();
			if(rs>0){
				System.out.println("insert book Success "+rs);
				
			}else{
				System.out.println("update fail");
				
			}
			
			stmt.close();
			conn.close();
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
	}
	public static Book getBook(String bookname){
		Book book = new Book();
		String sql = "select * from books where bookName='"+bookname+"'";
		Connection conn;
		try {
			conn = getconnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				book.setBookName(rs.getString("bookName"));
				book.setBookNumber(rs.getString("bookNumber"));
				book.setBookAuthor(rs.getString("bookAuthor"));
				book.setBookPublicHouse(rs.getString("bookPublicHouse"));
				book.setBookShelf(rs.getString("bookShelf"));
				book.setBookInfo(rs.getString("bookInfo"));
				book.setBookState(rs.getInt("bookState"));
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return book;
		
	}
	public static List<String> getAllBookName(){
		List <String> list = new ArrayList<String>();
		String sql = "select bookName from books";
		Connection conn;
		try {
			conn = getconnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				list.add(rs.getString("bookName"));
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return list;
	}
	public static void alterBook(Book book){
		if(getBook(book.getBookName()).getBookName()!=null){
			delBook(book.getBookName());
			addBook(book);
		}
		
		
	}
	public static void delBook(String bookname){
		String sql ="delete from test.books where bookName ='"+bookname+"'";
		try {
			Connection conn=getconnection();
			Statement stmt=conn.createStatement();
			stmt.execute(sql);
			
			stmt.close();
			conn.close();
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		
	}


	public static ArrayList<Record> getAllRecord(String name){
		ArrayList <Record> list = new ArrayList<Record>();
		Record record = new Record();
		String sql = "select *  from records where userName='"+name+"'";
		Connection conn;
		try {
			conn = getconnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				if(rs.getString("state").equals("borrow")){
					record.setBookName(rs.getString("bookName"));
					record.setUsername(rs.getString("username"));
					record.setTime(rs.getString("time"));
					record.setState(rs.getString("state"));
					list.add(record);
				}
				
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return list;
	}
	public static ArrayList<Book> getAllBookInfo(){
		ArrayList<Book> books=new ArrayList<Book>();
		
		String sql = "select bookName,bookState from books";
		Connection conn;
		try {
			conn = getconnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				Book book=new Book();
				book.setBookName(rs.getString("bookName"));
				book.setBookState(rs.getInt("bookState"));
				books.add(book);
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return books;
	}
	//获取应该归还书的信息
	public static List<String> getReturnBook(String username){
		List<String> records=new ArrayList<>();
		String sql = "select bookName from books where bookState=0 and username='"+username+"';";
		Connection conn;
		try {
			conn = getconnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				String str=rs.getString("bookName");
				records.add(str);
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return records;
	}
	//获取特定用户借书的本数
		public static int getNumberBBook(String username){
		    int  number=0;
			String sql = "select count(*) as number from books where username='"+username+"';";
			Connection conn;
			try {
				conn = getconnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()){
					number =rs.getInt("number");
				}
				
				
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			return number;
		}
	//获取借书人借的书本列表
		public static List<String> getBorrowBookList(String username){
			List<String> records=new ArrayList<>();
			String sql = "select bookName from books where bookState=1 and username='"+username+"';";
			Connection conn;
			try {
				conn = getconnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()){
					String str=rs.getString("bookName");
					records.add(str);
				}
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			return records;
		}
	//不仅要生成记录，并且更改书本的借阅状态
	public static Boolean saveRecord(Record record){
		String sql ="insert into records(bookName,userName,time,state) values('"+record.getBookName()+"','"+record.getUsername()+"','"+record.getTime()+"','"+record.getState()+"');";
		String state=record.getState();
		String sql2="";
		if(state.equals("borrow")){
			sql2="update books set bookState=0,username='"+record.getUsername()+"' where bookName='"+record.getBookName()+"';";
		}else{
			sql2="update books set bookState=1,username=NULL where bookName='"+record.getBookName()+"' and username='"+record.getUsername()+"';";
		}
	
		try {
			Connection conn=getconnection();
			Statement stmt =conn.createStatement();
			stmt.addBatch(sql);
			stmt.addBatch(sql2);
			int[] rs=stmt.executeBatch();
			
			stmt.close();
			conn.close();
			if(rs[0]>0&&rs[1]>0){
				System.out.println(" records Success "+rs);
				return true;
				
			}else{
				System.out.println("update fail");
				return false;
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return null;
	}
}