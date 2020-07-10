<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/login.jsp
  1. 파라미터값 저장 .
  2. db의 정보를 읽어서, 아이디와 비밀번호를 비교.
  3. 아이디가 없는 경우 
          아이디가 없습니다. 메세지 출력 후 loginForm.jsp 페이지 이동.
         비밀번호가 틀린 경우
          비밀번호가 틀립니다. 메세지 출력 후 loginForm.jsp 페이지 이동.
         아이디, 비밀번호 일치.
         - session 객체에 로그인 정보 저장
         - 이름님이 로그인 했습니다. 메세지 출력 후, main.jsp 페이지 이동      
--%>    
<%
  String msg = "아이디를 확인하세요";
  String url = "loginForm.jsp";
  //1. 파라미터 저장
  String id = request.getParameter("id");
  String pass = request.getParameter("pass");
  //2. db 정보 읽기.
  Member mem = new MemberDao().selectOne(id);
  //3. 아이디, 비밀번호 검증
  if(mem != null) {
	 if(pass.equals(mem.getPass())) {
		session.setAttribute("login", id);
		msg = mem.getName() + "님이 로그인 했습니다.";
		url = "main.jsp";
	 } else {
		 msg = "비밀번호가 틀립니다.";
	 }
  }
%>
<script>
  alert("<%=msg%>")
  location.href="<%=url%>";
</script>