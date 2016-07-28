<%@page import="sist.co.Member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

MemberDTO memberdto = new MemberDTO();
memberdto.setM_id("BomBom");
memberdto.setM_pw("1234");
memberdto.setM_name("Bom");
memberdto.setM_email("ddd");

session.setAttribute("login",memberdto);
String pw = request.getParameter("pw");
/* 
String id = request.getParameter("id");
String pw = request.getParameter("pw");

Test_MemberDAO dao = Test_MemberDAO.getInstance();
Test_MemberDTO mem = new Test_MemberDTO();
mem.setM_Id(id);
mem.setM_Pw(pw);
mem = dao.login(new Test_MemberDTO());
 */
/* if(memberdto !=null && !memberdto.getM_id().equals("")){ */
if(pw.equals(memberdto.getM_pw())){	
	%>
	<script type="text/javascript">
	location.href="UpdateMemberInfo.jsp";
	</script>
	
	<%
}else{
	%>
	<script type="text/javascript">
	alert("패스워드를 다시 확인하세요.");
	location.href="UpdateLogin.jsp";
	</script>
	
	<%
	
}
	
%>

</body>
</html>