<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="sist.co.Member.MemberDTO" %>
     <%@ page import="sist.co.Review.ReviewDAO" %>
     <%@ page import="sist.co.Review.ReviewDTO" %>
     <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰 리스트</title>

<link rel="stylesheet" type="text/css" href="../css/style.css">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/main.css" rel="stylesheet">

</head>
<body>



<%
MemberDTO memberdto = (MemberDTO)session.getAttribute("login");
%>
<h3><%=memberdto.getM_id() %>님 하이요</h3>
<hr>

<div id="middle_wrap">
<table class="table table-bordered">
	<col width="50"/><col width="70"/><col width="200"/><col width="100"/>
	<col width="50"/><col width="50"/>
	<tr>
		<th>번호</th><th>작성자</th><th>제목</th>
		<th>작성일</th><th>조회수</th><th>좋아요</th>
	</tr>
	
	<!-- 잠깐 스탑 여기서 review dto,dao 만들어서 불러야될듯 -->
	<%
		ReviewDAO redao = ReviewDAO.getInstance();
		List<ReviewDTO> reList = redao.selectAllReview();
		
		for(int i =0;i<reList.size();i++){
			ReviewDTO redto = reList.get(i);%>
			
			<tr>
				<td><%=redto.getR_seq() %></td>
				<td><%=redto.getM_id() %></td>
				<td>
					<a href="index01.jsp?mode=SNS/ReviewDetail&r_seq=<%=redto.getR_seq() %>">
						<%=redto.getR_title() %>
					</a>
				</td>
				<td><%=redto.getR_writedate() %></td>
				<td><%=redto.getR_readcount() %></td>
				<td><%=redto.getR_like() %></td>
			</tr>
			
			<% 
		}%>
	
	
</table>

<input type="button" value="글쓰기" onclick="location.href='index01.jsp?mode=SNS/ReviewWrite'">
</div>



<hr>

</body>
</html>