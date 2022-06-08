package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.UserDao;
import dto.User;

@Controller
public class JoinController {

	@Autowired
	UserDao userDao;

	@RequestMapping(value = "/moveToJoin", method = RequestMethod.GET)
	public String moveToLogin() {
		return "assets/join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String login(HttpServletRequest req, HttpSession session, User user, Model model) {
		System.out.println(user+"????asdasd");
		if (userDao.join(user) > 0) {
			return "assets/index";
		}
		model.addAttribute("message", "가입실패 관리자에게 문의하세요");
		return "assets/loginFail";
	}

}
