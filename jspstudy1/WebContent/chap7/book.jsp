<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/chap7/book.jsp --%>    
<!DOCTYPE html>
<html><head><meta charset="EUC-KR">
<title>����� ���� ����</title>
<link rel="stylesheet" href="../css/main.css" >
</head>
<body>
<% request.setCharacterEncoding("euc-kr");
//  String name = request.getParameter("name");
//  ...
%>
<%--  Book book = new Book();
      request.setAttribute(book);
 --%>
<jsp:useBean id="book" class="chap7.Book" scope="request"/> <%-- useBean �׼��±� --%>
<jsp:setProperty property="*" name="book"/>
<jsp:setProperty property="name" param="writer" name="book"/>
<%--
   property="*" : parameter �̸��� property �̸��� ���� ���� Book��ü�� ������.
   book.setName(request.getParameter("name"))
   ...
   request.getParameter("writer"). ���� �̸��� set ������Ƽ�� ����. ȣ��ȵ�.
 --%>
<table>
<caption>����� ��ȸ</caption>
<tr><td>�ۼ���</td>
    <td><jsp:getProperty name="book" property="name"/>,
    <%=book.getName() %></td></tr>
<tr><td>����</td>
    <td><jsp:getProperty name="book" property="title"/>,
    <%=book.getTitle() %></td></tr>
<tr><td>����</td>
    <td><jsp:getProperty name="book" property="content"/>,
    <%=book.getContent() %></td></tr>
</table></body></html>