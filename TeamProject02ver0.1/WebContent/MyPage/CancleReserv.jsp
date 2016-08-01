<%@page import="test.Reservation.ReservationDAO"%>
<%@page import="sist.co.Member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="css/mypage.css"/> -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">

<script type="text/javascript" src="javascript/member.js"></script>
</head>
<body>

<%
MemberDTO memberdto = new MemberDTO();
memberdto.setM_id("bombom");
memberdto.setM_pw("1234");
memberdto.setM_name("Bom");
memberdto.setM_email("ddd");

session.setAttribute("login",memberdto);
 
%>

	
<header1>

</header1>

<nav1>
<a href ="index01.jsp?mode=MyPage/Index"><h4><b>마이시네마</b></h4></a>

   &nbsp;&nbsp;<a href = "index01.jsp?mode=MyPage/LoginUpdate">회원정보</a><br>
  

  &nbsp;&nbsp;<a href = "index01.jsp?mode=MyPage/Ticket">내 티켓</a><br>
  
 
  &nbsp;&nbsp;<a href = "index01.jsp?mode=MyPage/MovieHistory">나의 관람 영화</a><br>
</nav1>

<section1>

<%
String srseq = request.getParameter("r_seq");
int rseq = Integer.parseInt(srseq);
String stseq = request.getParameter("th_seq");
int thseq = Integer.parseInt(stseq);

ReservationDAO rdao = ReservationDAO.getInstance();
boolean isS = rdao.cancleReserv(rseq,thseq);

if(isS){
	%>
	예매 취소가 정상적으로 처리 되었습니다.
	
	<%
}else{
	%>
	취소되었습니다.
	<%
}
%>

</section1>

<footer1>
Copyright@우리조
</footer1>



</body>
</html>