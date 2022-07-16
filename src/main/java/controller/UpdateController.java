package controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import dao.BoardDao;
import dto.BoardDto;

@Controller
public class UpdateController {

	
	@Autowired
	BoardDao boardDao;

	@RequestMapping(value = "/updateById/{id}", method = RequestMethod.GET)
	public String moveToUpdatePage(Model model, @PathVariable String id) {
		System.out.println("updateController´Â µé¾î¿È");
		
		BoardDto dto = new BoardDto();
		dto = boardDao.getDetail(id);
		model.addAttribute("model",dto);

		return "assets/update";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public boolean update(MultipartHttpServletRequest fileRequest, HttpSession session) {
		BoardDto boardDto = new BoardDto();
		boardDto.setId(Integer.parseInt(fileRequest.getParameter("id")));
		boardDto.setTitle(fileRequest.getParameter("title"));
		boardDto.setContent(fileRequest.getParameter("content"));
		boardDto.setDeleteYn("N");
		boardDto.setCategory(fileRequest.getParameter("category"));
		boardDto.setWriterId(session.getAttribute("id") != null ? session.getAttribute("id").toString() : "" );
		
		if (boardDao.updateBoard(boardDto) > 0) {
			return true;	
		}
		return false;
		
		
	}


}
