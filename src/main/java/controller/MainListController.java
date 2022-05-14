package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import common.Utils;
import dao.BoardDao;
import dto.BoardDto;

@Controller
public class MainListController {
	@Autowired
	BoardDao boardDao;
	

	@RequestMapping(value = "/getMainList", method = RequestMethod.POST, produces = "application/json; charset=utf8" )
	@ResponseBody
	public String getMainList(Model model, @RequestBody String data) {
		Map<String,String> map = Utils.paramMap(data);
		
		int reqPage = 1;
		if(map.get("page") != null ) {
			reqPage = Integer.parseInt(map.get("page"));
		}
		if(map.get("searchKey") == null ) {
			map.put("searchKey","");
		}
		
		if(map.get("category") == null ) {
			map.put("category","");
		}
		int currPage = reqPage;
		int contentLength = 24;
		int sno = currPage * contentLength - (contentLength-1); 
		int eno = sno+(contentLength-1);
		String strSno = Integer.toString(sno);
		String strEno = Integer.toString(eno);
		map.put("strSno", strSno);
		map.put("strEno", strEno);
		List<BoardDto> mainList = boardDao.getMainList(map);
		
		Map<String,Object> returnMap = new HashMap<String, Object>();
		
		returnMap.put("mainList", mainList);
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();		
		
		return gson.toJson(returnMap).toString();
	}
	
	@ResponseBody         
	@RequestMapping(value = "/pageInfo.do", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String pageInfo( @RequestBody String data) {
		Map<String,String> map = Utils.paramMap(data); 
		
		int reqPage = 1;
		if(map.get("page") != null) {
			reqPage	= Integer.parseInt(map.get("page"));
		}
		if(map.get("searchKey") == null) {
			map.put("searchKey","");
		}
		if(map.get("category") == null) {
			map.put("category","");
		}
		int currPage = reqPage;
		int contentLength = 24; 
		int sno = currPage * contentLength - (contentLength-1); 
		int eno = sno+(contentLength-1);
		double maxRow= boardDao.maxRow(map);
		int totalPage =	(int) Math.ceil(maxRow / contentLength); 
		int seePageLength =5;
		int sPageNo = (((currPage -1) / seePageLength) + 1) * seePageLength - 4;
		int ePageNo = totalPage < sPageNo + (seePageLength-1) ? totalPage : sPageNo + (seePageLength-1) ; 
		
		map.put("totalPage",Integer.toString(totalPage));
		map.put("sPageNo",Integer.toString(sPageNo));
		map.put("ePageNo",Integer.toString(ePageNo));
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		return gson.toJson(map).toString();
		
	}
}
