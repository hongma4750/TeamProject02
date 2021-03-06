<%@page import="sist.co.Reservation.ReservationDAO"%>
<%@page import="sist.co.Review.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@page import="sist.co.Review.ReviewDAO"%>
<%@page import="sist.co.Movie.MovieDTO"%>
<%@page import="sist.co.Movie.MovieDAO"%>
<%@page import="sist.co.Member.MemberDTO, sist.co.Member.MemberDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화상세정보</title>
<style type="text/css">
table{
	border-collapse: collapse;
	border:  1px solid black;
	text-align: center;
}
.leftfix{
	text-align: left;
}
</style>
</head>
<body>
<%!
public String dot3(String msg){	// 리뷰가 15자 이상이면
	String s="";
	if(msg.length() >= 15){
		s = msg.substring(0, 15);
		s += "...";
	}else{
		s = msg.trim();
	}
	return s;
}
%>
<%
String id = request.getParameter("id");
MemberDAO memdao =  MemberDAO.getInstance();
MemberDTO memberdto = new MemberDTO();
memberdto = memdao.selectMemberDTO(id);

String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq);
System.out.println("seq = " + seq);

MovieDAO dao = MovieDAO.getInstance();
MovieDTO mdto = dao.getmoviedetail(seq); 

%>

<form action="">
<table style="width:800px;">
	<tr>
		<th>제목</th>
		<td><%=mdto.getMv_title() %></td>
		<td rowspan="7" height="300"><img src="<%=mdto.getMv_img() %>" alt="포스터"></td>
	</tr>
	<tr>
		<th>개봉일</th>
		<td><%=mdto.getMv_openday() %></td>
	</tr>
	<tr>
		<th>장르</th>
		<td><%=mdto.getMv_genre() %></td>
	</tr>
	<tr>
		<th>예매율</th>	<%-- 해당 영화예매 / 전체 예매  --%>
		<td></td>
	</tr>
	<tr>
		<th>좋아요</th>
		<td><%=mdto.getMv_like() %></td>
	</tr>
	<tr>		<%--좋아요 , 싫어요: count 표시하기--%>
		<%
		if(memberdto!=null){	// 로그인한상태
			ReservationDAO rdao = ReservationDAO.getInstance();
			int confirmpoll = rdao.judgepoll(seq, memberdto.getM_id());	// ture : 투표했음
			if(confirmpoll == 1){		// 투표 여부 판단 : 좋아요 로 투표했음 %>
				<td colspan="2"><img src="img/like.jpg">좋아요</td>
		<%	}else if(confirmpoll == 2){ // 투표 여부 판단 : 싫요 로 투표했음 %>
				<td colspan="2"><img src="img/like.jpg">싫어요</td>
		<%	}else{						// confirmpoll==0 : 해당영화 예매 했지만, 투표안함	%>
				<td><a href="index01.jsp?poll=<%=1%>&seq=<%=mdto.getMv_seq()%>&mode=Movie/Like"><img src="img/like.jpg">좋아요</a></td>
				<td><a href="index01.jsp?poll=<%=2%>&seq=<%=mdto.getMv_seq()%>&mode=Movie/Like"><img src="img/hate.jpg">싫어요</a></td>
		<%	}
		}else{			// 로그인 안한 상태%>		
			<td><a href="index01.jsp?poll=<%=1%>&seq=<%=mdto.getMv_seq()%>&mode=Movie/Like"><img src="img/like.jpg">좋아요</a></td>
			<td><a href="index01.jsp?poll=<%=2%>&seq=<%=mdto.getMv_seq()%>&mode=Movie/Like"><img src="img/hate.jpg">싫어요</a></td>
		<%
		} %>
	</tr>
	
	<tr>
		<th colspan="3" class="leftfix">줄거리</th>
	</tr>
	<tr>
		<td colspan="3" class="leftfix"><%=mdto.getMv_story() %></td>
	</tr>
	<tr>
		<th colspan="3" class="leftfix">리뷰</th>
	</tr>
	<% 
		ReviewDAO rdao = ReviewDAO.getInstance();
		List<ReviewDTO> rlist = rdao.seereview(seq);
		for(int i = 0; i < rlist.size(); i++){	%>
			<tr>
				<td><%=rlist.get(i).getM_id() %></td>
				<td colspan="2"><b><%=rlist.get(i).getR_title() %><b></td>
			</tr>	
			<tr>
				<td colspan="3"><%=dot3(rlist.get(i).getR_content()) %></td>
			</tr>
		<%	if(i > 0) break;
		} %>	
	<tr>
		<td colspan="3"><a href="index01.jsp?mode=SNS/ReviewList">리뷰더보기</a></td>
	</tr>
</table>
</form>


</body>
</html>
