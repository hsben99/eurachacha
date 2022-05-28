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
public class LoginContorller {
	
	@Autowired
	UserDao userDao;

	@RequestMapping(value = "/moveToLogin", method = RequestMethod.GET)
	public String moveToLogin() {
		return "assets/login";
	}	
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpServletRequest req, HttpSession session, User user, Model model) {
		User loginUser = userDao.getPassword(user.getId());
		// id가 틀릴떄
		if (loginUser == userDao.getPassword(user.getId())) {
			model.addAttribute("message", "잘못된 아이디입니다.");
			return "assets/loginFail";
		}
		// 비번이 틀릴때
		if(!user.getPassword().equals(loginUser.getPassword())) {
			model.addAttribute("message", "잘못된 비밀번호입니다.");
			return "assets/loginFail";
		}
		// 비번이 맞을때
		session.setAttribute("role", loginUser.getRole());
		return "assets/index";
		
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "assets/index";
	}	
}


