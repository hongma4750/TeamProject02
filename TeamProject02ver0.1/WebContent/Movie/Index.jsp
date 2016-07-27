<%@page import="sist.movie.MovieDTO"%>
<%@page import="java.util.List"%>
<%@page import="sist.movie.MovieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MovieManager mm = new MovieManager();
List<MovieDTO> list = mm.getCGVData();

//json 생성
String jsonresult = "[";
for(MovieDTO m: list){
	jsonresult += "{name:'" + m.getMv_title() + "',y:" + m.getMv_img() + "}, ";
}
jsonresult = jsonresult.substring(0, jsonresult.lastIndexOf(","));	// 맨 끝의 ',' 삭제
jsonresult += "]";

System.out.println(jsonresult);
request.setAttribute("jsonresult", jsonresult);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<title>movie_main</title>
</head>
<body>


</body>
</html>