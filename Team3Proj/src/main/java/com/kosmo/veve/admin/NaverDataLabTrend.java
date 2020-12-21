package com.kosmo.veve.admin;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;



public class NaverDataLabTrend {

	public static JSONObject getData() {
		String clientId = "9LFRw8V0i87VoRgUF6ug"; // 애플리케이션 클라이언트 아이디
		String clientSecret = "XMs3b8dXb_"; // 애플리케이션 클라이언트 시크릿

		String apiUrl = "https://openapi.naver.com/v1/datalab/search";

		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		requestHeaders.put("Content-Type", "application/json");
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd",Locale.KOREA);
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		String yesterday = sdf.format(cal.getTime());
		cal.add(Calendar.MONTH, -1);
		String aMonthAgo = sdf.format(cal.getTime());
		
		
		String requestBody = "{\"startDate\":\""+aMonthAgo+"\"," +
				"\"endDate\":\""+yesterday+"\"," +
				"\"timeUnit\":\"date\"," +
				"\"keywordGroups\":[{\"groupName\":\"비건\"," + 
				"\"keywords\":[\"비건\",\"vegan\",\"비거니즘\",\"비건 인식\",\"비건 라이프 스타일\",\"비건 뜻\",\"비건 인구\",\"비건 정보\",\"비건 커뮤니티\",\"채식주의자\",\"vegan products\"]}," +
				"{\"groupName\":\"채식 레시피\"," + 
				"\"keywords\":[\"비건 쇼핑몰\",\"채식\",\"비건 까페\",\"비건 맛집\",\"비건 디저트 카페\",\"비건 식단\",\"비건 베이킹\",\"채식 요리\",\"비건 식당\",\"채식 식당\",\"비건 요리\",\"채식 요리\"]}," +
				"{\"groupName\":\"채식건강\"," + 
				"\"keywords\":[\"비건 건강\",\"식이요법\",\"암환자 채식\",\"채식 식단\",\"채식 요리\",\"비건 요리\"]}]" +
				"}";

		String responseBody = post(apiUrl, requestHeaders, requestBody);
		//네이버 서버에서 받아온 결과 확인
		//System.out.println("네이버 API 결과: "+responseBody);
		
		//org.json.simple.parser.JSONParser 이용
		JSONParser parser = new JSONParser();
		JSONObject jsonObject = null;
		try {
			jsonObject = (JSONObject)parser.parse(responseBody);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		//System.out.println(jsonObject.get("results"));
		
		
		
		//jackson.map 의 ObjectMapper
		/*
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			List<Map<String,Object>> readValue = objectMapper.readValue(responseBody, 
				new TypeReference<List<Map<String,Object>>>() {});
			for(Map<String,Object> map : readValue) {
				System.out.println(map);
			}
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		*/
		
		return jsonObject;
	}//////////////////////////////////////////////getData

	private static String post(String apiUrl, Map<String, String> requestHeaders, String requestBody) {
		HttpURLConnection con = connect(apiUrl);

		try {
			con.setRequestMethod("POST");
			for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}

			con.setDoOutput(true);
			try (DataOutputStream wr = new DataOutputStream(con.getOutputStream())) {
				wr.write(requestBody.getBytes());
				wr.flush();
			}

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 응답
				return readBody(con.getInputStream());
			} else {  // 에러 응답
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect(); // Connection을 재활용할 필요가 없는 프로세스일 경우
		}
	}//////////////////////////////////

	private static HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}///////////////////////////

	private static String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body, StandardCharsets.UTF_8);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}

			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}////////////////////////////////
}
