<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "sist.co.Member.MemberDTO, sist.co.Member.MemberDAO"%>    
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>RegiAf/title>
</head>
<body>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String name = request.getParameter("name");
String email = request.getParameter("email");

MemberDAO dao = MemberDAO.getInstance();
MemberDTO dto = new MemberDTO();

dto.setM_id(id);
dto.setM_pw(pw);
dto.setM_name(name);
dto.setM_email(email);

boolean isS = dao.AddMember(dto);
if(isS){
%>
	<script type="text/javascript">
		alert("성공적으로 가입했습니다");
		location("index.jsp");
	</script>
<%}
else{
%>
	<script type="text/javascript">
		alert("다시 기입하십시오");
		location("Regi.jsp");
	</script>
<%}%>


</body>
</html>