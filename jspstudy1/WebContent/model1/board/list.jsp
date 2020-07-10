<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Board"%>
<%@page import="java.util.List"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/list.jsp
   1. 한페이지당 10건의 게시물을 출력하기.
      pageNum 파라미터값을 저장 => 없는 경우는 1로 설정하기.
   2. 최근 등록된 게시물이 가장 위에 배치함.
   3. db에서 해당 페이지에 출력될 내용을 조회하여 화면에 출력.
           게시물을 출력부분
           페이지 구분 출력 부분        
--%>
<%
   SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
   String today = sf.format(new Date());
   SimpleDateFormat todayf = new SimpleDateFormat("HH:mm:ss");
   SimpleDateFormat otherf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
   int pageNum = 1;  //페이지번호 초기화
   try {
	   pageNum = Integer.parseInt(request.getParameter("pageNum"));
   } catch (NumberFormatException e) {}
   int limit = 10; //한페이지에 출력할 게시물 건수
   BoardDao dao = new BoardDao();
   int boardcount = dao.boardCount();//등록된 전체 게시물의 건수
   //list : 화면에 출력할 게시글 목록 저장
   List<Board> list = dao.list(pageNum,limit);
   /*
      maxpage : 총 페이지 갯수
      21건 => 3페이지
      21.0/10 => 2.1 + 0.95 => (int)(3.05) => 3
      20건 => 2페이지
      20.0/10 => 2.0 + 0.95 => (int)(2.95) => 2
   */
   int maxpage = (int)((double)boardcount/limit + 0.95);
   /*
      startpage : 화면에 출력될 첫번째 페이지 번호
      pageNum   : 현재  페이지
        2 => 1 
  		2/10.0 + 0.9 => 0.2 + 0.9 => (int)(1.1) => (1 - 1) * 10 + 1 =>1
        10 => 1 
  		10/10.0 + 0.9 => 1.0 + 0.9 => (int)(1.9) => (1 - 1) * 10 + 1 =>1
        11 => 11 
  		11/10.0 + 0.9 => 1.1 + 0.9 => (int)(2.0) => (2 - 1) * 10 + 1 =>11
   */
   int startpage=((int)(pageNum/10.0 + 0.9) - 1) * 10 + 1; //시작페이지번호
   int endpage = startpage + 9;  //종료페이지 번호
   if(endpage > maxpage) endpage = maxpage;
   int boardnum = boardcount - (pageNum -1) * limit;
%>     
<!DOCTYPE html>
<html><head><meta charset="EUC-KR">
<title>게시물 목록 보기</title>
<link rel="stylesheet" href="../../css/main.css">
</head><body>
<table><caption>게시판 목록</caption>
 <% if(boardcount == 0) { //등록된 게시물 없음%>
 <tr><td colspan="5">등록된 게시글이 없습니다.</td></tr>
 <% }  else { //등록된 게시물 존재 %>
<tr><td colspan="5" style="text-align:right">글개수:<%=boardcount%></td></tr>
 <tr><th width="8%">번호</th><th width="50%">제목</th>
     <th width="14%">작성자</th><th width="17%">등록일</th>
     <th width="11%">조회수</th></tr>
<% for(Board b : list) { // 게시글 조회 시작%>
 <tr><td><%=boardnum--%></td>
 <td style="text-align: left">
   <% if (b.getFile1() != null && !b.getFile1().trim().equals("")) {%>
<a href="file/<%=b.getFile1()%>" style="text-decoration: none;">@</a>
   <% } else {%>&nbsp;&nbsp;&nbsp;<%} %> 

    <% if (b.getGrplevel() > 0) { 
	     for (int i=1;i<b.getGrplevel();i++) {%>
	             &nbsp;&nbsp;&nbsp;
	<%} %>└<%} %>      
    <a href="info.jsp?num=<%=b.getNum()%>"><%=b.getSubject() %></a>
 </td><td><%=b.getName() %></td>
 <td><% if (today.equals(sf.format(b.getRegdate()))) { %>
	 <%=todayf.format(b.getRegdate()) %>
 <% } else {%>
    <%=otherf.format(b.getRegdate()) %>
  <% } %></td>
       <td><%=b.getReadcnt() %></td></tr>    
<% } // 게시글 조회 끝%>
 <tr><td colspan="5">
 <%-- 페이지 처리하기 --%>
      <% if (pageNum <= 1) {%>[이전] <% } else { %>
      <a href="list.jsp?pageNum=<%=pageNum - 1%>">[이전]</a><% } %>
      <% for (int a=startpage; a<=endpage;a++) {%>
         <% if (a==pageNum) {%>[<%=a %>] <%} else { %>
           <a href="list.jsp?pageNum=<%=a %>">[<%=a %>]</a>
         <% } 
       } %>
      <% if (pageNum >= maxpage) {%>[다음] <% } else { %>
      <a href="list.jsp?pageNum=<%=pageNum + 1%>">[다음]</a><% } %>
 </td></tr>  
<% } //등록된 게시물 존재 부분 종료  %>
  <tr><td colspan="5" style="text-align:right">
     <a href="writeForm.jsp">[글쓰기]</a></td></tr>
</table></body></html>