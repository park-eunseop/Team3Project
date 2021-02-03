package com.kosmo.veve.board.restaurant;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.veve.model.GallaryBoardDTO;
import com.kosmo.veve.model.GallaryFileDTO;
import com.kosmo.veve.model.MemberDTO;
import com.kosmo.veve.model.MemberFileDTO;
import com.kosmo.veve.model.service.GallaryBoardService;

@Controller
public class RestaurantController {
	
	@Resource(name="restaurantServiceImpl") 
	private RestaurantServiceImpl restaurantService;
	
	@RequestMapping("/Board/Restaurant.do")
	public String restaurant(Map map, Model model) {
		
		//DB에 값의 갯수가 적으니 모든 좌표 가져와서 넘겨주고 list로 보여주기_마커까지
		List<Map> list = restaurantService.selectRestaurantList(map);
		//System.out.println(list.get(0));
		//RestaurantDTO(res_no=5, res_name=손오공 마라탕, res_addr=서울특별시 구로구 구로3동 1124-23 2층, res_tel=02-838-7788, res_menu=메뉴1,가격1,등급1 등급1/메뉴2,가격2,등급2/메뉴3,가격3,등급3 등급3 등급3, res_coordinate=37.48601233032276, 126.89465932768506, category=중식)
		
		List list_coordinate_res = new ArrayList();
		List list_coordinate_caf = new ArrayList();
		
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).get("CATEGORY").equals("까페")) {//까페면 caf에 저장
				list_coordinate_caf.add(list.get(i).get("RES_COORDINATE").toString());
			}
			else {// 식당이면 res에 저장
				list_coordinate_res.add(list.get(i).get("RES_COORDINATE").toString());
			}
		}
		
		//System.out.println("여기: "+list_coordinate_res);
		//System.out.println("첫번째 거: "+list_coordinate_res.get(0));
		 
		
		model.addAttribute("restaurant_list",list);
		
		model.addAttribute("list_coordinate_res",list_coordinate_res);
		model.addAttribute("list_coordinate_caf",list_coordinate_caf);
		
		return "board/Restaurant.tiles";
	}
	
	
	@ResponseBody
    @RequestMapping(value="/Board/Restaurant/List.do",produces = "text/html;charset=UTF-8")
	public String restaurantList(@RequestParam Map map) {
    	//DB에 값의 갯수가 적으니 모든 좌표 가져와서 넘겨주고 list로 보여주기_마커까지
    	List<Map> list = restaurantService.selectRestaurantList(map);//모든 식당
    	
    	if(map.get("category").equals("restaurant")) {//category 식당 선택이면
    		System.out.println("레스토랑");
    		//System.out.println(JSONArray.toJSONString(list));
    		
    		/*
    		JSONArray jArray = new JSONArray();
    		for (int i = 0; i < list.size(); i++) {//json array 값 넣기
    			JSONObject jobj = new JSONObject();//배열 내에 들어갈 json
    			jobj.put("contentid", placeList.get(i).getContentid());
	    		sObject.put("contenttypeid", placeList.get(i).getContenttypeid());
	    		sObject.put("mapx", placeList.get(i).getMapx());
	    		sObject.put("mapy", placeList.get(i).getMapy());
	    		jArray.put(sObject);
    		}
    		obj.put("planName", "planA");
    		obj.put("id", "userID");
    		obj.put("item", jArray);//배열을 넣음
    		*/

    		return JSONArray.toJSONString(list);
    	}
    	else if(map.get("category").equals("cafe")) {//카테고리 까페 선택
    		System.out.println("까페");
    		return JSONArray.toJSONString(list);
    	}
    	else {//카테고리 전부 선택시
    		System.out.println("전체 선택");
    		return JSONArray.toJSONString(list);
    	}
    	
	}/////////////
	
	

}
