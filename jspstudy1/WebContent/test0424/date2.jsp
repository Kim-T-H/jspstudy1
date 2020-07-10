<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/test0424/date2.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>session에 등록된 날짜를 조회하고, session 제거하기</title>
</head>
<body>
<%
	String date = (String)session.getAttribute("date");
	if(date==null) { %>
		<script>
			alert("등록된 날짜가 없습니다.");
			location.href="date1.jsp";
		</script>
<%	} else { %>
	반갑 습니다. 등록된 날짜 : <%=date%>
<%} 
//	session.removeAttribute("date");
	session.invalidate();
%>
</body>
</html>