package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileController {
	
	private static final Logger log = LoggerFactory.getLogger(FileController.class);
	
//	@Resource(name = "uploadPath")
//	private String uploadPath;

	@RequestMapping(value = "/fileUpload.do", method = RequestMethod.POST)
	@ResponseBody
	public void ckUpload( HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload)
			throws Exception {
		OutputStream out = null;
        PrintWriter printWriter = null;
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
 
        try{
 
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();
 
            String realPath = request.getSession().getServletContext().getRealPath("/resources/images/");
            log.info("업로드경로=>"+realPath);
            
            out = new FileOutputStream(new File(realPath + fileName));
            out.write(bytes);
            
            printWriter = response.getWriter();
            String fileUrl = "/resources/images/"+fileName;//url경로
            
            printWriter.println("{");
            printWriter.println("\"uploaded\": 1,");
            printWriter.println("\"fileName\": \""+fileName+"\",");
            printWriter.println("\"url\":\""+fileUrl+"\"");
            printWriter.println("}");
	
            printWriter.flush();
 
        }catch(IOException e){
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (printWriter != null) {
                    printWriter.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
 
        return;
		
	}

}
