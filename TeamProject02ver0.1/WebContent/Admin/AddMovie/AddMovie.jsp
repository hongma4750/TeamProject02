 
<%@page import="sist.co.Member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="javascript/member.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
</head>
<body>
<%
MemberDTO memberdto = new MemberDTO();


memberdto = (MemberDTO)session.getAttribute("login");
%>


<section1 align = "left"> 
<form action="admin.jsp?mode=Admin/AddMovie/AddMovieAF" method = "post" enctype = "multipart/form-data">

<table align = "center" >
<tr>
  <td colspan="2" style="text-align: center"><h4>영화추가<hr></h4></td>
</tr>

<tr>
  <td width="100px">아이디</td><td><input type = "text" name = "id" value="<%=memberdto.getM_id() %>"  size="40" readonly="readonly"/></td>
</tr>

<tr>
  <td>제목</td><td><input type = "text" name = "mv_title" value="" size="40"/></td>
</tr>

<tr>
<td>개봉일</td><td><input type = "text" placeholder="20160101" name = "mv_openday" value="" size="40"/></td>
</tr>


<tr>
  <td>장르</td><td><input type = "text" name = "mv_genre" value="" size="40"/></td>
</tr>
<tr>
  <td colspan="2">줄거리</td>
</tr>
<tr>
  <td colspan="2">&nbsp;</td>
</tr>
<tr>
  <td colspan="2"><textarea rows="15" cols="56" name = "mv_story"></textarea></td>
</tr>

<tr>
  <td colspan="2">&nbsp;</td>
</tr>

<tr>
  <td>포스터</td><td><input type = "file" name = "filename" size="40"/></td>
</tr>

<tr>
  <td colspan="2">&nbsp;</td>
</tr>

<tr>
  <td colspan="6" style="text-align: center"><input type = "submit" name = "btnAddMovie" value = "영화추가"/></td>
</tr>
</table>

</form>
</section1>


</body>
</html>