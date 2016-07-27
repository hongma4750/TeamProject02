<%@page import="sist.co.Member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>movie_index</title>
</head>
<body>

<%
MemberDTO mem = new MemberDTO("asdf", "asdf", "kay", "11@11");

session.setAttribute("login", mem);
%>

<%-- (수정할거1)예매할 때, 로그인했는지 안했는지 판단해야함. 따라서, session 변수저장되어있는지로 확인하기 --%>
<form action="reserve.jsp" method="post">
	<input type="submit" value="예매" style="width: 100px">	
</form>

<%-- (수정할거2)예매순, 좋아요순 --%>
<form>
</form>

<%-- 상영중인 영화들  : 순위 이미지, 포스터(이미지클릭), 제목, 좋아요갯수  --%>
<form action="moviedetail.jsp">
<table width="80%">
	<tr>
		<td>123123dsdfsdfsfd</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	
	
</table>
</form>





</body>
</html>