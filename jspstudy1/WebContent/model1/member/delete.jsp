<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/delete.jsp
   1. �α׾ƿ� ���� : "�α����ϼ���" ���. loginForm.jsp ������ �̵�
   2. �Ϲݻ����
       - id �Ķ���� ������, login ������ �ٸ����
         "���θ� Ż�� �����մϴ�.". main.jsp ������ �̵�
   3. �Ϲݻ����.
       - id,pass ������ �̿��Ͽ� ��й�ȣ ����
       -��й�ȣ ����ġ : "��й�ȣ�� Ʋ��" ���. deleteForm.jsp ������ �̵�.
            ������
       - id�� �������� ��� Ż�� �Ұ�. list.jsp  ������ �̵�.
   4. Ż�� ���� : member db���� delete ó�� �Ϸ�
            �Ϲݻ���� : �α׾ƿ� ����.  ���� ���� �޼��� ���.   loginForm.jsp ������ �̵�.
            ������ : ���� ���� �޼��� ���. list.jsp ������ �̵�.           
   5. Ż�� ���� : member db���� delete ó���� �����߻�
            �Ϲݻ���� : Ż�� ���� �޼��� ���. info.jsp ������ �̵�.
            ������ : ���� ���� �޼��� ���. list.jsp ������ �̵�.           
                        
--%>    
<%
   String login = (String)session.getAttribute("login"); //�α�������
   String id = request.getParameter("id"); //�Ķ���� ����
   String pass = request.getParameter("pass");
   String msg = null;
   String url = null;
   if(login == null ) { //�α׾ƿ�����
      msg= "�α����� �ʿ��մϴ�.";
      url = "loginForm.jsp";
   } else if(!login.equals(id) && !login.equals("admin")) {
	  msg= "���θ� Ż�� �����մϴ�.";
	  url = "main.jsp";
   } else if (id.equals("admin")) { //Ż�� ����� �Ǵ� ȸ���� ������ �ȵ�
	  msg= "�����ڴ� Ż���� �� �����ϴ�.";
	  url = "list.jsp";
   } else {
	   MemberDao dao = new MemberDao();
	   Member dbmem = dao.selectOne(id); //db ���� ��ȸ
	   if(login.equals("admin") || pass.equals(dbmem.getPass())) {
			if(dao.delete(id) > 0) {  //���� ����
				if(login.equals("admin")) {  //�������� ���
					msg =id + " ����ڸ� ���� Ż�� ����";
				    url = "list.jsp";
				} else {  //�Ϲݻ������ ���
					msg =id + "����  ȸ�� Ż�� �Ϸ�Ǿ����ϴ�.";
				    url = "loginForm.jsp";
				    session.invalidate(); //�α׾ƿ�
				}
			} else {  //���� ����
				msg = id +"���� Ż��� ���� �߻�.";
				if(login.equals("admin")) {  //�������� ���
					url = "list.jsp";
				} else {  //�Ϲݻ������ ���
					url = "info.jsp?id="+id;
				}
			}
	   } else { //�Ϲݻ������ ��й�ȣ�� Ʋ�����
		   msg = id + "���� ��й�ȣ�� Ʋ���ϴ�.";
		   url = "deleteForm.jsp?id=" + id;
	   }
   }
%><script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>