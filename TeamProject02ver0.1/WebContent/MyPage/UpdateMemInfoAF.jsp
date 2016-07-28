<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="sist.co.Member.MemberDTO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="../css/testmypage.css"/>
<link rel = "stylesheet" href = "http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">


</head>
<body>
 
<%
MemberDTO memberdto = new MemberDTO();
memberdto.setM_id("BomBom");
memberdto.setM_pw("1234");
memberdto.setM_name("Bom");
memberdto.setM_email("ddd");

session.setAttribute("login",memberdto);

//회원수정 페이지값
String u_pw = request.getParameter("pw");
String u_email = request.getParameter("email");

%>
<header>
<h5><%=memberdto.getM_name() %>님 반갑습니다!</h5>
</header>

<nav>
<a href ="Index.jsp"><h4><b>마이시네마</b></h4></a>
  <h4>내 정보관리</h4></a>
  &nbsp;&nbsp;<a href = "UpdateLogin.jsp">회원정보</a><br>
  
  <h4>예매내역</h4></a>
  &nbsp;&nbsp;<a href = "Ticket.jsp">내 티켓</a><br>
  
  <h4>무비 히스토리</h4></a>
  &nbsp;&nbsp;<a href = "MovieHistory.jsp">나의 관람 영화</a><br>
</nav>

<section> <%
//이전값과 현재 입력값이 다르면 수정 가능
if(!u_pw.equals(memberdto.getM_pw())||!u_email.equals(memberdto.getM_email())){
   if(true){ //수정값이 DAO에 잘 들어 가면	//////////
	%> <script type="text/javascript">
		location.href = "UpdateMemberInfo.jsp";
	</script> <%
   }else{
	%> <script type="text/javascript">
		alert("패스워드를 다시 확인하세요.");
		location.href = "UpdateLogin.jsp";
	</script> <%
   }
}
%>

</section>

<footer>
Copyright@우리조
</footer>


</body>
</html>