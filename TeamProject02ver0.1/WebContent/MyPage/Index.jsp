<%@ page import = "sist.co.Member.Test_MemberDTO" %>
<%@ page import = "sist.co.Member.Test_MemberDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/testmypage.css">

</head>
<body>

<%
String Test_Name = "봄이";
session.setAttribute("TestLogin", Test_Name);

String id = request.getParameter("id");
String pw = request.getParameter("pw");

Test_MemberDAO dao = Test_MemberDAO.getInstance();
Test_MemberDTO mem = dao.login(dto)

if(mem !=null && !mem.getId().equals("")){
	session.setAttribute("login", mem); //login통해 mem정보를 받을수 있다 (session 서버를 통해)
	session.setMaxInactiveInterval(30*60);
	%>
	<script type="text/javascript">
	alert("안녕하세요 <%=mem.getName()%>님!");
	location.href="bbslist.jsp";
	</script>
	
	<%
}else{
	%>
	<script type="text/javascript">
	alert("아이디 패스워드를 다시 확인하세요.");
	location.href="index.jsp";
	</script>
	
	<%
	
}
	
%>
%>
<header>
<h5><%=Test_Name %>님 반갑습니다!</h5>
</header>

<nav>
<a href ="Index.jsp"><h3>마이시네마</h3></a>
  <h4>내 정보관리</h4></a>
  &nbsp;&nbsp;<a href = "MemInfo.jsp">회원정보</a><br>
  &nbsp;&nbsp;<a href = "UpdateMemInfo.jsp">회원정보수정</a><br>
  
  <h4>예매내역</h4></a>
  &nbsp;&nbsp;<a href = "Ticket.jsp">내 티켓</a><br>
  
  <h4>무비 히스토리</h4></a>
  &nbsp;&nbsp;<a href = "MovieHistory.jsp">나의 관람 영화</a><br>
</nav>

<section>
<a href = "Ticket.jsp"><h3>내 티켓 바로가기</h3></a><br><br>
</section>

<footer>
Copyright@우리조
</footer>

  

</body>
</html>