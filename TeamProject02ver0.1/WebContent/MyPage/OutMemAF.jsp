 <%@page import="sist.co.Member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@page import="test.Member.testMemberDAO"%>
<%@page import="sist.co.Member.MemberDTO"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="css/mypage.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<script type="text/javascript" src="javascript/member.js"></script>
</head>
<body>

<%
MemberDTO memberdto = new MemberDTO();


memberdto=(MemberDTO)session.getAttribute("login");

testMemberDAO dao = new testMemberDAO();
boolean isS = dao.outMember(memberdto);

System.out.println("id: "+memberdto.getM_id());

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

<%
//member DB에 해당 사용자 delete 작업한 후 
//성공시 사이트 메인페이지로 
if(isS){	
	
	%> 
	<script type="text/javascript">
	alert("탈퇴되었습니다.");
	<%
	session.invalidate();
	%>
	location.href="index01.jsp?mode=body";
	</script>
	
	<%
}else{
	%>
	<script type="text/javascript">
	alert("취소되었습니다.");
	location.href="index01.jsp?mode=MyPage/OutMem";
	</script>
	
	<%
	
}
%>


</section1>

<footer1>
<!-- Copyright@우리조 -->
</footer1>


</body>
</html>