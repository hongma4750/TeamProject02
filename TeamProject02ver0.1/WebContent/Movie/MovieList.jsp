<%@page import="sist.co.Member.MemberDTO, sist.co.Member.MemberDAO"%>
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
String id = request.getParameter("id");

MemberDAO memdao =  MemberDAO.getInstance();
MemberDTO memberdto = new MemberDTO();
memberdto = memdao.selectMemberDTO(id);

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
    <col width="80"/><col width="80"/><col width="150"/>
    <td rowspan="3" valign="top" style="padding:30px;"><img src = "<%=mdto.getMv_img() %>" name = "MvPoster"/></td>  
    <td><h1>♥</h1></td>
    <td><%=mdto.getMv_like() %></td>
  </tr>
  
  <tr><td colspan = "2"><h4><b><a href = "index01.jsp?seq=<%=mdto.getMv_seq()%>&mode=Movie/MovieListdetail"><%=mdto.getMv_title() %></a></b></h4></td></tr>

  <tr> 
    <td>개봉일</td>
    <td><%=mdto.getMv_openday() %></td>
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