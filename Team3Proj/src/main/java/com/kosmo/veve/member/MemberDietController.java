package com.kosmo.veve.member;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.veve.model.MemberDTO;
import com.kosmo.veve.model.MemberFileDTO;
import com.kosmo.veve.model.NutrientDTO;
import com.kosmo.veve.model.UserDietDTO;
import com.kosmo.veve.model.service.MemberService;
import com.kosmo.veve.model.service.UserDietService;
import com.sun.xml.internal.bind.v2.runtime.Location;

@Controller
public class MemberDietController {

	@Resource(name = "api")
	private Api foodapi;
	@Resource(name = "memberService")
	private MemberService service;
	@Resource(name = "userDietService")
	private UserDietService dietservice;

	// 식단분석
	@RequestMapping(value ="/Member/MemberDiet.do", produces = "text/plain;charset=UTF-8")
	public String myhome(HttpServletRequest req,Model model) {
		String userID = (String) req.getSession().getAttribute("UserID");
		Map map = new HashMap();
		map.put("userID", userID);
		MemberDTO userinfo = service.selectOne(map);
		System.out.println(userinfo.getGender());
		System.out.println(userinfo.getAge());
		String gender = userinfo.getGender().toLowerCase();
		int age = Integer.parseInt(userinfo.getAge());
		System.out.println("Age:" + age);
		age = age / 10;
		age = age * 10;
		System.out.println("Age:" + age);
		map.put("gender", gender);
		map.put("age", String.valueOf(age));

		// 하루 식단 가져오기
		Date nowDate = new Date();
		System.out.println("포맷 지정 전 : " + nowDate);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yy/MM/dd"); // 원하는 데이터 포맷 지정
		String strNowDate = simpleDateFormat.format(nowDate);
		System.out.println("포맷 지정 후 : " + strNowDate);
		String eatDate = strNowDate;
		map.put("eatDate", eatDate);
		List<UserDietDTO> todaylist = dietservice.getTodayNutrientInfo(map);
		System.out.println(todaylist);

		float TodayvitB12 = 0;
		float Todayprotein = 0;
		float Todayzinc = 0;
		float TodayvitD = 0;
		float Todaycalcium = 0;

		for (int i = 0; i < todaylist.size(); i++) {
			Todayprotein += Float.parseFloat(todaylist.get(i).getProtein());
			TodayvitB12 += Float.parseFloat(todaylist.get(i).getVitB12());
			TodayvitD += Float.parseFloat(todaylist.get(i).getVitD());
			Todayzinc += Float.parseFloat(todaylist.get(i).getZinc());
			Todaycalcium += Float.parseFloat(todaylist.get(i).getCalcium());
		}
		System.out.println("오늘 총:" + (Todayprotein + TodayvitB12 + TodayvitD + Todayzinc + Todaycalcium));

		// 회원 정보에 맞는 표준 정보 가져오기
		NutrientDTO ndto = dietservice.selectOne(map);
		System.out.println(ndto);

		float standardprotein = Float.parseFloat(ndto.getProtein());
		float standardVitB12 = Float.parseFloat(ndto.getVitB12());
		float standardVitD = Float.parseFloat(ndto.getVitD());
		float standardZinc = Float.parseFloat(ndto.getZinc());
		float standardCalcium = Float.parseFloat(ndto.getCalcium());

		// 하루 단백질 %
		float proteinPercent = Todayprotein / standardprotein * 100;
		System.out.println(proteinPercent);
		String strproteinPercent = String.format("%.2f", proteinPercent);
		// 하루 B12 %
		float b12Percent = TodayvitB12 / standardVitB12 * 100;
		System.out.println(b12Percent);
		String strbPercent = String.format("%.2f", b12Percent);
		// 하루 D %
		float dPercent = TodayvitD / standardVitD * 100;
		System.out.println(proteinPercent);
		String strdPercent = String.format("%.2f", dPercent);
		// 하루 아연 %
		float zincPercent = Todayzinc / standardZinc * 100;
		System.out.println(zincPercent);
		String strzincPercent = String.format("%.2f", zincPercent);
		// 하루 칼슘 %
		float calPercent = Todaycalcium / standardCalcium * 100;
		System.out.println(calPercent);
		String strcalPercent = String.format("%.2f", calPercent);
		
		

			
		
		
		
		model.addAttribute("strproteinPercent", strproteinPercent);
		model.addAttribute("strbPercent", strbPercent);
		model.addAttribute("strdPercent", strdPercent);
		model.addAttribute("strzincPercent", strzincPercent);
		model.addAttribute("strcalPercent", strcalPercent);
		

		return "member/Diet.tiles";
	}

	// 식단분석
	@RequestMapping(value="/Member/MemberDietpost.do", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String getdiet(HttpServletRequest req) throws IOException {
		JSONObject obj = new JSONObject();
		String userID = (String) req.getSession().getAttribute("UserID");
		Map map = new HashMap();
		map.put("userID", userID);
		MemberDTO userinfo = service.selectOne(map);
		System.out.println(userinfo.getGender());
		System.out.println(userinfo.getAge());
		String gender = userinfo.getGender().toLowerCase();
		int age = Integer.parseInt(userinfo.getAge());
		System.out.println("Age:" + age);
		age = age / 10;
		age = age * 10;
		System.out.println("Age:" + age);
		map.put("gender", gender);
		map.put("age", String.valueOf(age));

		System.out.println("정보를 가지고 왔어");
		String result = req.getParameter("data").trim();
		System.out.println(result);
		String[] menues = result.split("/");
		float vitB12 = 0;
		float protein = 0;
		float zinc = 0;
		float vitD = 0;
		float calcium = 0;

		for (int i = 0; i < menues.length; i++) {
			String query = "http://koreanfood.rda.go.kr/kfi/openapi/service?apiKey=20210113162022VB99F71UL6GQQYGB6U&serviceType=AA002&nowPage=1&pageSize=10&fdGrupp=&fdNm="
					+ menues[i];
			System.out.println(query);
			String foodData = foodapi.getFoodData(query);
			System.out.println(foodData);
			String[] foodSep = foodData.split("/");

			if (!foodSep[0].equals("-")) {
				protein += Float.parseFloat(foodSep[0]);
			}
			if (!foodSep[1].equals("-")) {
				calcium += Float.parseFloat(foodSep[1]);
			}
			if (!foodSep[2].equals("-")) {
				vitD += Float.parseFloat(foodSep[2]);
			}
			if (!foodSep[3].equals("-")) {
				vitB12 += Float.parseFloat(foodSep[3]);
			}
			if (!foodSep[4].equals("-")) {
				zinc += Float.parseFloat(foodSep[4]);
			}

		}
		System.out.println("단백질 총합:" + protein);
		System.out.println("칼슘 총합:" + calcium);
		System.out.println("비타민B12 총합:" + vitD);
		System.out.println("비타민b 총합:" + vitB12);
		System.out.println("아연 총합:" + zinc);
		map.put("protein", protein);
		map.put("calcium", calcium);
		map.put("vitB12", vitB12);
		map.put("vitD", vitD);
		map.put("zinc", zinc);
		// 식단 영양 입력
		int dietinsert = dietservice.insert(map);
		System.out.println("영양입력:" + dietinsert);

		// 하루 식단 가져오기
		Date nowDate = new Date();
		System.out.println("포맷 지정 전 : " + nowDate);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yy/MM/dd"); // 원하는 데이터 포맷 지정
		String strNowDate = simpleDateFormat.format(nowDate);
		System.out.println("포맷 지정 후 : " + strNowDate);
		String eatDate = strNowDate;
		map.put("eatDate", eatDate);
		List<UserDietDTO> todaylist = dietservice.getTodayNutrientInfo(map);
		System.out.println(todaylist);

		float TodayvitB12 = 0;
		float Todayprotein = 0;
		float Todayzinc = 0;
		float TodayvitD = 0;
		float Todaycalcium = 0;

		for (int i = 0; i < todaylist.size(); i++) {
			Todayprotein += Float.parseFloat(todaylist.get(i).getProtein());
			TodayvitB12 += Float.parseFloat(todaylist.get(i).getVitB12());
			TodayvitD += Float.parseFloat(todaylist.get(i).getVitD());
			Todayzinc += Float.parseFloat(todaylist.get(i).getZinc());
			Todaycalcium += Float.parseFloat(todaylist.get(i).getCalcium());
		}
		System.out.println("오늘 총:" + (Todayprotein + TodayvitB12 + TodayvitD + Todayzinc + Todaycalcium));

		// 회원 정보에 맞는 표준 정보 가져오기
		NutrientDTO ndto = dietservice.selectOne(map);
		System.out.println(ndto);

		float standardprotein = Float.parseFloat(ndto.getProtein());
		float standardVitB12 = Float.parseFloat(ndto.getVitB12());
		float standardVitD = Float.parseFloat(ndto.getVitD());
		float standardZinc = Float.parseFloat(ndto.getZinc());
		float standardCalcium = Float.parseFloat(ndto.getCalcium());

		// 하루 단백질 %
		float proteinPercent = Todayprotein / standardprotein * 100;
		System.out.println(proteinPercent);
		String strproteinPercent = String.format("%.2f", proteinPercent);
		// 하루 B12 %
		float b12Percent = TodayvitB12 / standardVitB12 * 100;
		System.out.println(b12Percent);
		String strbPercent = String.format("%.2f", b12Percent);
		// 하루 D %
		float dPercent = TodayvitD / standardVitD * 100;
		System.out.println(proteinPercent);
		String strdPercent = String.format("%.2f", dPercent);
		// 하루 아연 %
		float zincPercent = Todayzinc / standardZinc * 100;
		System.out.println(zincPercent);
		String strzincPercent = String.format("%.2f", zincPercent);
		// 하루 칼슘 %
		float calPercent = Todaycalcium / standardCalcium * 100;
		System.out.println(calPercent);
		String strcalPercent = String.format("%.2f", calPercent);
		
		
		//최소값 가져오기
				List minimum = new ArrayList();
				minimum.add(proteinPercent);
				minimum.add(b12Percent);
				minimum.add(dPercent);
				minimum.add(zincPercent);
				minimum.add(calPercent);
				float mini = (float)minimum.get(0);
				for(int m=1;m<minimum.size();m++) {
					if((float)minimum.get(m)< mini) {
						mini = (float)minimum.get(m);
					}			
				}
				System.out.println("최소 퍼센트:"+mini);
				if(mini==b12Percent)
					obj.put("mini", "비타민B12");
				if(mini==proteinPercent)
					obj.put("mini", "단백질");
				if(mini==dPercent)
					obj.put("mini", "비타민D");
				if(mini==zincPercent) {
					System.out.println("여기왔다");
					obj.put("mini","아연");
				}
				if(mini==calPercent)
					obj.put("mini", "칼슘");
		
		

		obj.put("todayProtein", strproteinPercent);
		obj.put("todayB12", strbPercent);
		obj.put("todayD", strdPercent);
		obj.put("todayZinc", strzincPercent);
		obj.put("todayCal", strcalPercent);

		// 부족한 영양소 가져오기
		String needDiet = "";
		if (Todaycalcium - standardCalcium < 0) {
			needDiet += "cal" + "/";
		}
		if (TodayvitB12 - standardVitB12 < 0) {
			needDiet += "vB" + "/";

		}
		if (TodayvitD - standardVitD < 0) {
			needDiet += "vD" + "/";

		}
		if (Todayzinc - standardZinc < 0) {
			needDiet += "zinc" + "/";

		}
		if (Todayprotein - standardprotein < 0) {
			needDiet += "pro" + "/";

		}
		obj.put("needDiet", needDiet);

		return obj.toJSONString();

	}

	private int Integer(String age) {
		// TODO Auto-generated method stub
		return 0;
	}

}
