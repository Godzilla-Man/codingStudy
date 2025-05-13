package kr.or.iei.notice.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class NoticeComment {
	
	private int commentNo; //댓글번호
	private String commentWriter; //댓글 작성자
	private String commentContent; //댓글 내용
	private String commentDate; //댓글 작성일
	private String noticeRef; //게시글 번호
}
