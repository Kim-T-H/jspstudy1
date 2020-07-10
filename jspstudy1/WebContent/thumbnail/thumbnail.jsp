<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.File"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/thumbnail/thumbnail.jsp --%>    
<!DOCTYPE html>
<html><head><meta charset="EUC-KR">
<title>원본이미지와 썸네일 이미지 보기</title>
</head><body>
<%
   //이미지 파일 업로드 위치 지정
   String path = application.getRealPath("/") + "thumbnail/";
   int size = 10 * 1024 * 1024; //최대 업로드 크기
   MultipartRequest multi = new MultipartRequest
		   (request,path,size,"EUC-KR");
   //fname : 업로드 파일 이름
   String fname = multi.getFilesystemName("picture");
   //path + fname : 업로드된 파일의 절대 경로
   //BufferedImage bi : 업로드된 이미지 파일을 메모리로 저장.
   // bi : 원본이미지 내용.
   BufferedImage bi = ImageIO.read(new File(path + fname));
   int width = bi.getWidth()/5; //원본이미지 가로크기/5. 크기를 원본의 5분의1로지정
   int height = bi.getHeight()/5; 
   //thumb : 원본의 5분의1의 크기에 해당하는 비어있는 이미지 정보. 빈 도화지
   BufferedImage thumb = new BufferedImage
		   (width,height,BufferedImage.TYPE_INT_RGB);
   //g : thumb 이미지에 그리기 도구
   Graphics2D g = thumb.createGraphics();
   //thumb 이미지에 bi이미지가 축소되어 저장
   g.drawImage(bi,0,0,width,height,null); 
   //f : thumbnail 이미지를 파일로 생성하기 위한 객체
   File f = new File(path + "sm_" +fname);
   ImageIO.write(thumb,"jpg",f); //이미지를 파일에 저장
%>
<h3>원본이미지</h3><img src="<%=fname %>"><p>
<h3>썸네일이미지</h3><img src="sm_<%=fname %>"><p></body></html>