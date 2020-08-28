<%@page import="org.openqa.selenium.chrome.ChromeDriver"%>
<%@page import="org.openqa.selenium.WebDriver"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	WebDriver driver=null; 
	final String WEB_DRIVER_ID = "webdriver.chrome.driver";
	final String WEB_DRIVER_PATH = "D:/20200224/setup/chromedriver_win32/chromedriver.exe";
	String base_url=null;
	System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);	//System에 속성 등록
	driver = new ChromeDriver();
	base_url = "https://www.naver.com";
	try {
		driver.get(base_url);
		System.out.println(driver.getPageSource());
		out.println(driver.getPageSource());
		Thread.sleep(5000);
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		driver.close();	//driver가 제어하고있는 브라우저 닫기.
	}
%>