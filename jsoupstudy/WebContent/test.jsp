<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>빅데이터 수집 평가</title>
<style type="text/css">
	table, td, th {	border: 1px solid gray; border-collapse: collapse; }
</style>
</head>
<body>
	<h1>헤럴드 경제 신문</h1>
	<%
		String url = "http://biz.heraldcorp.com/";
		String line = "<table>";
		Document doc = null;
		try {
			doc = Jsoup.connect(url).get();
			Elements e1 = doc.select(".c_r_top.mb25");
			for (Element ele : e1) {
				Elements caption = ele.select("caption");	//캡션 출력 
				line += "<caption>" + caption.html() + "</caption>";
				Elements e2 = ele.select("tr");
				Elements e3 = ele.select(".c_r_top_td2"); //기사 텍스트 링크 재설정
				for (Element ele3 : e3) {
					ele3.attr("href", url + ele3.attr("href"));
				}
				for (Element ele2 : e2) {
					line += ele2;
				}
			}
			line += "</table>";
		} catch (IOException e) {
			e.printStackTrace();
		}
	%>
	<%=line%>
</body>
</html>