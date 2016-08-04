
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
//admin 로그인일때
//세션을 통해 로그인 유저 정보취득하는 dto
MemberDTO user = new MemberDTO();
user.setM_id("test");
user.setM_pw("test");
user.setM_name("테스트어드민");
user.setM_photo(" ");
user.setM_email("test@test.com");

%>

<section1 align = "left"> 
<form action="Admin/AddMovie/AddMovieAF.jsp" method = "post" enctype = "multipart/form-data">

<table align = "center" >
<tr>
  <td colspan="2" style="text-align: center"><h4>영화추가<hr></h4></td>
</tr>

<tr>
  <td width="100px">아이디</td><td><input type = "text" name = "id" value="<%=user.getM_id() %>"  size="40" readonly="readonly"/></td>
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
  <td colspan="2"><textarea rows="15" cols="56" name = "mv_story" value=""></textarea></td>
</tr>

<tr>
  <td colspan="2">&nbsp;</td>
</tr>

<tr>
  <td>포스터</td><td><input type = "file" name = "fileload" value="" size="40"/></td>
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