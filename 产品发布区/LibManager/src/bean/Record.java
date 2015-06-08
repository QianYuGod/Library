package bean;

public class Record {

	private String bookName;		//借还书名称
	private String username;		//借还人用户名
	private String time;			//借还时间
	private String state;			//借还书状态，borrow为借出，return为归还
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
}
