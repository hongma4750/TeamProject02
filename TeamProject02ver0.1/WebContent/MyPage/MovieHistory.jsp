<%@page import="sist.co.Member.MemberDTO"%>
<%@page import="sist.co.Reservation.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 관람영화</title>

<link rel="stylesheet" type="text/css" href="../css/testmypage.css"/>
<link rel="stylesheet" type="text/css" href="../css/style.css"/>
<link rel = "stylesheet" href = "http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"> 


</head>
<body>
<%
MemberDTO memberdto = new MemberDTO();
memberdto.setM_id("BomBom");
memberdto.setM_pw("1234");
memberdto.setM_name("Bom");
memberdto.setM_email("ddd");

session.setAttribute("login",memberdto);
 
%>
<header>
<h5><%=memberdto.getM_name() %>님 반갑습니다!</h5>
</header>

<nav>
<a href ="Index.jsp"><h4><b>마이시네마</b></h4></a>
   &nbsp;&nbsp;<a href = "LoginUpdate.jsp">회원정보</a><br>
  

  &nbsp;&nbsp;<a href = "Ticket.jsp">내 티켓</a><br>
  
 
  &nbsp;&nbsp;<a href = "MovieHistory.jsp">나의 관람 영화</a><br>
</nav>

<section>

<%
ReservationDAO dao = ReservationDAO.getInstance();
List<ReservationDTO> rLists = dao.getReservList();
%>
<table align = "center">
<col width="150"/><col width="200"/><col width="150"/>
<tr align = "center">  
  <td>관람일</td>
  <td>영화</td>
  <td>상영관</td>
</tr>

<%
for(int i=0; i<rLists.size();i++){
	ReservationDTO rdto = rLists.get(i);

%>

<tr align = "center">
   <td></td>
   <td><a href = "../ReserDetail.jsp?seq">싱 스트리트</a></td>
   <td>홍대입구</td>
</tr>


<%
}
%>

</table>

</section>

<footer>
Copyright@우리조
</footer>


</body>
</html>