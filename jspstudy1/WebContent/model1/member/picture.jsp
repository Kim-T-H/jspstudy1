<%@page import="java.awt.Graphics2D"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/picture.jsp
   1. 이미지파일 업로드. request 객체 사용 불가
   2. 이미지파일의 3분의1 크기의 섬네일이미지 생성. 이름은 sm_파일이름으로 설정
   3. opener 화면에 결과 전달 =>javascript
   4. 현재 화면 close() =>javascript
--%>
<%
   String path = application.getRealPath("") + "model1/member/picture/";
   String fname = null;
   File f = new File(path);
   if(!f.exists()) {
    f.mkdirs(); //폴더 생성됨.
   }
   MultipartRequest multi = new MultipartRequest
			   (request,path,10*1024*1024,"euc-kr");
   //fname : 업로드된 이미지 파일이름
   fname = multi.getFilesystemName("picture");
   //섬네일 이미지 생성
   BufferedImage bi = ImageIO.read(new File(path + fname));
   int width = bi.getWidth()/3; 
   int height = bi.getHeight()/3; 
   BufferedImage thumb = new BufferedImage
		   (width,height,BufferedImage.TYPE_INT_RGB);
   Graphics2D g = thumb.createGraphics();
   g.drawImage(bi,0,0,width,height,null);
   f = new File(path + "sm_" +fname);
   ImageIO.write(thumb,"jpg",f);   
%>  
<script type="text/javascript">
   img = opener.document.getElementById("pic");
   img.src = "picture/<%=fname%>";  //opener 창에 이미지가 보여짐.
   opener.document.f.picture.value="<%=fname%>"; //hidden 태그. 파라미터값설정
   self.close();
</script>