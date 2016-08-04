   <%@page import="test.Member.testMemberDAO"%>
   
   <%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="java.io.*" %>
   
<%@page import="sist.co.Member.MemberDTO"%>
<%@page import="sist.co.Member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="css/mypage.css"/>
<link rel = "stylesheet" href = "http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script type="text/javascript" src="javascript/member.js"></script>

</head>
<body>
 
<%
testMemberDAO dao = new testMemberDAO();

MemberDTO memberdto = new MemberDTO();
memberdto = (MemberDTO)session.getAttribute("login");

String mid = memberdto.getM_id();
String mpw = memberdto.getM_pw();
System.out.println("mpw: " +mpw);
String memail = memberdto.getM_email();
System.out.println("memail: " +memail);

String mphoto = memberdto.getM_photo(); 



//회원수정 페이지값
request.setCharacterEncoding("UTF-8");
 	
    // 10Mbyte 제한
    int maxSize  = 1024*1024*10;        
 
    // 웹서버 컨테이너 경로
    String root = request.getSession().getServletContext().getRealPath("/");
    System.out.println("root: "+root);
 	/* String root = "C:/tmp/"; */
    // 파일 저장 경로(ex : /home/tour/web/ROOT/upload)
    String savePath = root +"face";
   
 	System.out.println("savePath: "+savePath);
 
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

MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());

String u_pw = multi.getParameter("upw");
u_pw = new String(u_pw.getBytes("8859_1"), "UTF-8");

String u_email = multi.getParameter("uemail");
u_email = new String(u_email.getBytes("8859_1"), "UTF-8");

String realPath = " ";

if(multi.getFilesystemName("uphoto") != null){
	String[] ex = savePath.split("wtpwebapps");
	for(int i=0;i<ex.length;i++){
		System.out.println("ex[1]"+ex[1]);
	}
	String fileName2 = multi.getFilesystemName("uphoto");
	System.out.println("fileName2 = "+fileName2);
    realPath = ex[1]+mid+fileName2.substring(fileName2.lastIndexOf("."));
    System.out.println("realPath = "+realPath);
}



testMemberDAO memdao = testMemberDAO.getInstance();

//받은 폴더 이름 값이 null 아닐때 파일생성
if(multi.getOriginalFileName("uphoto") !=null){
	String fileName = multi.getFilesystemName("uphoto");
	// 파일업로드
    uploadFile = multi.getOriginalFileName("uphoto");
    // 실제 저장할 파일명(ex : 20140819151221.zip)
    newFileName = mid;

     
    // 업로드된 파일 객체 생성
    File oldFile = new File(savePath + uploadFile);
    
    // 실제 저장될 파일 객체 생성
    File newFile = new File(savePath + mid+fileName.substring(fileName.lastIndexOf(".")));
    System.out.println("개빡친다 : "+savePath + mid+fileName.substring(fileName.lastIndexOf(".")));
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
   
}
boolean isS = memdao.updateMember(u_pw, u_email,realPath, mid);
System.out.println("isS: " + isS);
//\TeamProject02ver0.1\face/w.jpg

%>

<header1>

</header1>

<nav1>
<a href ="index01.jsp?mode=MyPage/Index"><h4><b>마이시네마</b></h4></a>

   &nbsp;&nbsp;<a href = "index01.jsp?mode=MyPage/LoginUpdate">회원정보</a><br>
  

  &nbsp;&nbsp;<a href = "index01.jsp?mode=MyPage/Ticket">내 티켓</a><br>
  
 
  &nbsp;&nbsp;<a href = "index01.jsp?mode=MyPage/MovieHistory">나의 관람 영화</a><br>
</nav1>

<section1> <%
//이전값과 현재 입력값이 다르면 수정 가능
//if(!u_pw.equals(mpw)||!u_email.equals(memail)){
   if(isS){ //수정값이 DAO에 잘 들어 가면
	%> 
	<script type="text/javascript">
	    alert("회원정보 수정을 성공했습니다.");
	    <%
	    MemberDAO mdao = MemberDAO.getInstance();
	    memberdto = mdao.selectMemberDTO(mid);
	    session.setAttribute("login", memberdto);
	    %>
		location.href = "index01.jsp?mode=MyPage/Index";
	</script> <%
   }else{
	%> <script type="text/javascript">
		alert("회원정보 수정을 실패했습니다.");
		location.href = "index01.jsp?mode=MyPage/UpdateMemInfo";
	</script> <%
   }
//}
%>

</section1>

<footer1>
<!-- Copyright@우리조 -->
</footer1>


</body>
</html>