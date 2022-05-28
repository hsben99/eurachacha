package controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.UserDao;
@Controller
public class JoinController {
	
	@Autowired
	UserDao userDao;

	@RequestMapping(value = "/moveToJoin", method = RequestMethod.GET)
	public String moveToLogin() {
		return "assets/join";
	}
}


