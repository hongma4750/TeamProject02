  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<%@page import="sist.co.Member.MemberDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<link href="../css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="css/mypage.css"/>
<link rel = "stylesheet" href = "http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script type="text/javascript" src="javascript/member.js"></script>

</head>
<body>
<%
Object ologin  = session.getAttribute("login");
MemberDTO mem = null;
if(ologin==null){
	%>
	<script>
	alert('로그인 하십시오');
	location.href="index01.jsp";
	</script>
	<%
	return;
}
mem = (MemberDTO)ologin;
%>

<header1>

</header1>

<nav1>
<a href ="index01.jsp?mode=MyPage/Index"><h4><b>마이시네마</b></h4></a>

   &nbsp;&nbsp;<a href = "index01.jsp?mode=MyPage/LoginUpdate">회원정보</a><br>
  

  &nbsp;&nbsp;<a href = "index01.jsp?mode=MyPage/Ticket">내 티켓</a><br>
  
 
  &nbsp;&nbsp;<a href = "index01.jsp?mode=MyPage/MovieHistory">나의 관람 영화</a><br>
</nav1>

<section1>


<form action="index01.jsp?mode=MyPage/UpdateMemInfoAF" method= "post"  enctype="multipart/form-data">


		<div class="form-group" >
			<label for="exampleInputName2">아이디</label>&nbsp;&nbsp;&nbsp;&nbsp;
   			 <input type="text" class="form-control" id="exampleInputName2" value = "<%=mem.getM_id() %>" readonly="readonly" name = "id" style="width:40%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   			 <input type="hidden" name="id">
    		
    		<br><br>
    		
    		
    		<label for="exampleInputName2">비밀번호</label>&nbsp;&nbsp;&nbsp;&nbsp;
   			 <input type="password" class="form-control" id="exampleInputPassword3" name = "upw" size="20" placeholder="수정가능" value = "<%=mem.getM_pw() %>" style="width:40%;">
    		<br><br>
    		
 
    		<label for="exampleInputName2">이름</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   			 <input type="text" class="form-control" id="exampleInputName2" name = "name" readonly="readonly" value = "<%=mem.getM_name()%>" style="width:40%;">
    		<br><br>
    		
    		
    		<label for="exampleInputEmail1">이메일 주소</label>&nbsp;&nbsp;
    		<input type="email" class="form-control" id="exampleInputEmail1" placeholder="수정가능" name = "uemail" value = "<%=mem.getM_email() %>"style="width:40%;">
    		<br><br>
    	
    		<img src="<%=mem.getM_photo() %>" alt="img/no_image.gif" class="img-thumbnail" style="width:140px;height:140px;" id="imgimg"><br><br>
    		<input type="file" id="exampleInputFile" name="uphoto" onchange="readURL(this)">
    		<input type="button" value="삭제" onclick="deleteURL()">

    		<br><br><br>
    		<hr>
    		<input type="submit" value="수정">
    		<input type="reset" value="리셋">
    		<input type="button" value="취소" onclick="location.href='index01.jsp?mode=body'">
    	
    	</div>
    		  		
    		  		
    		  		
	</form>
	
<script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgimg').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        
        function deleteURL(){
        	$('#imgimg').attr('src','img/no_image.gif');
        	$('#exampleInputFile').val("");
        }
</script>



<form action="index01.jsp?mode=MyPage/OutMem" method= "post">
<input type = "submit" name = "Btn_Out" value = "탈퇴" />
</form>



</section1>

<footer1>
<!-- Copyright@우리조 -->
</footer1>

</body>
</html>