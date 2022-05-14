package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.BoardDao;

@Controller
public class DeleteController {

	@Autowired
	BoardDao boardDao;

	@RequestMapping(value = "/deleteById/{id}", method = RequestMethod.GET)
	public String deleteById(@PathVariable int id, HttpSession session, Model model) {
		 //세션체크
		 if(session.getAttribute("id") == null || session.getAttribute("id") == "") {
			 model.addAttribute("message","로그인하세요.");
			return "assets/loginFail";
		 }
		 if(boardDao.deleteById(id) > 0) {
			 model.addAttribute("message","삭제되었습니다.");
			return "assets/index";
			 
		 }
		 return "assets/index";
	}

}
