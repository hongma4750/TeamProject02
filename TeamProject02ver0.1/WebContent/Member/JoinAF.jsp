 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="java.io.*" %>

<%@page import="java.text.SimpleDateFormat" %>


<%@page import="sist.co.Member.MemberDAO" %>
<%@page import="sist.co.Member.MemberDTO" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
 	
    // 10Mbyte 제한
    int maxSize  = 1024*1024*10;        
 
    // 웹서버 컨테이너 경로
    String root = request.getSession().getServletContext().getRealPath("/");
 	/* String root = "C:/tmp/"; */
    // 파일 저장 경로(ex : /home/tour/web/ROOT/upload)
    String savePath = root +"face";
 	
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
    
    
    long currentTime = System.currentTimeMillis();  
    SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");  
 	
    try{
        MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
      
        System.out.println("1/5");
        // 전송받은 parameter의 한글깨짐 방지
        String m_id = multi.getParameter("m_id");
        //m_id = new String(m_id.getBytes("8859_1"), "UTF-8");
        
        String m_pw = multi.getParameter("m_pw");
        //m_pw = new String(m_pw.getBytes("8859_1"), "UTF-8");
        
        String m_name = multi.getParameter("m_name");
        //m_name = new String(m_name.getBytes("8859_1"), "UTF-8");
        
        String m_email = multi.getParameter("m_email");
        //m_email = new String(m_email.getBytes("8859_1"), "UTF-8");
        
        System.out.println("2/5");
        MemberDTO memberdto = new MemberDTO();
        memberdto.setM_id(m_id);
        memberdto.setM_pw(m_pw);
        memberdto.setM_name(m_name);
        memberdto.setM_email(m_email);
        
        String realPath = "";
        System.out.println("3/5");
        
        if(multi.getFilesystemName("m_photo") != null){
        	System.out.println("1/8");
        	String[] ex = savePath.split("wtpwebapps");
        	System.out.println("2/8");
        	String fileName2 = multi.getFilesystemName("m_photo");
        	System.out.println("3/8");
        	
        	System.out.println("ex[0] = "+ex[0]);
        	System.out.println("ex[1] = "+ex[1]);
            realPath = ex[1]+m_id+fileName2.substring(fileName2.lastIndexOf("."));
            System.out.println("4/8");
            System.out.println("realPath = "+realPath);
            System.out.println("5/8");
        }//찾았다이게세키야
        
        
        System.out.println("4/5");
        memberdto.setM_photo(realPath);
        MemberDAO memdao = MemberDAO.getInstance();
        
        
        int result = memdao.AddMember(memberdto);
        
        
        if(result==1){
        	
        	System.out.println("1/6");
            //받은 폴더 이름 값이 null 아닐때 파일생성
            if(multi.getOriginalFileName("m_photo") !=null){
            	System.out.println("2/6");
            	String fileName = multi.getFilesystemName("m_photo");
            	// 파일업로드
            	System.out.println("3/6");
                uploadFile = multi.getOriginalFileName("m_photo");
                // 실제 저장할 파일명(ex : 20140819151221.zip)
                newFileName = m_id;
         
                System.out.println("4/6");
                // 업로드된 파일 객체 생성
                File oldFile = new File(savePath + uploadFile);
                System.out.println("5/6");
                // 실제 저장될 파일 객체 생성
                File newFile = new File(savePath + m_id+fileName.substring(fileName.lastIndexOf(".")));
                System.out.println("개빡친다 : "+savePath + m_id+fileName.substring(fileName.lastIndexOf(".")));
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
                
                
                %>
            	
            	<script>alert("등록성공");</script>
            	
            	
            	<% 
        	
        	
        }else{
        	%>
        	<script>alert("등록실패");</script>
        	<% 
        } 
            
       
            
        }   
        
        response.sendRedirect("../index01.jsp?mode=body");
 
    }catch(Exception e){
    	System.out.println("JoinAF 이미지 관련");
        System.out.println(e.getMessage());
        response.sendRedirect("../index01.jsp?mode=body");
    }
 
    
%>
</body>
</html>