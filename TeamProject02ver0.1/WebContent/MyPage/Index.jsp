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
//Test_MemberDTO mem = dao.login(dto);

%>
<header>
<h5><%=Test_Name %>님 반갑습니다!</h5>
</header>

<nav>
<a href ="Index.jsp"><h4><b>마이시네마</b></h4></a>

  &nbsp;&nbsp;<a href = "MemInfo.jsp">회원정보</a><br>
  &nbsp;&nbsp;<a href = "UpdateMemInfo.jsp">회원정보수정</a><br>
  

  &nbsp;&nbsp;<a href = "Ticket.jsp">내 티켓</a><br>
  
 
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