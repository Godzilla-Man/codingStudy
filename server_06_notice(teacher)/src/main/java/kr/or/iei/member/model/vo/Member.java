package kr.or.iei.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor //매개변수 있는 생성자 
@NoArgsConstructor	//매개변수 없는 기본 생성자
@Data				//getter, setter, toString
public class Member {
	
	private String memberNo;    //회원 번호
	private String memberId;    //회원 아이디
	private String memberPw;    //회원 비밀번호
	private String memberName;  //회원 이름
	private String memberEmail; //회원 이메일
	private String memberPhone; //회원 전화번호
	private String memberAddr;	//회원 주소
	private int memberLevel;	//회원 등급
	private String enrollDate;	//가입일
}
