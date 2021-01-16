package com.kosmo.veve.member;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import jdk.nashorn.internal.parser.JSONParser;

import java.io.BufferedReader;
import java.io.IOException;

@Service
public class Api {
	

	
    public String getFoodData() throws IOException {
        StringBuilder urlBuilder = new StringBuilder("http://koreanfood.rda.go.kr/kfi/openapi/service?apiKey=20210113162022VB99F71UL6GQQYGB6U&serviceType=AA002&nowPage=1&pageSize=10&fdGrupp=&fdNm=고등어"); /*URL*/
//        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=서비스키"); /*Service Key*/
//        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
//        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
//        urlBuilder.append("&" + URLEncoder.encode("stationName","UTF-8") + "=" + URLEncoder.encode("수내동", "UTF-8")); /*측정소 이름*/
//        urlBuilder.append("&" + URLEncoder.encode("dataTerm","UTF-8") + "=" + URLEncoder.encode("DAILY", "UTF-8")); /*요청 데이터기간 (하루 : DAILY, 한달 : MONTH, 3달 : 3MONTH)*/
//        urlBuilder.append("&" + URLEncoder.encode("ver","UTF-8") + "=" + URLEncoder.encode("1.3", "UTF-8")); /*버전별 상세 결과 참고문서 참조*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println("음식 데이타 json :");
        String textAll = sb.toString();
        org.json.simple.parser.JSONParser json = new org.json.simple.parser.JSONParser();
        JSONObject obj;
		try {
			obj = (JSONObject)json.parse(textAll);
			 //System.out.println(obj);
			 //System.out.println("====");
			 JSONObject obj2 =(JSONObject)obj.get("service");
			 //System.out.println(obj2);
			 JSONArray array = (JSONArray)obj2.get("list");
			 //System.out.println(array.get(0));
			 JSONObject obj3 = (JSONObject)array.get(0);
			 JSONArray array2 = (JSONArray)obj3.get("irdnt");
			 //System.out.println(array2.get(0));
			 for(int i=0;i<array2.size();i++) {
				 JSONObject obj4 = (JSONObject)array2.get(i);
				 JSONArray array3 = (JSONArray)obj4.get("irdnttcket");
				 for(int k=0;k<array3.size();k++) {
					 JSONObject obj5 = (JSONObject)array3.get(k);
					 if(obj5.get("irdntNm").equals("단백질")) {
						 System.out.println("단백질:"+obj5.get("contInfo")+" "+obj5.get("irdntUnitNm"));
					 }
					 if(obj5.get("irdntNm").equals("비타민 B12")) {
						 System.out.println("비타민 B12:"+obj5.get("contInfo")+" "+obj5.get("irdntUnitNm"));
					 }
					 if(obj5.get("irdntNm").equals("아연")) {
						 System.out.println("아연:"+obj5.get("contInfo")+" "+obj5.get("irdntUnitNm"));
					 }
					 if(obj5.get("irdntNm").equals("비타민 D")) {
						 System.out.println("비타민 D:"+obj5.get("contInfo")+" "+obj5.get("irdntUnitNm"));
					 }
					 if(obj5.get("irdntNm").equals("칼슘")) {
						 System.out.println("칼슘:"+obj5.get("contInfo")+" "+obj5.get("irdntUnitNm"));
					 }
					 if(obj5.get("irdntNm").equals("오메가3 지방산")) {
						 System.out.println("오메가3 지방산:"+obj5.get("contInfo")+" "+obj5.get("irdntUnitNm"));
					 }
				 }
			 }			 

			 //이름 : irdntNm
			 // 양 : contInfo
			 // 단위 : irdntUnitNm

			 
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
 
     

    
		
        
        return "";
        
     
    }
}


