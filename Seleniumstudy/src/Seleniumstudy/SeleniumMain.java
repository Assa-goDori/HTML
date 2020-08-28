package Seleniumstudy;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class SeleniumMain {
	private WebDriver driver;
	private WebElement webElement;
	public SeleniumMain() {
		System.setProperty("webdriver.chrome.driver","D:/20200224/setup/chromedriver_win32/chromedriver.exe");
		driver = new ChromeDriver();
	}
	public static void main(String[] args) {
		SeleniumMain main = new SeleniumMain();
		main.crawl();
	}
	private void crawl() {	
		try {
			driver.get("http://localhost:8080/jspstudy2/model2/member/loginForm.me");
			//By.name("id") : name="id"�� �±׸� ����
			//findElement : �±� ����
			webElement = driver.findElement(By.name("id"));
			webElement.sendKeys("admin");	//������ �±׿� admin �� �Է�
			webElement = driver.findElement(By.name("pass"));
			webElement.sendKeys("1234");
			webElement = driver.findElement(By.name("f"));
			webElement.submit();	//�α��� ��ư Ŭ��.
			Thread.sleep(3000);
			//ȸ����Ϻ���
			//By.xpath : xml�� ��带 ã�ư��� ��� ����
			//ù��° '/' : root�±��� �ֻ�� �������
			// html : root�±�
			// '/' : child���
			// '//' : �ڼ� ���
			// a[@href='list.me'] => @ : a�±׵��� �Ӽ� �� href='list.me'�� a�±� ����
			webElement = driver.findElement(By.xpath("/html/body//a[@href='list.me']"));
			webElement.click();	//a �±� Ŭ��.
			Thread.sleep(3000);
			Document doc = Jsoup.parse(driver.getPageSource());
			Elements div = doc.select(".w3-content.w3-justify.w3-text-grey.w3-padding-64 > table");
			for(Element e: div) {
				for(Element tr : e.select("tr")) {
					Elements tds = tr.select("td");
					if(tds.size()>3) {
						System.out.println(tds.get(2).html());
					}
				}
			}
			Thread.sleep(5000);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			driver.close();
		}
	}
}