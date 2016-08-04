 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="sist.co.Theater.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	String th_name = request.getParameter("th_name");
	String th_cinema = request.getParameter("th_cinema");
	String th_s_date = request.getParameter("th_s_date");
	String th_e_date = request.getParameter("th_e_date");
	int mv_seq = Integer.parseInt(request.getParameter("mv_seq"));
	int th_num = Integer.parseInt(request.getParameter("th_num"));
	String th_time = request.getParameter("th_time");
	
	TheaterDAO dao = TheaterDAO.getInstance();
	int th_seq = dao.findTh_seq(th_name, th_cinema, th_num);
	
	System.out.println("zz : "+th_s_date);
	Timestamp s = java.sql.Timestamp.valueOf(th_s_date);
	Timestamp e = java.sql.Timestamp.valueOf(th_e_date);
	Timestamp time = java.sql.Timestamp.valueOf(th_time);
	
	TheaterDTO dto = new TheaterDTO();
	
	dto.setTh_seq(th_seq);
	dto.setTh_s_date(s);
	dto.setTh_time(time);
	dto.setTh_e_date(e);
	dto.setMv_seq(mv_seq);
	
	dao.updateForm(dto);
%>

<script type="text/javascript">
	alert("변경완료!");
	location.href="../../admin.jsp?mode=Admin/showMovie/ShowMovie"
</script>
</body>
</html>