<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sist.co.Member.MemberDTO" %>
     <%@ page import="sist.co.Review.ReviewDAO" %>
     <%@ page import="sist.co.Review.ReviewDTO" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰 디테일</title>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
<%
MemberDTO memberdto = (MemberDTO)session.getAttribute("login");
%>

<h3><%=memberdto.getM_id() %>님 하이요</h3>
<hr>
<%

String r_seqs = request.getParameter("r_seq");
int r_seq = Integer.parseInt(r_seqs);
ReviewDAO redao = ReviewDAO.getInstance();

redao.addReadCount(r_seq);
ReviewDTO redto = redao.getReviewDTO(r_seq);

%>
<div id="middle_wrap">

	<table class="content_table">
		<tr>
			<td> <%=redto.getM_id() %> 님 작성글</td>
		</tr>
		
		<tr>
			<td><%=redto.getR_title() %>&nbsp;&nbsp;&nbsp;&nbsp;조회:<%=redto.getR_readcount() %>&nbsp;
				좋아요:<input type="text" id ="like" value="<%=redto.getR_like() %>" size="2" readonly> 
				<input type="button" value="좋아용" id="addlike">
			</td>
		</tr>
		
		<tr>
			<td><textarea rows="20" cols="50" readonly ><%=redto.getR_content()%></textarea></td>
		</tr>
		
	</table>
	<input type="button" value="돌아가기" onclick="javascript:location.href='ReviewList.jsp'">
</div>
<hr>

<script>
	var like = <%=redto.getR_like()%>;
	
    $('#addlike').click(function(){
        $.ajax({
            url:'addLike.jsp?r_seq=<%=redto.getR_seq()%>' ,
            success:function(data){
            },complete : function(data) {
            	like +=1;
            	$('#like').val(like);
          }
            
        });
    });
</script>
</body>
</html>