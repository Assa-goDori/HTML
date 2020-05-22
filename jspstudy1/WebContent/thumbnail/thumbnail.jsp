<%@page import="java.awt.Graphics2D"%>
<%@page import="java.io.File"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%--/WebContent/thumbnail/thumbnail.jsp--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�����̹����� ����� �̹��� ����</title>
</head>
<body>
	<%
		//�̹��� ���� ���ε� ��ġ ����
		String path = application.getRealPath("/") + "thumbnail/";
		int size = 10*1024*1024;	//10MB
		MultipartRequest multi = new MultipartRequest(request,path,size,"EUC-KR");	//���ε� ����
		String fname = multi.getFilesystemName("picture");	//fname : ���ε� ���� �̸�
		//path+fname : ���ε�� ������ ���� ���
		//BufferedImage bi : ���ε� �� �̹��� ������ �޸𸮷� ����.
		// bi : �����̹���
		BufferedImage bi = ImageIO.read(new File(path+fname));
		int width = bi.getWidth()/5;	// �����̹����� ����ũ��/5
		int height = bi.getHeight()/5;	// �����̹����� ����ũ��/5
		//thumb : ������ 5���� 1 ũ�⿡ �ش��ϴ� �� �̹��� ����(��ȭ��)
		BufferedImage thumb = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
		// g : thumb �̹����� �׸��� ����
		Graphics2D g = thumb.createGraphics();
		g.drawImage(bi,0,0,width,height,null);	//thumb �̹����� bi �̹����� ��ҵǼ� ����
		// f : thumbnail�̹����� ���Ϸ� �����ϱ� ���� ��ü 
		File f = new File(path + "sm_" + fname);
		ImageIO.write(thumb, "jpg", f);	//���Ͽ� ����
	%>
	
	<h3>�����̹���</h3><img src="<%=fname %>"><p>
	<h3>������̹���</h3><img src="sm_<%=fname %>"><p>
</body>
</html>