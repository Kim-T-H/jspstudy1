<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/update.jsp
  1. ��� �Ķ���� ������ Member ��ü�� ����
  2. �Էµ� ��й�ȣ��, db�� ����� ��й�ȣ ��
      - ���� ���� ��� : "��й�ȣ ����" �޼��� ��� updateForm.jsp ������ �̵�
  3. �Ķ���͸� �����ϰ� �ִ� Member ��ü�� �̿��Ͽ� db ���� ����.
     int MemberDao.update(Member)
     ����� 0���ϸ� �������� �޼��� ����� , updateForm.jsp ������ �̵�
        1�̻��̸� ���� ����      info.jsp ������ �̵�
 --%>
<% request.setCharacterEncoding("euc-kr");%>
<jsp:useBean id="mem" class="model.Member"/>
<jsp:setProperty name="mem" property="*" />
<%
    MemberDao dao = new MemberDao();
    String login = (String)session.getAttribute("login");
   	Member dbmem = dao.selectOne(mem.getId());
	String msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
	String url = "updateForm.jsp?id="+mem.getId();
	if(login.equals("admin") || mem.getPass().equals(dbmem.getPass())) {
		int result = dao.update(mem);
		if(result > 0) {
		    response.sendRedirect("info.jsp?id="+mem.getId());
		  } else {
		    msg = "��������";
		  }
	}%>
<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>