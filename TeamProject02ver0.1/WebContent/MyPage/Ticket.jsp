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

//예매내역이 있으면 보여주기
%>
<header>
<h5><%=Test_Name %>님 반갑습니다!</h5>
</header>

<nav>
<a href ="Index.jsp"><h4><b>마이시네마</b></h4></a>
  &nbsp;&nbsp;<a href = "UpdateLogin.jsp">회원정보</a><br>
  

  &nbsp;&nbsp;<a href = "Ticket.jsp">내 티켓</a><br>
  
 
  &nbsp;&nbsp;<a href = "MovieHistory.jsp">나의 관람 영화</a><br>
</nav>

<section>

<form action = "" method = "post">

<table>

<tr>
  <col width="80"/><col width="80"/><col width="200"/><col width="20"/>
  
  <td roswspan="7"><img src = "../img/p_tobusanline.jpg" name = "MvPoster"/></td>  

  
  <tr>
    <td>예매번호</td>
    <td>46328332</td> <%--예매번호 46328332--%>
    <td><input type = "submit" name="R_Cancle" value = "예매취소"/></td>
  </tr>
  <tr><td colspan = "2"><h4><b>15 부산행 (디지털)</b></h4><hr></td></tr>  <%--영화제목: 15 부산행 (디지털)--%>
 
  <tr>
    <td>관람일</td>
    <td colspan="2">2016.07.27(수) 20:10 ~ 22:18</td>
  </tr>
  <tr>
    <td>상영관</td>
    <td  colspan="2">신촌 3관<hr></td>
  </tr>
  
   <tr>
    <td>관람인원</td>
    <td  colspan="2" align = "center">좌석정보</td>
  </tr>
  
  <tr>
    <td>성인3</td>
    <td  colspan="2" align = "center"><h4><b>K10, K11, K12</b></h4></td>
  </tr>
  
  <tr>
    <td>결제금액</td>
    <td  colspan="2">6000원</td>
  </tr>
</tr> 

</table>

</form>

</section>

<footer>
Copyright@우리조
</footer>

</body>
</html>