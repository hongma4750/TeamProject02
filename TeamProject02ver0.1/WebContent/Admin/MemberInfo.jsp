<%@page import="sist.co.Member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sist.co.Member.MemberDTO" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../javascript/member.js"></script>
<title>Insert title here</title>
</head>
<body>
<%!
//List<MemberDTO> memlist;

%>
<%

MemberDAO dao = MemberDAO.getInstance();
List<MemberDTO> memlist = dao.UserInfo();
%>

<%-- <%

String radioValue=request.getParameter("sort");

if(radioValue.equals("ID")){
	memlist = dao.UserInfo("ID");
}
%>
 --%>

<form action="MemberInfoAf.jsp">
<table border="1" width ="60%">
	<tr>
		<th>No.</th>
		<th>ID
			<input type="radio" name="sort" value="m_id"/>			
		</th>
		<th>이름
			<input type="radio" name="sort" value="m_name"/>
		</th>
		<th>Email</th>
	</tr>
	
	<%
	
	
	if(session.getAttribute("memlist") !=null){
		memlist = (ArrayList<MemberDTO>)session.getAttribute("memlist");
	}
	for(int i = 0; i<memlist.size();i++){
		
		MemberDTO memdto = memlist.get(i);
	%>	
	<tr>
		<td><%=i+1 %></td>
		<td><%=memdto.getM_id() %></td>
		<td><%=memdto.getM_name()%></td>
		<td><%=memdto.getM_email()%></td>
	</tr>
	<%}%>
</table>
<input type='submit' value="정렬">
</form>
</body>
</html>