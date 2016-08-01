<%@page import="sist.co.Member.MemberDTO"%>
<%@page import="test.Movie.MovieDTO"%>
<%@page import="sist.co.Member.MemberDTO"%>
<%@page import="test.Reservation.ReservationDTO"%>
<%@page import="test.Reservation.ReservationDAO"%>
<%@page import="test.Theater.TheaterDTO"%>
<%@page import="test.Theater.TheaterDAO"%>
<%@page import="test.Movie.MovieDAO"%>
<%@page import="test.Movie.MovieDTO"%>
<%@page import="test.Seat.SeatDTO"%>
<%@page import="test.Seat.SeatDAO"%>
<%@page import="test.Price.PriceDTO"%>

<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- 
<link rel="stylesheet" type="text/css" href="css/mypage.css"/>
<link rel = "stylesheet" href = "http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
 -->

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

//예매내역이 있으면 보여주기
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
ReservationDAO  rdao = ReservationDAO.getInstance();
List<ReservationDTO> rLists = rdao.getTicketList(memberdto.getM_id());

TheaterDAO tdao = TheaterDAO.getInstance();
MovieDAO mdao = MovieDAO.getInstance();
SeatDAO sdao = SeatDAO.getInstance();

List<ReservationDTO> rlist = rdao.getTicketList(memberdto.getM_id());

//MovieDTO mdto = mdao.getMovie(1);
%>
<form action = "index01.jsp?mode=MyPage/CancleReserv" method = "post">


<%
for(int i=0; i<rlist.size();i++){
	ReservationDTO rdto = rlist.get(i);
	TheaterDTO tdto = tdao.getTheater(rdto.getTh_seq());
	MovieDTO mdto = mdao.getMovie(tdto.getMv_seq());
	List<SeatDTO> slist = sdao.getSeatList(tdto.getTh_seq());
	
    
	if(rlist.size() == 0){ //내역이 없을때
		%>
		예매내역이 없습니다.
		
		<%
	}else{ //내역이 있을 때
		%>
<table>
  <tr>
    <col width="80"/><col width="80"/><col width="150"/><col width="20"/>
    <td rowspan="7" valign="top" style="padding:30px;"><img src = "<%=mdto.getMv_img() %>" name = "MvPoster"/></td>  
  
    <td>예매번호</td>
    <td><%=rdto.getR_seq() %><input type = "hidden" name="r_seq" value="<%=rdto.getR_seq()%>"/><input type = "hidden" name="th_seq" value="<%=tdto.getTh_seq()%>"/></td> <%--예매번호 46328332--%>
    
    <td><input type = "submit" name="R_Cancle" value = "예매취소"/></td>
  </tr>
  
  <tr><td colspan = "3"><h4><b><%=mdto.getMv_title() %></b></h4></td></tr>  <%--영화제목: 15 부산행 (디지털)--%>

  <tr> 
    <td>관람일</td>
    <td colspan="2"><%=rdto.getR_time() %></td>
  </tr>
  
  <tr>
    <td>상영관</td>
    <td  colspan="2"><%=tdto.getTh_name()%> <%=tdto.getTh_cinema() %></td>
  </tr>

  <tr>
    <td>관람인원</td>
    <td  colspan="2" align = "center"><b>좌석정보</b></td>
  </tr>
  
  <tr>
    <td rowsapn="3">성인<%=rdto.getR_adult() %><br>학생<%=rdto.getR_student() %><br>노인<%=rdto.getR_elder() %></td>
    <td  colspan="2" align = "center"><h4><b>
    
    <%
    for(int j=0; j<slist.size();j++){
    	SeatDTO sdto = slist.get(j);
    	System.out.println(sdto.toString());
    	%>
    	<%=sdto.getS1() %> <%=sdto.getS2() %> <%=sdto.getS3() %> <%=sdto.getS4() %> <%=sdto.getS5() %> <%=sdto.getS6() %> <%=sdto.getS7() %> <%=sdto.getS8() %> <%=sdto.getS9() %> <%=sdto.getS10() %>
    	<%
    }
    %>
    
    </b></h4></td>
  </tr>
  
  <tr>
    <td>결제금액</td>
    <td  colspan="2"><%=rdto.getR_totalprice() %></td>
  </tr>
  </td>
</tr> 
</table>

<hr>
<%
	}
}
%>

</form>
</section1>

<footer1>
Copyright@우리조
</footer1>


</body>
</html>