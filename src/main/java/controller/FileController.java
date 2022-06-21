package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

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

	@RequestMapping(value = "/fileUpload.do", method = RequestMethod.POST)
	@ResponseBody
	public void ckUpload( HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload)
			throws Exception {
		PrintWriter printWriter = response.getWriter();
		OutputStream out = null;
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        
		if(upload.isEmpty()) {
			return;
		}
		
		if(upload.getSize() > 1000000) {
			printWriter.println("{");
			printWriter.println(" \"uploaded\": 0, ");
            printWriter.println(" \"error\":");
            printWriter.println("{\"message\":\"The fileSize is too big(up to 1MB)\"}");
            printWriter.println("}");
            printWriter.flush();
			new Exception("파일사이즈가 너무 큽니다");
			return;
		}
 
        try{
        	
        	DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS"); 
    		Calendar cal = Calendar.getInstance(); 
    		String time = dateFormat.format(cal.getTimeInMillis());
    		
    		String fileName = String.format("%s_%s",time,upload.getOriginalFilename());
    		
            byte[] bytes = upload.getBytes();
 
            String realPath = request.getSession().getServletContext().getRealPath("/resources/images/");
            log.info("업로드경로=>"+realPath);
            
            out = new FileOutputStream(new File(realPath + fileName));
            out.write(bytes);
            
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
