<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/join.jsp
  1. �Ķ���� ������ Member ��ü�� ����. => useBean �׼��±�
  2. Member ��ü�� ������ db�� ����
  3. ȸ�� ���� ���� : loginForm.jsp ������ �̵�.
          ȸ�� ���� ���� : joinForm.jsp ������ �̵�.  
--%>
<% request.setCharacterEncoding("euc-kr"); %>  
<jsp:useBean id="mem" class="model.Member"/>
<jsp:setProperty property="*" name="mem"/>  
<%
   String msg = "ȸ������ ����";
   String url = "joinForm.jsp";
   MemberDao dao = new MemberDao(); //model Ŭ����.
   int result = dao.insert(mem);
   if(result > 0) {
	   msg = mem.getName() + "�� ȸ�� ���� �Ϸ�";
	   url = "loginForm.jsp";
   }
%>
<script>
  alert("<%=msg%>")
  location.href="<%=url%>"
</script>