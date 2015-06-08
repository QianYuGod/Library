package bean;

public class Book {
	private String bookName;		//图书名称
	private String bookNumber;		//图书编号
	private String bookAuthor;		//图书作者
	private String bookPublicHouse;	//出版社
	private String bookShelf;		//所在书架
	private String bookInfo;		//图书简介
	private int bookState;			//图书借阅状态，1为未借出，0为已借出
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
