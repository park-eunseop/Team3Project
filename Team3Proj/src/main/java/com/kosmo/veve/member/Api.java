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
	

	
    public String getFoodData(String query) throws IOException {
        StringBuilder urlBuilder = new StringBuilder(query); /*URL*/
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
        String foodInfo = "";
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
						 foodInfo += obj5.get("contInfo")+"/";
					 }
					 if(obj5.get("irdntNm").equals("비타민 B12")) {
						 System.out.println("비타민 B12:"+obj5.get("contInfo")+" "+obj5.get("irdntUnitNm"));
						 foodInfo += obj5.get("contInfo")+"/";
					 }
					 if(obj5.get("irdntNm").equals("비타민 D")) {
						 System.out.println("아연:"+obj5.get("contInfo")+" "+obj5.get("irdntUnitNm"));
						 foodInfo += obj5.get("contInfo")+"/";
					 }
					 if(obj5.get("irdntNm").equals("아연")) {
						 System.out.println("비타민 D:"+obj5.get("contInfo")+" "+obj5.get("irdntUnitNm"));
						 foodInfo += obj5.get("contInfo")+"/";
					 }
					 if(obj5.get("irdntNm").equals("칼슘")) {
						 System.out.println("칼슘:"+obj5.get("contInfo")+" "+obj5.get("irdntUnitNm"));
						 foodInfo += obj5.get("contInfo")+"/";
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
        
 
     

    
		
        
        return foodInfo;
        
     
    }
}


