<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/info.jsp
  1. id 파라미터 값을 조회.
  2. login 상태 검증
         로그아웃 상태 : '로그인 하세요' 메세지 출력 후 loginForm.jsp
  3. login 상태 검증 2
     id 파라미터값과 login id가 다른 경우 : 내정보 조회만 가능합니다. 메세지 출력.
                                     main.jsp 페이지 이동.
  4. db에서 id 값으로 데이터 조회. : selectOne(id)
  5. 조회된 내용을 화면 출력하기                                   
--%> 
<%
 //1. id 파라미터 값을 조회.
 String id = request.getParameter("id");
 //2. login 상태 검증
 String login = (String)session.getAttribute("login");
 if(login == null) {%>
   <script>
      alert("로그인 하세요")
      location.href="loginForm.jsp";
   </script>   
<% } //3. login 상태 검증 2 
   else if(!id.equals(login) && !login.equals("admin"))  {%>
   <script>
      alert("내정보만 조회 가능합니다.")
      location.href="main.jsp";
   </script>
<% } else {  //내정보이거나 admin 조회. 
// 4. db에서 id 값으로 데이터 조회.
   Member mem = new MemberDao().selectOne(id); %>    
<!DOCTYPE html>
<html><head><meta charset="EUC-KR">
<title>회원 정보 보기</title>
<link rel="stylesheet" href="../../css/main.css">
</head><body>
<table><caption>회원 정보 보기</caption>
  <tr><td rowspan="6">
 <img src="picture/<%=mem.getPicture()%>" width="200" height="210"></td>
    <th>아이디</th><td><%=mem.getId() %></td></tr>
   <tr><th>이름</th><td><%=mem.getName() %></td></tr>
   <tr><th>성별</th><td><%=mem.getGender()==1?"남":"여" %></td></tr>
   <tr><th>전화</th><td><%=mem.getTel() %></td></tr>
   <tr><th>이메일</th><td><%=mem.getEmail() %></td></tr>
   <tr><td colspan="2">
     <a href="updateForm.jsp?id=<%=mem.getId()%>">[수정]</a>
  <% if( !id.equals("admin") && !login.equals("admin")) {%>
     <a href="deleteForm.jsp?id=<%=mem.getId()%>">[탈퇴]</a>
   <% } %></td></tr></table></body></html><%}%>