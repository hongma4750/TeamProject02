 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="sist.co.Comment.CommentDTO" %>
    <%@ page import ="sist.co.Comment.CommentDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>   

<%
	request.setCharacterEncoding("utf-8");

	String com_seqs = request.getParameter("com_seq");
	int com_seq = Integer.parseInt(com_seqs);
	
	String r_seqs = request.getParameter("r_seq");
	int r_seq = Integer.parseInt(r_seqs);
	
	String com_content = request.getParameter("com_content");
	
	CommentDTO comdto = new CommentDTO();
	comdto.setCom_seq(com_seq);
	comdto.setR_seq(r_seq);
	comdto.setCom_content(com_content);
	
	CommentDAO comdao = CommentDAO.getInstance();
	comdao.updateComment(comdto);
	
%>

 <script type="text/javascript">
	location.href="../index01.jsp?mode=SNS/ReviewDetail&r_seq=<%=r_seq%>";
</script>

</body>
</html>