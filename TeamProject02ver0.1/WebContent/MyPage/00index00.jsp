<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<link rel = "stylesheet" href = "http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/testmypage.css">


</head>
<body>


<header>
<h4>로그인</h4></a>
</header>

<nav>
<a href ="Index.jsp"><h4><b>마이시네마</b></h4></a>
  <h4>내 정보관리</h4></a>
  &nbsp;&nbsp;<a href = "MemInfo.jsp">회원정보</a><br>
  &nbsp;&nbsp;<a href = "UpdateMemInfo.jsp">회원정보수정</a><br>
  
  <h4>예매내역</h4></a>
  &nbsp;&nbsp;<a href = "Ticket.jsp">내 티켓</a><br>
  
  <h4>무비 히스토리</h4></a>
  &nbsp;&nbsp;<a href = "MovieHistory.jsp">나의 관람 영화</a><br>
</nav>

<section>

<form action="00login00.jsp" method="post">
<table>

<tr>
<td>아이디</td>
<td><input type = "text" name = "id" size="20"/></td>
</tr>

<tr>
<td>비밀번호</td>
<td><input type = "password" name = "pw" size="20"/></td>
</tr>

<tr>
<td colspan = "2"><input type = "submit" value= "로그인"/></td>
</tr>

</table>
</form>

</section>

<footer>
Copyright@우리조
</footer>


</body>
</html>