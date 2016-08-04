<%@page import="sist.co.Theater.TheaterDAO"%>
<%@page import="sist.co.Theater.TheaterDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AddTheaterAf</title>
<style>
table {
	border-collapse: collapse;
	border: 1px solid black;
	width: 700px;	
}
th,td{
	border-collapse: collapse;
	border: 1px solid black;
	text-align: center;
	height: 200px;
	font-size: 40px;
	font-weight: bold;
}
</style>
</head>
<body>

<%
String th_name = request.getParameter("th_name");
System.out.println("th_name:" + th_name);
String sdata = request.getParameter("data");
int data = Integer.parseInt(sdata);
System.out.println("data:" + data);

/* String sth_totalseat = request.getParameter("th_totalseat");	// 숫자가 아닐경우..alert
int th_totalseat = Integer.parseInt(sth_totalseat);
System.out.println("th_totalseat:" + th_totalseat); */

TheaterDAO thdao = TheaterDAO.getInstance();
int selectvalue[] = new int[data];
int th_totalseat[] = new int[data];
for(int i = 0; i < data; i++){
	selectvalue[i] = Integer.parseInt(request.getParameter(String.valueOf(i+1)));
	th_totalseat[i] = Integer.parseInt(request.getParameter("th_totalseat"+String.valueOf(i+1)));
	//System.out.println("selectvalue["+i+"]:"+selectvalue[i]+",th_totalseat["+i+"]:"+th_totalseat[i]);
	TheaterDTO thdto = new TheaterDTO();
	thdto.setTh_name(th_name);
	thdto.setTh_cinema((i+1)+"관");
	thdto.setTh_num(selectvalue[i]);
	thdto.setTh_totalseat(th_totalseat[i]);
	if(!thdao.addTheater(thdto)){%> 
		<script type="text/javascript">
			alert("지점 등록에 실패했습니다");
			location.href = "admin.jsp?mode=Admin/add/AddTheater";
		</script>
<%		//break;
	}
}%>

<script type="text/javascript">
	alert("등록 성공!");
	location.href="../../admin.jsp"
</script>

</body>
</html>