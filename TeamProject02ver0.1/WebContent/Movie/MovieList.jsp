<%@page import="sist.co.Member.MemberDTO"%>
<%@page import="sist.co.Movie.MovieDAO"%>
<%@page import="sist.co.Movie.MovieDTO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../javascript/member.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/main.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/mypage.css"> 

</head>
<body>

<header1>

</header1>

<section1> 

<%
MemberDTO memberdto = new MemberDTO();
 memberdto.setM_id("bom");
memberdto.setM_pw("123");
memberdto.setM_name("봄이");
memberdto.setM_email("b@b.b");
memberdto.setM_auth(3); 
session.setAttribute("login",memberdto);

MovieDAO mdao = MovieDAO.getInstance();
%>

<form action="" method = "get" >

<%
List<MovieDTO> mlist = mdao.getInfoMovieList();
if(mlist.size() == 0){ //내역이 없을때
	%>
	<p style = "text-align: center">영화 정보가 없습니다.</p>	
	<%
}
%>

<%
for(int i=0;i<mlist.size();i++){
	MovieDTO mdto = mlist.get(i);

	if(mlist.size() == 0){ //내역이 없을때
		%>
		영화 정보가 없습니다.
		<%
	}else{ //내역이 있을 때
		%>

<table>
  <tr>
    <col width="80"/><col width="80"/><col width="150"/><col width="30"/>
    <td rowspan="3" valign="top" style="padding:30px;"><img src = "<%=mdto.getMv_img() %>" name = "MvPoster"/></td>  
    <td><h1>♥</h1></td>
    <td><%=mdto.getMv_like() %></td>
    <td><a href = "index01.jsp?seq=<%=mdto.getMv_seq()%>&mode=Movie/Moviedetail">예매</a></td>
  </tr>
  
  <tr><td colspan = "3"><h4><b><%=mdto.getMv_title() %></b></h4></td></tr>

  <tr> 
    <td>개봉일</td>
    <td colspan="2"><%=mdto.getMv_openday() %></td>
  </tr>
 
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

</footer1> 


</body>
</html>