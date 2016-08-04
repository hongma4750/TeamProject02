 <%@page import="sist.co.Member.MemberDTO"%>
<%@page import="test.Reservation.ReservationDTO"%>
<%@page import="test.Reservation.ReservationDAO"%>
<%@page import="test.Theater.TheaterDTO"%>
<%@page import="test.Theater.TheaterDAO"%>
<%@page import="sist.co.Movie.MovieDAO"%>
<%@page import="sist.co.Movie.MovieDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="css/mypage.css"> 
<script type="text/javascript" src="javascript/member.js"></script>


</head>
<body> 

<%



 
String strseq = request.getParameter("seq");
int mv_seq = Integer.parseInt(strseq);

String strlhm = request.getParameter("lhm");
int lhm = Integer.parseInt(strlhm);
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
MovieDAO mdao = MovieDAO.getInstance();
MemberDTO memberdto = new MemberDTO();


memberdto = (MemberDTO)session.getAttribute("login");

//좋아요 클릭시
if(lhm==1){
	boolean isS = mdao.addlike(mv_seq,1,memberdto.getM_id());
	
	if(isS){
		%>
		<script>
		alert("좋아요를 투표했습니다.");
		location.href="index01.jsp?mode=MyPage/MovieHistory";
		</script>
		<%
	}else{
		%>
		<script>
		alert("투표가 취소되었습니다.");
		location.href="index01.jsp?mode=MyPage/MovieHistory";
		</script>
		<%
	}
}else if(lhm==2){
	boolean isS = mdao.addlike(mv_seq,2,memberdto.getM_id());
	if(isS){
		%>
		<script>
		alert("싫어요를 투표했습니다.");
		location.href="index01.jsp?mode=MyPage/MovieHistory";
		</script>
		<%
	}else{
		%>
		<script>
		alert("투표가 취소되었습니다.");
		location.href="index01.jsp?mode=MyPage/MovieHistory";
		</script>
		<%
	}
}


%>

</section1>

<footer1>

</footer1> 



</body>
</html>