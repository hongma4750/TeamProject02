<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="sist.co.Member.h_DAO" %>
    <%@ page import="sist.co.Member.MemberDTO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
여기는 SNS입니다.

<%
MemberDTO memberdto = new MemberDTO();
memberdto.setM_id("hong");
memberdto.setM_pw("1234");
memberdto.setM_name("hong");
memberdto.setM_email("ddd");

h_DAO hdao = h_DAO.getInstance();
int result = hdao.addMember(memberdto);

%>
결과 : <%=result %>
</body>
</html> 