package kr.or.iei.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import kr.or.iei.common.JDBCTemplate;
import kr.or.iei.member.model.dao.MemberDao;
import kr.or.iei.member.model.vo.Member;

public class MemberService {
	
	private MemberDao dao;
	
	public MemberService() {
		dao = new MemberDao();
	}	

	public ArrayList<Member> selectAllMember() {	
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> list = dao.selectAllMember(conn);
		JDBCTemplate.close(conn);
		return list;		
		//dao.selectAllMember(conn);
	}

	public Member selectOneMember(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		Member m = dao.selectOneMember(conn, memberId);
		JDBCTemplate.close(conn);		
		return m;
	}

	public ArrayList<Member> selectOneMemberName(String memberName) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> list =  dao.selectOneMemberName(conn, memberName); //dao에 memberName 매개 변수 및 conn(커넥션) 전달
		JDBCTemplate.close(conn);
		return list;
	}

	public Member insertMember(String insertId, String insertPw, String insertName, String insertPhone,
			                  String insertAddr, String insertLevel) {
		Connection conn = JDBCTemplate.getConnection();
		
		return null;
	}

	public int joinMember(Member insMember) {
		Connection conn = JDBCTemplate.getConnection();
		//회원 가입 이전에, 입력한 아이디와 일치하는 회원이 DB에 존재하는지를 먼저 체크
		Member chkMember = dao.selectOneMember(conn, insMember.getMemberId());
		
		int result = 0;
		
		if(chkMember != null) { //존재하는 회원이 DB에 있다 => 회원가입 불가.
			
		}else { //chkMember == null => 입력한 아이디와 일치하는 회원이 DB에 없다 => 회원가입 가능 
			result = dao.joinMember(conn, insMember);
			
			if(result > 0) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
		}
		//int result = dao.joinMember(conn, insMember);
		JDBCTemplate.close(conn);
		return result;
	}
	
	public int deleteMember(int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.deleteMember(conn, memberNo);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);		
		return result;
	}


	public int updateMember(Member updMember) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.updateMember(conn, updMember);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}

}
