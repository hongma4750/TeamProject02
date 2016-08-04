<%--톰캣에서 파일사용할때 쓰는것// org.apache:아파치소속--%>
<%@page import="sist.co.AddMovie.AddMovieDTO"%>
<%@page import="java.text.*, java.sql.*"%>
<%@ page import ="org.apache.commons.fileupload.disk.DiskFileItemFactory"%> 
<%@ page import ="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import ="org.apache.commons.fileupload.FileItem"%>
<%@ page import ="org.apache.commons.fileupload.ProgressListener"%>

<%@ page import="sist.co.AddMovie.AddMovieDAO"%>

<%@page import="java.io.PrintWriter"%> 
<%@page import="java.util.Enumeration"%> 
<%@page import="com.oreilly.servlet.*"%> 
<%@page import="com.oreilly.servlet.multipart.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
</head>
<body>

<%
//어드민으로 로그인했을 때!!

%>

<%
 request.setCharacterEncoding("utf-8");

String dir = application.getRealPath("/upload");
out.println("경로:"+dir +"<br>");
int max =10*1024*1024; // 업로드 파일의 최대 크기 지정 
String mv_title = "";
String mv_openday = "";
String mv_genre = "";
String mv_story = "";
String filename = "";
 
//실제 파일 업로드 부분
 try{
	 MultipartRequest m = new MultipartRequest(request, dir, max, "utf-8", new DefaultFileRenamePolicy());
	 
	 //request객체의 getparameter메소드를 이용 폼에서 입력된 값을 받아온다.
	 mv_title = m.getParameter("mv_title");
	 System.out.println("mv_title: " + mv_title);
	 
	 mv_openday = m.getParameter("mv_openday");
	 System.out.println("mv_openday: " + mv_openday);
	 
	 mv_genre = m.getParameter("mv_genre");
	 System.out.println("mv_genre: " + mv_genre);
	 
	 mv_story = m.getParameter("mv_story");
	 System.out.println("mv_story: " + mv_story);
	 
	 //업로드한 파일들을 Enumeration타입으로 반환한다.
	 Enumeration files=m.getFileNames();         
     String file =(String)files.nextElement(); 
     filename=m.getFilesystemName(file); //저장될 이름이다.
     
     String ofile1 =  m.getOriginalFileName("file"); //원본파일 이름이다.

 } catch(Exception e) {
  e.printStackTrace();
 }

AddMovieDAO addmdao = AddMovieDAO.getInstance();

/* SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMdd");
Date d_mv_openday = transFormat.parse(mv_openday); */
java.sql.Date date=java.sql.Date.valueOf("mv_openday");

boolean isS = addmdao.addMovie(new AddMovieDTO(mv_title, date, mv_genre, mv_story, dir));
%>
<title>Insert title here</title>
</head>
<body>
<%
if(isS){
	%>
	<script type="text/javascript">
	alert="영화 추가를 성공했습니다.";
	location.href="admin.jsp?mode=Admin/Index";	
	</script>
	<%
}else{ 
	%>
	<script type="text/javascript">
	alert="영화 추가를 실패했습니다.";
	location.href="admin.jsp?mode=Admin/Index";	
	</script>
<%
}
%>


</body>
</html>