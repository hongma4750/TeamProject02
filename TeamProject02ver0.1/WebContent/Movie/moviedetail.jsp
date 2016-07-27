<%@page import="sist.movie.MovieDTO"%>
<%@page import="sist.movie.MovieDAO"%>
<%@page import="sist.co.Member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
/* MemberDTO mem = (MemberDTO)session.getAttribute("login"); */
Object ologin = session.getAttribute("login");
MemberDTO mem = null;
if(ologin==null){
	System.out.println("session empty");
}else{
	mem = (MemberDTO)ologin;
}

String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq);
System.out.println("seq = " + seq);

MovieDAO dao = MovieDAO.getInstance();
MovieDTO mdto = dao.getmoviedetail(1); 

%>

<form action="Reserve.jsp">
<table border="1">
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
		<td><a href="Like.jsp?poll=<%=1%>&seq=<%=mdto.getMv_seq()%>"><img src="../img/like.jpg">좋아요</a></td>
		<td><a href="Like.jsp?poll=<%=2%>&seq=<%=mdto.getMv_seq()%>"><img src="../img/hate.jpg">싫어요</a></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="예매하기"><input type="hidden" value="<%=mdto.getMv_seq()%>"></td>
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
	<tr>
		<td colspan="3">리뷰1</td>
	</tr>
	<tr>
		<td colspan="3">리뷰2</td>
	</tr>
	<tr>
		<td colspan="3"><a href="reviewdetail.jsp">리뷰더보기</a></td>
	</tr>
</table>
</form>



































</body>
</html>
