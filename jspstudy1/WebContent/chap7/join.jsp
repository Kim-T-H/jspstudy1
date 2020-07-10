<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/chap7/join.jsp --%>    
<!DOCTYPE html>
<html><head><meta charset="EUC-KR">
<title>회원가입 화면</title>
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
<caption>회원정보</caption>
<tr><td>아이디</td>
    <td><jsp:getProperty property="id" name="join"/></td></tr>
<tr><td>비밀번호</td>
    <td><jsp:getProperty property="pass" name="join"/></td></tr>
<tr><td>이름</td>
    <td><jsp:getProperty property="name" name="join"/></td></tr>
<tr><td>성별</td>
    <td><%=join.getGender()==1?"남자":"여자" %></td></tr>
<tr><td>성별</td><%-- join.getGender2() --%>
    <td><jsp:getProperty property="gender2" name="join"/></td></tr>
<tr><td>나이</td>
    <td><jsp:getProperty property="age" name="join"/></td></tr>
<tr><td>이메일</td>
    <td><jsp:getProperty property="email" name="join"/></td></tr>
</table></body></html>