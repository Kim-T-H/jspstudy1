<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/test0424/date2.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>session�� ��ϵ� ��¥�� ��ȸ�ϰ�, session �����ϱ�</title>
</head>
<body>
<%
	String date = (String)session.getAttribute("date");
	if(date==null) { %>
		<script>
			alert("��ϵ� ��¥�� �����ϴ�.");
			location.href="date1.jsp";
		</script>
<%	} else { %>
	�ݰ� ���ϴ�. ��ϵ� ��¥ : <%=date%>
<%} 
//	session.removeAttribute("date");
	session.invalidate();
%>
</body>
</html>