<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="sist.co.Member.MemberDAO"%>
<%@ page import="sist.co.Member.MemberDTO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
MemberDAO dao = MemberDAO.getInstance();
String radioValue = request.getParameter("sort");
System.out.println("radioValue = " + radioValue);

List<MemberDTO> memlist = dao.UserInfo(radioValue);

session.setAttribute("memlist",memlist);
%>

<script type="text/javascript">
	location.href="MemberInfo.jsp";
</script>

</body>
</html>