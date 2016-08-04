 <%--톰캣에서 파일사용할때 쓰는것// org.apache:아파치소속--%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="sist.co.AddMovie.AddMovieDTO"%>
<%@page import="java.text.*"%>
<%@page import="java.util.Date"%>
<%@ page import ="org.apache.commons.fileupload.disk.DiskFileItemFactory"%> 
<%@ page import ="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import ="org.apache.commons.fileupload.FileItem"%>
<%@ page import ="org.apache.commons.fileupload.ProgressListener"%>

<%@ page import="sist.co.AddMovie.AddMovieDAO"%>

<%@page import="java.io.PrintWriter"%> 
<%@page import="java.util.Enumeration"%> 
<%@page import="com.oreilly.servlet.*"%> 
<%@page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*" %>
<%@page import="java.io.*" %>

<!DOCTYPE html>
<%-- <%!
public Date convertStringToDate(String dateString)
{
	Date df;
	System.out.println("df임~~~~~~~~~~~~~~~~~~~~~~~");
    try{
    	System.out.println("try임~~~~~~~~~~~~~~~~~~~~~~~");
    	df = new SimpleDateFormat("yyyy/MM/dd").parse(dateString);
    	
    	
    	System.out.println("df임"+df);
    }
    catch ( Exception ex ){
    	df= null;
        System.out.println(ex);
    }
    return df;
}
%> --%>
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


request.setCharacterEncoding("UTF-8");

int maxSize  = 1024*1024*10;        

// 웹서버 컨테이너 경로
String root = request.getSession().getServletContext().getRealPath("/");
	/* String root = "C:/tmp/"; */
// 파일 저장 경로(ex : /home/tour/web/ROOT/upload)
String savePath = root +"movie_img";
	
// 업로드 파일명
String uploadFile = "";

// 실제 저장할 파일명
String newFileName = "";

String saveFolder = savePath;
File targetDir = new File(saveFolder);

if(!targetDir.exists()){
	targetDir.mkdirs();
}

savePath +="/";
int read = 0;
byte[] buf = new byte[1024];
FileInputStream fin = null;
FileOutputStream fout = null;



//실제 파일 업로드 부분
 try{
	 MultipartRequest m = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	 
	 //request객체의 getparameter메소드를 이용 폼에서 입력된 값을 받아온다.
	 //m_id = new String(m_id.getBytes("8859_1"), "UTF-8");
	 String mv_title = m.getParameter("mv_title");
	 //mv_title = new String(mv_title.getBytes("8859_1"),"UTF-8");
	 System.out.println("mv_title: " + mv_title);
	 
	 String mv_openday = m.getParameter("mv_openday");
	 //mv_openday = new String(mv_openday.getBytes("8859_1"),"UTF-8");
	 System.out.println("mv_openday: " + mv_openday);
	 
	 String mv_genre = m.getParameter("mv_genre");
	 //mv_genre = new String(mv_genre.getBytes("8859_1"),"UTF-8");
	 System.out.println("mv_genre: " + mv_genre);
	 
	 String mv_story = m.getParameter("mv_story");
	 //mv_story = new String(mv_story.getBytes("8859_1"),"UTF-8");
	 System.out.println("mv_story: " + mv_story);
	 System.out.println("dir :" +savePath);
	 
	 String realPath = "";
     System.out.println("3/5");
     
     AddMovieDAO addmdao = AddMovieDAO.getInstance();

     /* Date df =  new SimpleDateFormat("yyyy/MM/dd").parse(mv_openday);
     System.out.println("df임"+df);
      */
      
      /* SimpleDateFormat formatter = 
      new SimpleDateFormat ("yyyy-MM-dd"); 
      Date d = formatter.parse(mv_openday); 
      System.out.println("d : "+d); */
      //formatter = new java.text.SimpleDateFormat ("yyyy/MM/dd", java.util.Locale.KOREA); 
      
      
     /* Date datemvopen = convertStringToDate(mv_openday);
     System.out.println("datemvopen : "+datemvopen);
      */
     
      
      
     
     if(m.getFilesystemName("filename") != null){
     	System.out.println("1/8");
     	String[] ex = savePath.split("wtpwebapps");		//파일 경로 수정 요망
     	System.out.println("2/8");
     	String fileName2 = m.getFilesystemName("filename");
     	System.out.println("3/8");
     	
     	System.out.println("ex[0] = "+ex[0]);
     	System.out.println("ex[1] = "+ex[1]);
     	
         realPath = ex[1]+mv_title+fileName2.substring(fileName2.lastIndexOf("."));
         
         System.out.println("4/8");
         System.out.println("realPath = "+realPath);
         System.out.println("5/8");
     }
	 
     
     if(m.getOriginalFileName("filename") !=null){
     	System.out.println("2/6");
     	String fileName = m.getFilesystemName("filename");
     	// 파일업로드
     	System.out.println("3/6");
         uploadFile = m.getOriginalFileName("filename");
         // 실제 저장할 파일명(ex : 20140819151221.zip)
         newFileName = mv_title;
  
         System.out.println("4/6");
         // 업로드된 파일 객체 생성
         File oldFile = new File(savePath + uploadFile);
         System.out.println("5/6");
         // 실제 저장될 파일 객체 생성
         File newFile = new File(savePath + mv_title+fileName.substring(fileName.lastIndexOf(".")));
         System.out.println("개빡친다 : "+savePath + mv_title+fileName.substring(fileName.lastIndexOf(".")));
         System.out.println("위치 : "+(savePath + newFileName));
         // 파일명 rename
         if(!oldFile.renameTo(newFile)){
  
             // rename이 되지 않을경우 강제로 파일을 복사하고 기존파일은 삭제
  
             buf = new byte[1024];
             fin = new FileInputStream(oldFile);
             fout = new FileOutputStream(newFile);
             read = 0;
             while((read=fin.read(buf,0,buf.length))!=-1){
                 fout.write(buf, 0, read);
             }
              
             fin.close();
             fout.close();
             oldFile.delete();
     	}
         
      	 boolean isS = addmdao.addMovie(new AddMovieDTO(mv_title, mv_openday, mv_genre, mv_story, realPath));
         
     }
     /* Enumeration files=m.getFileNames();         
     String file =(String)files.nextElement(); 
     System.out.println("mv_title -> "+mv_title);  */
	 /* //업로드한 파일들을 Enumeration타입으로 반환한다.
	 Enumeration files=m.getFileNames();         
     String file =(String)files.nextElement(); 
     filename=m.getFilesystemName(file); //저장될 이름이다.
     
     String ofile1 =  m.getOriginalFileName("file"); //원본파일 이름이다. */

 } catch(Exception e) {
  e.printStackTrace();
 }


%>
<script type="text/javascript">
	location.href="admin.jsp?mode=Admin/AddMovie/AddMovie"
</script>
<title>Insert title here</title>
</head>
<body>




</body>
</html>