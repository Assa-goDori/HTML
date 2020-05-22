<%@page import="java.awt.Graphics2D"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--/WebContent/model1/member/picture.jsp
	1. �̹��� ���� ���ε�. request ��ü ��� �Ұ�
	2. �̹��������� 3���� 1 ũ���� ������ �̹��� ����. �̸��� sm_���ϸ�
	2. opener ȭ�鿡 ��� ���� => javascript
	3. ���� ȭ�� close() => javascript
--%>
<%
	String path = application.getRealPath("/") + "model1/member/picture/";
	String fname = null;
	File f = new File(path);
	if(!f.exists()) {
		f.mkdirs();	//���� ����
	}
	MultipartRequest multi = new MultipartRequest(request,path,10*1024*1024, "EUC-KR");
	fname = multi.getFilesystemName("picture");
	//������ �̹��� ����
	BufferedImage bi = ImageIO.read(new File(path+fname));
	int width = bi.getWidth()/3;
	int height = bi.getHeight()/3;
	BufferedImage thumb = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
	Graphics2D g = thumb.createGraphics();
	g.drawImage(bi, 0, 0, width, height,null);
	f = new File(path + "sm_" + fname);
	ImageIO.write(thumb,"jpg",f);
%>

<script>
	img = opener.document.getElementById("pic");
	img.src = "picture/<%=fname%>";		<%-- opener â�� �̹����� ������ --%>
	opener.document.f.picture.value="<%=fname%>";	<%-- hidden �±� --%>
	self.close();
</script>