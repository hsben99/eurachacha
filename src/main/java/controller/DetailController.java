package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import dao.BoardDao;
import dto.BoardDto;

@Controller
public class DetailController {
	
	@Autowired
	BoardDao boardDao;

	@RequestMapping(value = "/moveDetailPage/{id}", method = RequestMethod.GET)
	public String detailPage(Model model, @PathVariable String id) {
		BoardDto dto = new BoardDto();
		dto = boardDao.getDetail(id);
		
		model.addAttribute("title", dto.getTitle());
		model.addAttribute("regDate", dto.getRegDate());
		model.addAttribute("content", dto.getContent());		
		model.addAttribute("id", dto.getId());
		return "assets/detail";
	}	

}
