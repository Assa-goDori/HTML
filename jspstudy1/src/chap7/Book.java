package chap7;

//Bean Ŭ���� : ��üȭ�� ���ؼ� ���� ������ �� �ִ� Ŭ����
//private ��� ������ public�� ��� �޼���(getter, setter)�� Ŭ����
//getProperty :getXxx() �޼��� �̸�=> �빮�ڰ� �ƴ� �ҹ��ڷ� �����ϴ� xxx�� getProperty  
//setProperty : setXxx() �޼��� �̸�=> �빮�ڰ� �ƴ� �ҹ��ڷ� �����ϴ� xxx�� setProperty
public class Book {
	private String name;
	private String title;
	private String content;
	//setter, getter
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}