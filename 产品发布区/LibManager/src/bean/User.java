package bean;

public class User {
	private String username;		//�û���
	private String password;		//����
	private String identity;		//���
	private String name;			//����
	private String birthday;		//��������
	private String major;			//ѧ��רҵ(������ݴ�Ϊnull)
	private String teacherTitle;	//��ʦְ��(������ݴ�Ϊnull)
	private String id;				//ѧ��ѧ�š���ʦ����
	private String address;			//ѧ������ʦ����ѧԺ��У����Ա������λ
	
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
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
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
}
