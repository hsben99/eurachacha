package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import dao.UserDao;
import dto.User;

@Controller
public class UserController {

	@Autowired
	UserDao userDao;

	@RequestMapping(value = "/moveToUserList", method = RequestMethod.GET)
	public String moveToUserList() {
		return "assets/userList";
	}
	
	@RequestMapping(value = "/getUserList", method = RequestMethod.GET)
	@ResponseBody
	public String getUserList(HttpSession session) {
		
		List<User> userList = userDao.getUserList();
		Map<String,Object> returnMap = new HashMap<String, Object>();
		returnMap.put("userList", userList);
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		System.out.println(gson.toJson(returnMap).toString());
		
		return gson.toJson(returnMap).toString();
	}
	
	@RequestMapping(value = "/getUser/{id}", method = RequestMethod.GET)
	@ResponseBody
	public String getUser(HttpSession session, @PathVariable String id) {
	
		User user = userDao.getUser(id);
		Map<String,Object> returnMap = new HashMap<String, Object>();
		returnMap.put("user", user);
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		System.out.println(gson.toJson(returnMap).toString());
		
		return gson.toJson(returnMap).toString();
	}

}
