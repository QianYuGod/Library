package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.*;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.Book;
import bean.User;

public class DBUtils{
	public static Connection getconnection() throws SQLException
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String url="jdbc:mysql://localhost:3306/test";
		Connection con=DriverManager.getConnection(url,"root","123456");
		System.out.println("connect success");
		return con;
		
	}
	//---------------------------------用户------
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;
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
			// TODO Auto-generated catch block
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
			// TODO Auto-generated catch block
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

}