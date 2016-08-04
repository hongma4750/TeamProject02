package sist.co.AddMovie;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class FileDownloader extends HttpServlet {
	
	private static final long serialVersionUID = 4908298571553227744L;
    
    private static final int BUFFER_SIZE = 8192; // 8kb

  
    private    ServletConfig mConfig = null;

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        mConfig=config;
    }

  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doPost(request, response);
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
  	
	request.setCharacterEncoding("utf-8");		  
	  
  	String filename = new String(request.getParameter("filename").getBytes("8859_1"),"KSC5601");
  	
  	String spdsid=request.getParameter("pdsid");
  	int pdsid=Integer.parseInt(spdsid);
  	
  	BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());

      try {
              String filePath ="";
             
              // filePath ="C:\\upload";
              
              if (spdsid!= null){
                   filePath =mConfig.getServletContext().getRealPath("/upload");
              }
              
             filePath = filePath + "\\" + filename;
             
             File f = new File(filePath);			
             System.out.println(filePath);
             if (f.exists() && f.canRead()) {
            	
             response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\";");
            
             response.setHeader("Content-Transfer-Encoding", "binary;");
             response.setHeader("Content-Length", "" + f.length());
             response.setHeader("Pragma", "no-cache;");
             response.setHeader("Expires", "-1;");

	          System.out.println("download");
	          BufferedInputStream fileInput = new BufferedInputStream(new FileInputStream(f));
	          byte buffer[] = new byte[BUFFER_SIZE]; //Limited in FileIO.SWF....
	
	          int read = 0;
	
	           while ((read = fileInput.read(buffer)) != -1) {
	              out.write(buffer, 0, read);
	           }
	          fileInput.close();				
	          out.flush();
	           System.out.println("download end");
	      }
	      else {
	          System.out.println("not found");
	          request.setAttribute("dir", f.getParent());
	          request.setAttribute("error", "File "+f.getAbsolutePath()+
	                  " does not exist or is not readable on the server");
	      }
      }
      catch(Throwable e) {      	
           //e.printStackTrace(System.err);

      } finally{
      	
          if( out != null){
              out.flush();
              out.close();
          }
      }
  }
}






