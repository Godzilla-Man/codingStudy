package kr.or.iei.api.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class FoodPlace {
	private String placeTitle; //상호명
	private String placeTel; //전화번호
	private String placeHour; //영업시간
	private String placeAddr; //주소
	private String placeImg; //가게 이미지파일 경로
	
}
