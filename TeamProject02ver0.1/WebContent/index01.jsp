 <%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 
<script type="text/javascript" src="javascript/member.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">

</head>
<body>


<div id="container">
	
	<div id="action">
		
		<c:if test="${ login!=null}">
			<c:choose>
				<c:when test="${login.m_photo == ' '}">
					<img src="img/no_image.gif" alt="이미지없음" width="70px" height="50px">
				</c:when>
				<c:when test="${login.m_photo != ' ' }">
					<img src="${login.m_photo }" alt="이미지없음" width="70px" height="50px">
				</c:when>
			</c:choose>
			
			[${login.m_id }] 님 안녕하세요
			
			<a href="index01.jsp?mode=MyPage/Index">마이페이지</a>&nbsp;&nbsp;
			<a href="index01.jsp?mode=Member/logout" onclick="return checkLogout()">로그아웃</a>&nbsp;&nbsp;
		</c:if>
		
		<c:if test="${ login==null}">
			<a href="index01.jsp?mode=Member/Login">로그인</a>&nbsp;&nbsp;
			<a href="index01.jsp?mode=Member/Join">회원가입</a>&nbsp;&nbsp;
			<a href="#">ID찾기</a>&nbsp;&nbsp;
			<a href="#">PW찾기</a>
		</c:if>
	</div>
	
	<div id="nav">
		<nav class="navbar navbar-inverse">

    	<ul class="nav nav-tabs">
	  		<li role="presentation" class="active"><a href="index01.jsp?mode=body">Home</a></li>
	  		<li role="presentation"><a href="index01.jsp?mode=Movie/MovieList">영화</a></li>
	  		<li role="presentation"><a href="index01.jsp?mode=Movie/Reserve">예매</a></li>
	  		<li role="presentation"><a href="index01.jsp?mode=SNS/ReviewList">리뷰</a></li>
	  		
		</ul>
		
		</nav>
	</div>
	
	<div id="contents">
	
		<c:if test="${param.mode eq null}">
			<script type="text/javascript">
				location.href="index01.jsp?mode=body";
			</script>
		</c:if>
	
	
		<c:if test="${param.mode != null }">
			<jsp:include page="${param.mode}.jsp" flush="false"/>	
		</c:if>
		
	</div>
	
</div>

</body>
</html>