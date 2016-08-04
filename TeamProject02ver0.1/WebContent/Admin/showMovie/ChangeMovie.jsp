<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="sist.co.Movie.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	int mv_seq = Integer.parseInt(request.getParameter("mv_seq"));
	
	MovieDAO dao = MovieDAO.getInstance();
	dao.changeMovie(mv_seq,"off");
	
%>

<script type="text/javascript">
	alert("작업 성공!");
	location.href="../../admin.jsp?mode=Admin/showMovie/SelectMovie"
</script>
</body>
</html>