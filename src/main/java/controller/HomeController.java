package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "assets/index";
	}
	
	@RequestMapping(value = "/teenProtect", method = RequestMethod.GET)
	public String teenProtect() {
		return "assets/teenProtect";
	}
	@RequestMapping(value = "/eurachacha", method = RequestMethod.GET)
	public String eurachacha() {
		return "assets/eurachacha";
	}
	@RequestMapping(value = "/moveToAdmin", method = RequestMethod.GET)
	public String admin() {
		return "assets/admin";
	}
	
	
}
