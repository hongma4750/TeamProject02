<%@page import="sist.co.Member.Test_MemberDAO"%>
<%@page import="sist.co.Member.Test_MemberDTO"%>

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
String id = request.getParameter("id");
String pw = request.getParameter("pw");

Test_MemberDAO dao = Test_MemberDAO.getInstance();
Test_MemberDTO mem = new Test_MemberDTO();
mem.setM_Id(id);
mem.setM_Pw(pw);
mem = dao.login(new Test_MemberDTO());

if(mem !=null && !mem.getM_Id().equals("")){
	session.setAttribute("login", mem); //login통해 mem정보를 받을수 있다 (session 서버를 통해)
	
	%>
	<script type="text/javascript">
	alert("안녕하세요 <%=mem.getM_Name()%>님!");
	location.href="Index.jsp";
	</script>
	
	<%
}else{
	%>
	<script type="text/javascript">
	alert("아이디 패스워드를 다시 확인하세요.");
	location.href="00index00.jsp";
	</script>
	
	<%
	
}
	
%>

</body>
</html>