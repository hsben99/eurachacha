//package controller;
//
//import java.io.File;
//import java.io.IOException;
//import java.time.LocalDateTime;
//
//import javax.annotation.Resource;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.multipart.MultipartHttpServletRequest;
//
//import dao.BoardDao;
//import dto.BoardDto;
//import dto.FileUploadVO;
//
//@Controller
//public class FileController {
//	private Logger logger = LoggerFactory.getLogger(this.getClass());
//
//	@Resource(name = "uploadPath")
//	private String uploadPath;
//	
//
//	@RequestMapping(value = "/fileUpload.do", method = RequestMethod.POST)
//	@ResponseBody
//	public Model ckUpload(@ModelAttribute("fileUploadVO") FileUploadVO fileUploadVO , HttpServletRequest request , Model model)
//			throws Exception {
//		
//	       HttpSession session = request.getSession();
////	        String rootPath = session.getServletContext().getRealPath("/");
////	        String attachPath = "upload/";
//
//	        MultipartFile upload = fileUploadVO.getUpload();
//	        String filename = "";
//	        String CKEditorFuncNum = "";
//	        
//	        if(upload != null){
//	            filename = upload.getOriginalFilename();
//	            fileUploadVO.setFilename(filename);
//	            CKEditorFuncNum = fileUploadVO.getCKEditorFuncNum();
//	            try{
//	                File file = new File(uploadPath + "/"+ filename);
//	                upload.transferTo(file);
//	            }catch(IOException e){
//	                e.printStackTrace();
//	            }  
//	        }	        
//			model.addAttribute("filePath", uploadPath + filename); // 결과값을
//			model.addAttribute("CKEditorFuncNum", CKEditorFuncNum);// jsp ckeditor 콜백함수로 보내줘야함
//			model.addAttribute("responseText", "asdfasdf");
//    
//	        return model;
//	}
//
//}
