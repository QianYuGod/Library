package bean;

public class Record {

	private String bookName;		//�軹������
	private String username;		//�軹���û���
	private String time;			//�軹ʱ��
	private String state;			//�軹��״̬��borrowΪ�����returnΪ�黹
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
