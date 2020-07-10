<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/update.jsp
  1. 모든 파라미터 정보를 Member 객체에 저장
  2. 입력된 비밀번호와, db에 저장된 비밀번호 비교
      - 같지 않은 경우 : "비밀번호 오류" 메세지 출력 updateForm.jsp 페이지 이동
  3. 파라미터를 저장하고 있는 Member 객체를 이용하여 db 정보 수정.
     int MemberDao.update(Member)
     결과가 0이하면 수정실패 메세지 출력후 , updateForm.jsp 페이지 이동
        1이상이면 수정 성공      info.jsp 페이지 이동
 --%>
<% request.setCharacterEncoding("euc-kr");%>
<jsp:useBean id="mem" class="model.Member"/>
<jsp:setProperty name="mem" property="*" />
<%
    MemberDao dao = new MemberDao();
    String login = (String)session.getAttribute("login");
   	Member dbmem = dao.selectOne(mem.getId());
	String msg = "비밀번호가 틀렸습니다.";
	String url = "updateForm.jsp?id="+mem.getId();
	if(login.equals("admin") || mem.getPass().equals(dbmem.getPass())) {
		int result = dao.update(mem);
		if(result > 0) {
		    response.sendRedirect("info.jsp?id="+mem.getId());
		  } else {
		    msg = "수정실패";
		  }
	}%>
<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>