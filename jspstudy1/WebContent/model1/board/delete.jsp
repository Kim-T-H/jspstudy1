<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<%-- /WebContent/model1/board/delete.jsp
   1. num,pass 파라미터를 변수에 저장.
   2. 입력된 비밀번호와 db 비밀번호 검증
            틀린경우 : 비밀번호 오류 메시지 출력, deleteForm.jsp 페이지 이동
   3. 비밀번호가 맞는 경우 : 게시물 삭제.
           삭제 성공 : 삭제 성공 메시지 출력, list.jsp 페이지 이동
           삭제 실패 : 삭제 실패 메시지 출력, info.jsp 페이지 이동
 --%>
<%
int num = Integer.parseInt(request.getParameter("num"));
String pass = request.getParameter("pass"); 

String msg = "게시글의 비밀번호가 틀렸습니다";
String url = "deleteForm.jsp?num=" + num;
BoardDao dao = new BoardDao();
Board board = dao.selectOne(num);
if(board == null) {
	msg = "없는 게시글입니다. ";
	url = "list.jsp";
} else {
  if (pass.equals(board.getPass())) {
	if (dao.delete(num)) {
		msg = "게시글 삭제 성공";
		url = "list.jsp";
	} else {
		msg = "게시글 삭제 실패";
		url = "info.jsp?num=" + num;
	}
  }
}
%><script>
  alert("<%=msg%>");
  location.href="<%=url%>";
</script>