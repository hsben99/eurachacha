package controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import dao.BoardDao;
import dto.BoardDto;

@Controller
public class WriteController {

	@Autowired
	BoardDao boardDao;

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	@ResponseBody
	public boolean write(MultipartHttpServletRequest fileRequest) {
		BoardDto boardDto = new BoardDto();
		boardDto.setTitle(fileRequest.getParameter("title"));
		boardDto.setSubTitle(fileRequest.getParameter("subTitle"));
		boardDto.setContent(fileRequest.getParameter("content"));
		boardDto.setDeleteYn("N");
		boardDto.setCategory(fileRequest.getParameter("category"));
		if (boardDao.insertBoard(boardDto) > 0) {
			return true;	
		}
		return false;
		
		
	}

	@RequestMapping(value = "/moveWritePage", method = RequestMethod.GET)
	public String writePage(Locale locale, Model model, HttpSession session) {

		// 로그인 확인하고 세션 있으면 페이지 이동
		if(null == session.getAttribute("role") || "" == session.getAttribute("role")) {
			model.addAttribute("message","로그인 후 글을 작성해주세요.");
			return "assets/loginFail"; 
		}

		return "assets/write";
	}

}
