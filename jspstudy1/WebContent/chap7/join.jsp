<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/chap7/join.jsp --%>    
<!DOCTYPE html>
<html><head><meta charset="EUC-KR">
<title>ȸ������ ȭ��</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<% request.setCharacterEncoding("euc-kr");%>
<jsp:useBean id="join" class="chap7.Member"/>
<jsp:setProperty property="*" name="join"/>
<%--
   join.setName(request.getParameter("name"));
   ...
   join.setAge(Integer.parseInt(request.getParamter("age")))
 --%>
<%
 //   int age = Integer.parseInt(request.getParameter("age"));
%> 
<table>
<caption>ȸ������</caption>
<tr><td>���̵�</td>
    <td><jsp:getProperty property="id" name="join"/></td></tr>
<tr><td>��й�ȣ</td>
    <td><jsp:getProperty property="pass" name="join"/></td></tr>
<tr><td>�̸�</td>
    <td><jsp:getProperty property="name" name="join"/></td></tr>
<tr><td>����</td>
    <td><%=join.getGender()==1?"����":"����" %></td></tr>
<tr><td>����</td><%-- join.getGender2() --%>
    <td><jsp:getProperty property="gender2" name="join"/></td></tr>
<tr><td>����</td>
    <td><jsp:getProperty property="age" name="join"/></td></tr>
<tr><td>�̸���</td>
    <td><jsp:getProperty property="email" name="join"/></td></tr>
</table></body></html>