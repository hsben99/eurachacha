package controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import dao.UserDao;
import dto.User;

@Controller
public class UserDeleteController {

	@Autowired
	UserDao userDao;
	
	@RequestMapping(value = "/deleteUser", method = RequestMethod.GET)
	public String deleteUser(HttpSession session, Model model, User user) {
		
		if(userDao.deleteUser(user) > 0) {
			return "assets/userList";
		}
		model.addAttribute("message","삭제 실패! 관리자에게 문의하세요.");
		return "assets/loginFail"; 
	}

}
