package kr.or.iei.member.model.vo;

public class Member {
	private int memberNo; //회원 번호
	private String memberId; //회원 아이디
	private String memberPw; //회원 비밀번호
	private String memberName; //회원 이름
	private String memberPhone; //회원 전화 번호
	private String memberAddr; //회원 주소
	private int memberLevel; //회원 등급(1:관리자, 2:정회원, 3:준회원)
	private String enrollDate; //회원 가입일
		
	//기본 생성자 -> 목적 : 위의 Member 객체 초기화 
	public Member() { 
		super();
		// TODO Auto-generated constructor stub
	}
	
	//매개 변수가 있는 생성자
	public Member(int memberNo, String memberId, String memberPw, String memberName, String memberPhone,
			String memberAddr, int memberLevel, String enrollDate) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.memberAddr = memberAddr;
		this.memberLevel = memberLevel;
		this.enrollDate = enrollDate;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberAddr() {
		return memberAddr;
	}

	public void setMemberAddr(String memberAddr) {
		this.memberAddr = memberAddr;
	}

	public int getMemberLevel() {
		return memberLevel;
	}

	public void setMemberLevel(int memberLevel) {
		this.memberLevel = memberLevel;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPw=" + memberPw + ", memberName="
				+ memberName + ", memberPhone=" + memberPhone + ", memberAddr=" + memberAddr + ", memberLevel="
				+ memberLevel + ", enrollDate=" + enrollDate + "]";
	}		
	
	
}
