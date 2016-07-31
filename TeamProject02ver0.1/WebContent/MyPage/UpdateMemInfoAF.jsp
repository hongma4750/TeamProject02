 <%@page import="test.Member.testMemberDAO"%>
<%@page import="sist.co.Member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="../css/testmypage.css"/>
<link rel = "stylesheet" href = "http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<%-- --%>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/main.css" rel="stylesheet">

</head>
<body>
 
<%
testMemberDAO dao = new testMemberDAO();

MemberDTO memberdto = new MemberDTO();
memberdto.setM_id("bombom");
memberdto.setM_pw("1234");
memberdto.setM_name("Bom");
memberdto.setM_email("ddd");

session.setAttribute("login",memberdto);

String mid = memberdto.getM_id();
String mpw = memberdto.getM_pw();
System.out.println("mpw: " +mpw);
String memail = memberdto.getM_email();
System.out.println("memail: " +memail);

//회원수정 페이지값
String u_pw = request.getParameter("pw");
System.out.println("u_pw: " +u_pw);
String u_email = request.getParameter("email");
System.out.println("u_email: " +u_email);
System.out.println("mid: " +mid);

boolean isS = dao.updateMember(u_pw, u_email, mid);
//boolean isS = dao.updateMember("2222", "2222", "BOMBOM");
System.out.println("isS: " + isS);
%>

<div id="container">

	<div id="action">
		<c:if test="${ login!=null}">
			<a href="MyPage/Index.jsp">마이페이지</a>&nbsp;&nbsp;
			<a href="#">로그아웃</a>&nbsp;&nbsp;
		</c:if>
		
		<c:if test="${ login==null}">
			<a href="index01.jsp?mode=Member/hong_Login">로그인</a>&nbsp;&nbsp;
			<a href="#">회원가입</a>&nbsp;&nbsp;
			<a href="#">ID찾기</a>&nbsp;&nbsp;
			<a href="#">PW찾기</a>
		</c:if>
	</div>
	
	<div id="nav">
		<nav class="navbar navbar-inverse">
  
  
    	<ul class="nav nav-tabs">
	  		<li role="presentation" class="active"><a href="index01.jsp?mode=body">Home</a></li>
	  		<li role="presentation"><a href="#">영화</a></li>
	  		<li role="presentation"><a href="#">예매</a></li>
	  		<li role="presentation"><a href="index01.jsp?mode=SNS/ReviewList">리뷰</a></li>
	  		<li role="presentation"><a href="SNS/Index.jsp">공지사항</a></li>
		</ul>
</nav>
	</div>
	
	<div id="contents">
	
	<%-- --%>
<header1>
<h5><%=memberdto.getM_name() %>님 반갑습니다!</h5>
</header1>

<nav1>
<a href ="Index.jsp"><h4><b>마이시네마</b></h4></a>

   &nbsp;&nbsp;<a href = "LoginUpdate.jsp">회원정보</a><br>
  

  &nbsp;&nbsp;<a href = "Ticket.jsp">내 티켓</a><br>
  

  &nbsp;&nbsp;<a href = "MovieHistory.jsp">나의 관람 영화</a><br>
</nav1>

<section1> <%
//이전값과 현재 입력값이 다르면 수정 가능
//if(!u_pw.equals(mpw)||!u_email.equals(memail)){
   if(isS){ //수정값이 DAO에 잘 들어 가면
	%> 
	<script type="text/javascript">
	    alert("회원정보 수정을 성공했습니다.");
		location.href = "Index.jsp";
	</script> <%
   }else{
	%> <script type="text/javascript">
		alert("회원정보 수정을 실패했습니다.");
		location.href = "UpdateMemInfo.jsp";
	</script> <%
   }
//}
%>

</section1>

<footer1>
Copyright@우리조
</footer1>

<%-- --%>
  	</div>
	
</div>

</body>
</html>