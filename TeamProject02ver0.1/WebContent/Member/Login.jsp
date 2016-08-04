<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>

<div class="loginA">
	<h1>Login</h1>
    <form method="post" action="Member/LoginAF.jsp">
    	<input type="text" name="m_id" required="required" placeholder="Your ID"/>  <!-- required : 값이 입력되었는지 체크 -->
        <input type="password" name="m_pw" required="required" placeholder="Your password"/> 
        <button type="submit" class="btn-set">로그인</button>

        <button type="button" class="btn-set" onclick="location.href='index01.jsp?mode=Member/Join'">회원가입</button>

    </form>
</div>



</body>
</html>