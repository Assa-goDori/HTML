package chap7;

//Bean 클래스 : 객체화를 통해서 값을 저장할 수 있는 클래스
//private 멤버 변수와 public인 멤버 메서드(getter, setter)인 클래스
//getProperty :getXxx() 메서드 이름=> 대문자가 아닌 소문자로 시작하는 xxx가 getProperty  
//setProperty : setXxx() 메서드 이름=> 대문자가 아닌 소문자로 시작하는 xxx가 setProperty
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