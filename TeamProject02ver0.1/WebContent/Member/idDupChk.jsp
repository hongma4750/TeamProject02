<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "sist.co.Member.MemberDTO, sist.co.Member.MemberDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	MemberDAO dao = new MemberDAO();
	boolean iddupchk = dao.IdDuple(id);
	
	if(!iddupchk){
		%>
		<script type="text/javascript">
			alert("가입 가능한 아이디 입니다");
			location("Regi.jsp");
		</script>
	<%}
	else{%>
		<script type="text/javascript">
			alert("이미 존재하는 아이디 입니다");
			location("Regi.jsp");
		</script>
	<%} %>
</body>
</html>