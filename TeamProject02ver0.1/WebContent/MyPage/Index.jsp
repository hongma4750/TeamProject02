 <%@page import="sist.co.Member.MemberDTO,sist.co.Member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="css/mypage.css"> 
<script type="text/javascript" src="javascript/member.js"></script>


</head>
<body> 

<%
Object ologin  = session.getAttribute("login");
MemberDTO mem = null;
if(ologin==null){
	%>
	<script>
	alert('로그인 하십시오');
	location.href="index01.jsp";
	</script>
	<%
	return;
}
mem = (MemberDTO)ologin;
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




<a href = "index01.jsp?mode=MyPage/Ticket"><h3>내 티켓 바로가기</h3></a><br><br>


</section1>

<footer1>

</footer1> 



</body>
</html>