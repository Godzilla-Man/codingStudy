package kr.or.iei.api.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.or.iei.api.model.vo.FoodPlace;

/**
 * Servlet implementation class BusanJsonServlet
 */
@WebServlet("/api/busanJson")
public class BusanJsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BusanJsonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//서비스 요청 URL
		String url = "https://apis.data.go.kr/6260000/FoodService/getFoodKr";
		//발급받은 Service Key(인코딩 key)
		String serviceKey = "mwmcxLI4drRwtFraJlaK9MHNmUNip%2BQF%2BZ%2BFpcQqRCj%2BE6azhFtvGojG7fVcc4EPO9efqY3VaCynHFoxzyyU3g%3D%3D";
		//요청 페이지
		String reqPage = request.getParameter("reqPage");
		
		url += "?";
		url += "servicekey=" + serviceKey;
		url += "&numOfRows=10";
		url += "&pageNo=" + reqPage;
		url += "&resultType=json";
		
		URL reqUrl = new URL(url);
		HttpURLConnection conn = (HttpURLConnection) reqUrl.openConnection();
		conn.connect();
		
		int resCode = conn.getResponseCode(); //HTTP 통신 응답 코드
		if(resCode == HttpURLConnection.HTTP_OK) { //HTTP 통신 정상 응답
			
			//응답 데이터 읽기 위한 스트림
			BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			String inputLine;
			StringBuilder resStr = new StringBuilder();
			
			//응답 데이터 한줄 씩 읽어와서 builder에 저장
			while((inputLine = in.readLine()) != null) { //읽어올 데이터가 있을때까지 반복
				resStr.append(inputLine);
			}
			
			in.close();
			
			//item 배열만 추출 작업
			JsonElement jsonElement = new JsonParser().parse(resStr.toString());
			JsonObject jsonObj = jsonElement.getAsJsonObject();
			JsonObject getFoodKr = jsonObj.getAsJsonObject("getFoodKr");
			JsonArray itemsArray = getFoodKr.getAsJsonArray("item"); //item 속성값의 자료형이 배열이므로, Array 메소드 사용
			
			//식당들 정보를 저장할 ArrayList
			ArrayList<FoodPlace> resList = new ArrayList<FoodPlace>();
			
			for(int i=0; i<itemsArray.size(); i++) {
				JsonElement item = itemsArray.get(i); //1개 식당 정보
				
				String placeTitle = item.getAsJsonObject().get("MAIN_TITLE").getAsString(); //상호명
				String placeTel = item.getAsJsonObject().get("CNTCT_TEL").getAsString(); //전화번호
				String placeHour = item.getAsJsonObject().get("USAGE_DAY_WEEK_AND_TIME").getAsString(); //영업시간
				String placeAddr = item.getAsJsonObject().get("ADDR1").getAsString(); //주소
				String placeImg = item.getAsJsonObject().get("MAIN_IMG_THUMB").getAsString(); //이미지
				
				FoodPlace place = new FoodPlace(placeTitle, placeTel, placeHour, placeAddr, placeImg);
				resList.add(place);
			}
			
			//Gson 라이브러리 이용하여 Json 형태 문자열로 변환
			Gson gson = new Gson();
			String resultStr = gson.toJson(resList);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			response.getWriter().print(resultStr);			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
