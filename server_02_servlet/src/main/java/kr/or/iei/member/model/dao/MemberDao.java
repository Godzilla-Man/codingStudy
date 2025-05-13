package kr.or.iei.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.or.iei.common.JDBCTemplate;
import kr.or.iei.member.model.vo.Member;

public class MemberDao {

	public ArrayList<Member> selectAllMember(Connection conn) {
		//자원 반환 객체 선언
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		//수행할 SQL 작성
		String query = "select * from tbl_member";
		
		//결과를 관리할 자바 객체
		ArrayList<Member> list = new ArrayList<Member>();
		
		try {
			//실제 SQL을 수행하고 결과를 받아올 객체 생성
			pstmt = conn.prepareStatement(query);
			
			//위치홀더에 대한 값 셋팅 -> X
			
			//SQL 수행하고 결과를 받음
			rset = pstmt.executeQuery();
			
			//조회 결과 행은 여러개일 수 있으므로, 반복문으로 처리
			while(rset.next()) {
				
				//현재 가리키고 있는 행의, 컬럽 값 추출
				int memberNo = rset.getInt("member_no");
				String memberId = rset.getString("member_id");
				String memberPw = rset.getString("member_pw");
				String memberName = rset.getString("member_name");
				String memberPhone = rset.getString("member_phone");
				String memberAddr = rset.getString("member_addr");
				int memberLevel = rset.getInt("member_level");
				String enrollDate = rset.getString("enroll_date");
				
				//행 1개 == Member 객체 1개
				Member m = new Member(memberNo, memberId, memberPw, memberName, memberPhone, memberAddr, memberLevel, enrollDate);
				
				//조회된 행 여러개일 수 있으니, list로 관리
				list.add(m);				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);;
		}
		
		return list;
	}

	public Member selectOneMember(Connection conn, String searchID) {
		//자원 반환 객체 선언
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		//수행할 SQL 작성
		String query = "select * from tbl_member where member_id = ?";  //물음표는 '위치홀더'로써 사용자 입력값이 들어감.
		
		//결과를 관리할 자바 객체
		Member m = null;
		
		//실제 SQL 수행하고 결과를 받아올 객체 생성
		try {
			pstmt = conn.prepareStatement(query);
			
			//위치홀더에 입력값 세팅
			pstmt.setString(1, searchID); //첫번째 위지홀더 값으로 대체 해준다라는 뜻
			
			//SQL 수행하고 결과 받기
			rset = pstmt.executeQuery();
			
			//결과 처리
			if(rset.next()) {
				int memberNo = rset.getInt("member_no");
				String memberId = rset.getString("member_id");
				String memberPw = rset.getString("member_pw");
				String memberName = rset.getString("member_name");
				String memberPhone = rset.getString("member_phone");
				String memberAddr = rset.getString("member_addr");
				int memberLevel = rset.getInt("member_level");
				String enrollDate = rset.getString("enroll_date");	
				
				m = new Member(memberNo, memberId, memberPw, memberName, memberPhone, memberAddr, memberLevel, enrollDate);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return m;
	}

	public ArrayList<Member> selectOneMemberName(Connection conn, String searchName) {
		//자원 반환 객체 선언
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		//전달받은 memberName == "유저"
		
		
		//수행할 SQL 작성
		String query = "select * from tbl_member where member_name like '%' || ? || '%'";  //물음표는 '위치홀더'로써 사용자 입력값이 들어감.
		
		//결과를 관리할 자바 객체
		ArrayList<Member> list = new ArrayList<Member>();
		
		//실제 SQL 수행하고 결과를 받아올 객체 생성
		try {
			pstmt = conn.prepareStatement(query);
			
			//위치홀더에 입력값 세팅
			pstmt.setString(1, searchName); //첫번째 위지홀더 값으로 대체 해준다라는 뜻
			
			//SQL 수행하고 결과 받기
			rset = pstmt.executeQuery();
			
			//결과 처리
			while(rset.next()) {
				//현재 가리키고 있는 행의, 컬럼 값 추출
				int memberNo = rset.getInt("member_no");
				String memberId = rset.getString("member_id");
				String memberPw = rset.getString("member_pw");
				String memberName = rset.getString("member_name");
				String memberPhone = rset.getString("member_phone");
				String memberAddr = rset.getString("member_addr");
				int memberLevel = rset.getInt("member_level");
				String enrollDate = rset.getString("enroll_date");	
				
				Member m = new Member(memberNo, memberId, memberPw, memberName, memberPhone, memberAddr, memberLevel, enrollDate);
				
				list.add(m);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

	public int joinMember(Connection conn, Member insMember) {
		//자원 반환 객체 선언
		PreparedStatement pstmt = null;
		//Insert 작업이므로, ResultSet은 선언하지 않음.
		
		//SQL 수행 결과 받을 변수
		int result = 0;
		
		//수행할 SQL 작성
		String query = "insert into tbl_member values (seq_member.nextval, ?, ?, ?, ?, ?, 3, SYSDATE)";
		
		//실제 SQL을 수행하고 결과 받아올 객체 생성
		try {
			pstmt = conn.prepareStatement(query);
			
			//위치홀더에 값 세팅
			pstmt.setString(1, insMember.getMemberId());
			pstmt.setString(2, insMember.getMemberPw());
			pstmt.setString(3, insMember.getMemberName());
			pstmt.setString(4, insMember.getMemberPhone());
			pstmt.setString(5, insMember.getMemberAddr());
			
			//SQL 수행하고 결과 받음
			result = pstmt.executeUpdate();
			
			JDBCTemplate.commit(conn);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	
	public int deleteMember(Connection conn, int meberNo) {
		//실제 sql 수행하고 결과 받아올 객체 선언
		PreparedStatement pstmt = null;
		
		//수행 SQL
		String query = "delete from tbl_member where member_no = ?";
		
		//결과 받아 처리할 자바 변수
		int result = 0;
		
		try {
			//실제 SQL 수행하고 결과 받아올 객체 생성
			pstmt = conn.prepareStatement(query);
			
			//위치홀더 값 세팅
			pstmt.setInt(1, meberNo);
			
			//SQL 수행 후, 결과 받기
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
		
	}

	public int updateMember(Connection conn, Member updMember) {
		//실제 sql 수행하고 결과 받아올 객체 선언
		PreparedStatement pstmt = null;
		
		//수행 SQL
		String query = "update tbl_member set member_pw = ?, member_name = ?, member_addr = ? where member_no = ?";
		
		//결과 받아 처리할 자바 변수
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			
			//위치 홀더 값 세팅
			pstmt.setString(1,  updMember.getMemberPw());
			pstmt.setString(2, updMember.getMemberName());
			pstmt.setString(3,  updMember.getMemberAddr());
			pstmt.setInt(4,  updMember.getMemberNo());
			
			//SQK 수행 후, 결과 받기
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}


}
