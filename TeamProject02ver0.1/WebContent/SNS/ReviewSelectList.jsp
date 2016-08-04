 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="sist.co.Member.MemberDTO" %>
     <%@ page import="sist.co.Review.ReviewDAO" %>
     <%@ page import="sist.co.Review.ReviewDTO" %>
     <%@ page import="java.util.*" %>
     <%@ page import="java.sql.*,java.text.SimpleDateFormat,java.util.Date" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
        
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


<%!
	public Integer toInt(String x){
		int a = 0;
		try{
			a = Integer.parseInt(x);
		}catch(Exception e){}
		return a;
	}
%>

<%
MemberDTO memberdto = (MemberDTO)session.getAttribute("login");
%>

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
	request.setCharacterEncoding("utf-8");
	
	/* String check = request.getParameter("check");
	String selecting = request.getParameter("selecting");
	
	ReviewDAO redao = ReviewDAO.getInstance();
	List<ReviewDTO> reList = redao.selectContent(check, selecting); */
	
	List<ReviewDTO> reList = (ArrayList<ReviewDTO>)session.getAttribute("selList");
	System.out.println("ㅎㅎ : "+reList.size());
	%>
	
	<%
		ReviewDAO redao = ReviewDAO.getInstance();
		
		 int pageno = toInt(request.getParameter("pageno"));
		 %>

		<%
		String pageobj = request.getParameter("page");
		
		int currentpage;
		if (pageobj == null) {
			currentpage = 1;
		} else {
			currentpage = Integer.parseInt(pageobj);
		}

		String check = (String)session.getAttribute("check");
		String selecting = (String)session.getAttribute("selecting");
		System.out.println("check = "+check);
		System.out.println("selecting : "+selecting);
		List<ReviewDTO> plist = redao.getPointChargePageList(currentpage,check,selecting);
		int pnum;
		int pageblock = 20;
		int block = (int) Math.ceil((double) currentpage / pageblock);
		int bstartpage = (block - 1) * pageblock + 1;
		int bendpage = bstartpage + pageblock - 1;

		pnum = (int) Math.ceil((double) reList.size() / 10);
	%>
		
			<%		   
				if(reList.size()==0){
					%>
						
						<tr>
							<td colspan="6">검색된 게시글이 없습니다.</td>
						</tr>
					
					
					<%
				}
		%>
		
		
		<%
		/* for(int i = record_start_no; i < record_start_no+page_per_record_cnt; i++){
            if(reList.size() == i) break;
            ReviewDTO redto = reList.get(i); */
			for(int i =0;i<plist.size();i++){
			ReviewDTO redto = plist.get(i);%>
			<%
				//new 사진 이용하기 위해 시간작업
				Date date = new Date();
				SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd"); 
				String year = (String)simpleDate.format(date);
				String yea = redto.getR_writedate().toString().substring(0,10);
			%>	
			<tr>
				<td><%=redto.getMv_seq()%></td>
				<td><%=redto.getM_id() %></td>
				<td>
					<a href="index01.jsp?mode=SNS/ReviewDetail&r_seq=<%=redto.getR_seq() %>">
						<%=redto.getR_title()%> <%if(year.equals(yea)){ %><img src="img/new.jpg"> <%} %>
					</a>
				</td>
				<td><%=redto.getR_writedate().toString().substring(0,10) %></td>
				<td><%=redto.getR_readcount() %></td>
				<td><%=redto.getR_like() %></td>
			</tr>
			
			<% 
		}%>
	
	
</table>
<!-- 글쓰기 버튼!!!! -->
<div style="text-align:right;">
<input type="button" value="글쓰기" onclick="location.href='index01.jsp?mode=SNS/ReviewWrite'">
</div>

	<!-- 페이징 하는 부분!!! -->
	<div align="center">
		<div>
			<nav>
				<ul class="pagination">
					<%
						if (currentpage <= 1) {
					%>
					<li class="disabled"><span aria-hidden="true">처음</span></li>
					<%
						} else {
					%>
					<li><a style="color: black;"
						href="index01.jsp?mode=SNS/ReviewList&page=1">처음</a></li>
					<%
						}
					%>

					<%
						if (currentpage <= 1) {
					%>
					<li class="disabled"><span aria-hidden="true">&laquo;</span></li>
					<%
						} else {
					%>
					<li><a style="color: black;" aria-lable="Previous"
						href="index01.jsp?mode=SNS/ReviewList&page=<%=currentpage - 1%>"><span
							aria-hidden="true">&laquo;</span></a></li>
					<%
						}
					%>

					<%
						if (bendpage > pnum) {
							bendpage = pnum;
						}
						for (int i = bstartpage; i <= bendpage; i++) {
							if (currentpage == i) {
					%>
					<li class='active'><a href="#"><%=i%></a></li>
					<%
						} else {
					%>
					<li><a style="color: black;"
						href="index01.jsp?mode=SNS/ReviewList&page=<%=i%>"><%=i%></a></li>
					<%
						}
						}
					%>

					<%
						if (currentpage >= pnum) {
					%>
					<li class="disabled"><span aria-hidden="true">&raquo;</span></a></li>
					<%
						} else {
					%>
					<li><a style="color: black;" aria-lable="Next"
						href="index01.jsp?mode=SNS/ReviewList&page=<%=currentpage + 1%>"><span
							aria-hidden="true">&raquo;</span></a></li>
					<%
						}
					%>
					<%
						if (currentpage >= pnum) {
					%>
					<li class="disabled"><span aria-hidden="true">끝</span></li>
					<%
						} else {
					%>
					<li><a style="color: black;"
						href="index01.jsp?mode=SNS/ReviewList&page=<%=pnum%>">끝</a></li>
					<%
						}
					%>
				</ul>
			</nav>

		</div>

	</div>
	<!-- 페이징 하는 부분!!! -->
	
	<!-- 검색 기능 부분!!!!! -->
	<form action="SNS/ReviewSelect.jsp">
	<div style="text-align:center; ">
		 <select name="check">
			<option value="1">제목</option>
			<option value="2">본문</option>
		</select>
		
    	<input type="text" placeholder="검색내용" name="selecting">
  		
		<input type="submit" name="findBtn" value="검색">
	</div>
	</form>

</div>



<hr>

</body>
</html>