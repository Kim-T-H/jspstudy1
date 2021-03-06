<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/delete.jsp
   1. 로그아웃 상태 : "로그인하세요" 출력. loginForm.jsp 페이지 이동
   2. 일반사용자
       - id 파라미터 정보와, login 정보가 다른경우
         "본인만 탈퇴 가능합니다.". main.jsp 페이지 이동
   3. 일반사용자.
       - id,pass 정보를 이용하여 비밀번호 검증
       -비밀번호 불일치 : "비밀번호가 틀림" 출력. deleteForm.jsp 페이지 이동.
            관리자
       - id가 관리자인 경우 탈퇴 불가. list.jsp  페이지 이동.
   4. 탈퇴 성공 : member db에서 delete 처리 완료
            일반사용자 : 로그아웃 실행.  삭제 성공 메세지 출력.   loginForm.jsp 페이지 이동.
            관리자 : 삭제 성공 메세지 출력. list.jsp 페이지 이동.           
   5. 탈퇴 실패 : member db에서 delete 처리시 오류발생
            일반사용자 : 탈퇴 실패 메세지 출력. info.jsp 페이지 이동.
            관리자 : 삭제 살패 메세지 출력. list.jsp 페이지 이동.           
                        
--%>    
<%
   String login = (String)session.getAttribute("login"); //로그인정보
   String id = request.getParameter("id"); //파라미터 정보
   String pass = request.getParameter("pass");
   String msg = null;
   String url = null;
   if(login == null ) { //로그아웃상태
      msg= "로그인이 필요합니다.";
      url = "loginForm.jsp";
   } else if(!login.equals(id) && !login.equals("admin")) {
	  msg= "본인만 탈퇴가 가능합니다.";
	  url = "main.jsp";
   } else if (id.equals("admin")) { //탈퇴 대상이 되는 회원은 관리자 안됨
	  msg= "관리자는 탈퇴할 수 없습니다.";
	  url = "list.jsp";
   } else {
	   MemberDao dao = new MemberDao();
	   Member dbmem = dao.selectOne(id); //db 정보 조회
	   if(login.equals("admin") || pass.equals(dbmem.getPass())) {
			if(dao.delete(id) > 0) {  //삭제 성공
				if(login.equals("admin")) {  //관리자인 경우
					msg =id + " 사용자를 강제 탈퇴 성공";
				    url = "list.jsp";
				} else {  //일반사용자인 경우
					msg =id + "님의  회원 탈퇴가 완료되었습니다.";
				    url = "loginForm.jsp";
				    session.invalidate(); //로그아웃
				}
			} else {  //삭제 실패
				msg = id +"님의 탈퇴시 오류 발생.";
				if(login.equals("admin")) {  //관리자인 경우
					url = "list.jsp";
				} else {  //일반사용자인 경우
					url = "info.jsp?id="+id;
				}
			}
	   } else { //일반사용자의 비밀번호가 틀린경우
		   msg = id + "님의 비밀번호가 틀립니다.";
		   url = "deleteForm.jsp?id=" + id;
	   }
   }
%><script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>