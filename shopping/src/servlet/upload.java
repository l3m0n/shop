package servlet;

import java.io.File;
import java.io.IOException;
import java.util.*;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public upload() {
        super();

    }

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String message = "";
		File file;
		int maxFileSize = 5000 * 1024;
		   int maxMemSize = 5000 * 1024;
		   String filePath = this.getServletContext().getRealPath("/upload/");
		   
		   String contentType = req.getContentType();
		   if ((contentType.indexOf("multipart/form-data") >= 0)) {
		      DiskFileItemFactory factory = new DiskFileItemFactory();
		      // 设置内存中存储文件的最大值
		      factory.setSizeThreshold(maxMemSize);
		      // 本地存储的数据大于 maxMemSize.
		      factory.setRepository(new File(this.getServletContext().getRealPath("/upload/temp/")));

		      // 创建一个新的文件上传处理程序
		      ServletFileUpload upload = new ServletFileUpload(factory);
		      // 设置最大上传的文件大小
		      upload.setSizeMax( maxFileSize );
		      try{ 
		         // 解析获取的文件
		         List fileItems = upload.parseRequest(req);

		         // 处理上传的文件
		         Iterator i = fileItems.iterator();
		         while ( i.hasNext () ) 
		         {
		            FileItem fi = (FileItem)i.next();
		            if ( !fi.isFormField () )	
		            {
		            // 获取上传文件的参数
		            /*String fieldName = fi.getFieldName();
		            String fileName = fi.getName();
		            boolean isInMemory = fi.isInMemory();
		            long sizeInBytes = fi.getSize();*/
		            // 写入文件
		            String filename1 = new Date().getTime() + ".jpg";
					file = new File( filePath , filename1);
		            fi.write( file ) ;
		            message = "/upload/" + filename1;
		            }
		         }
		      }catch(Exception ex) {
		         System.out.println(ex);
		      }
		   }else{
			   	message = "上传失败";
		   }
		   
		   req.setAttribute("message",message);
		   req.getRequestDispatcher("/admin/main.jsp").forward(req, resp);
		   //resp.sendRedirect(req.getContextPath()+"/admin/main.jsp");
	} 
}
