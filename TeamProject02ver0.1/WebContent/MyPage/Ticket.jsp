<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="../css/testmypage.css"/>
<link rel = "stylesheet" href = "http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">


</head>
<body>
<%
String Test_Name = "봄이";
session.setAttribute("TestLogin", Test_Name);

%>
<header>
<h5><%=Test_Name %>님 반갑습니다!</h5>
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

<form action = "" method = "post">

<table>
<tr>
  <td>예매번호</td>
  <td></td> <%--예매번호 46328332--%>
  <td><input type = "submit" name="R_Cancle" value = "예매취소"/></td>
</tr>

<tr> <%--영화제목: 15 부산행 (디지털)--%>
  <td><b></b></td>
</tr>

<tr>
  <td>관람일</td>
</tr>

<tr> <%--날짜 2016.07.27(수) 20:10 ~ 22:18 --%>
  <td></td>
</tr>

<tr>
  <td>영화관</td>
</tr>

<tr> <%--신촌 3관 --%>
  <td></td>
</tr>
<hr>

<tr>
  <td>관람인원</td>
  <td>좌석정보</td>
</tr>

<tr>
  <td></td> <%--성인3 --%>
  <td></td> <%--K10, K11, K12 --%>
</tr>
</table>

</form>

</section>

<footer>
Copyright@우리조
</footer>

</body>
</html>