package bean;

public class Book {
	private String bookName;		//ͼ������
	private String bookNumber;		//ͼ����
	private String bookAuthor;		//ͼ������
	private String bookPublicHouse;	//������
	private String bookShelf;		//�������
	private String bookInfo;		//ͼ����
	private int bookState;			//ͼ�����״̬��1Ϊδ�����0Ϊ�ѽ��
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
	@Override
	public String toString() {
		return "Book [<bookName>" + bookName + "</bookName>, bookNumber>"
				+ bookNumber + "</bookNumber>, bookAuthor>" + bookAuthor
				+ "</bookAuthor>, bookPublicHouse>" + bookPublicHouse
				+ "</bookPublicHouse>, bookShelf>" + bookShelf
				+ "</bookShelf>, bookInfo>" + bookInfo
				+ "</bookInfo>, bookState>" + bookState + "</bookState]";
	}
	
}
