package common;

import java.util.HashMap;
import java.util.Iterator;

import org.json.JSONObject;

public class Utils {

	public static HashMap<String, String> paramMap(Object object ){
		HashMap<String, String> hashmap = new HashMap<String, String>();
		JSONObject json = new JSONObject(String.valueOf(object));
		Iterator i = json.keys(); 
		
		while(i.hasNext()){
		     String k = i.next().toString();  
		     hashmap.put(k, json.getString(k)); 
		}
		
		return hashmap;
	}
	
}
