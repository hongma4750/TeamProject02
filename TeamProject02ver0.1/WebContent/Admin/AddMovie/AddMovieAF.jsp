<%--톰캣에서 파일사용할때 쓰는것// org.apache:아파치소속--%>
<%@page import="sist.co.AddMovie.AddMovieDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import ="org.apache.commons.fileupload.disk.DiskFileItemFactory"%> 
<%@ page import ="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import ="org.apache.commons.fileupload.FileItem"%>
<%@ page import ="org.apache.commons.fileupload.ProgressListener"%>

<%@ page import="sist.co.AddMovie.AddMovieDAO"%>

<%@ page import ="java.util.Date"%>
<%@ page import ="java.util.List"%>
<%@ page import ="java.io.File"%>
<%@ page import ="java.util.Iterator"%> <%--배열i역할을 하는 반복자 --%>
<%@ page import ="java.io.IOException"%>

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

<%!
public void processFromField(FileItem item, JspWriter out) throws IOException{
	String name = item.getFieldName();
	String value = "";
	try{
		value = item.getString("utf-8");	
	}catch(Exception e){
		value = item.getString();		
	}
}
public void processUploadFile(FileItem fileItem, String dir, JspWriter out) 
				throws IOException{
	String fieldName = fileItem.getFieldName();
	String filename = fileItem.getName();
	String contentType = fileItem.getContentType();
	long sizeInBytes = fileItem.getSize();
	
	System.out.println("size:" + sizeInBytes);
	
	// 업로드한 파일 있는 경우,
	if(sizeInBytes > 0){
		int idx = filename.lastIndexOf("\\");
		if(idx == -1){
			idx = filename.lastIndexOf("/");
		}
		filename=filename.substring(idx + 1);
		
		try{
			File uploadedFile = new File(dir, filename);
			fileItem.write(uploadedFile);
		}catch(Exception e){}
	}	
}
%>

<%
String fupload = application.getRealPath("/upload");
//String fupload = "c:\\upload";

System.out.println("fupload=" + fupload);

String yourTempDir = fupload;
int yourMaxRequestSize=100*1024*1024;
int yourMaxMemorySize=100*1024;

//String id="";
String mv_title="";
String mv_openday="";
String mv_genre="";
String mv_story="";
String filename="";

boolean isMultipart = ServletFileUpload.isMultipartContent(request);
if(isMultipart){		// form or file
	DiskFileItemFactory factory = new DiskFileItemFactory();
	
	factory.setSizeThreshold(yourMaxMemorySize);
	factory.setRepository(new File(yourTempDir));
	
	ServletFileUpload upload = new ServletFileUpload(factory);
	upload.setSizeMax(yourMaxRequestSize);
	
	List<FileItem> items = upload.parseRequest(request);
	
	Iterator<FileItem> it = items.iterator();		// <= for(int i = 0; i < 10
	while(it.hasNext()){
		FileItem item = it.next();
		
		if(item.isFormField()){
			processFromField(item, out);
			if(item.getFieldName().equals("mv_title")){
				mv_title = item.getString("utf-8");
			}else if(item.getFieldName().equals("mv_openday")){
				mv_openday = item.getString("utf-8");
			}else if(item.getFieldName().equals("mv_genre")){
				mv_genre = item.getString("utf-8");
			}
		}else{ 
			
			if(item.getFieldName().equals("fileload")){
				int idx = item.getName().lastIndexOf("\\");
				if(idx == -1){
					idx=item.getName().lastIndexOf("/");
				}
				filename = item.getName().substring(idx+1);				
			}
			processUploadFile(item, fupload, out);
		} 
	}	
}else{
	System.out.println("Multi Part가 아님");
} 


//업로드후에 DB에 저장하기

AddMovieDAO addmdao = AddMovieDAO.getInstance();

SimpleDateFormat transFormat = new SimpleDateFormat("YYYY-MM-DD");
Date d_mv_openday = transFormat.parse(mv_openday);

boolean isS = addmdao.addMovie(new AddMovieDTO(mv_title, d_mv_openday, mv_genre, mv_story, filename));

if(isS){
	%>
	<script type="text/javascript">
	alert="영화 추가를 성공했습니다.";
	location.href="index01.jsp?mode=Admin/Index";	
	</script>
	<%
}else{ 
	%>
	<script type="text/javascript">
	alert="영화 추가를 실패했습니다.";
	location.href="index01.jsp?mode=Admin/Index";	
	</script>
<%
}
%>


</body>
</html>