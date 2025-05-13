package kr.or.iei.notice.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor //기본 생성자 롬복
@AllArgsConstructor //매개변수 있는 생성자 롬복
@Data //게터 세터 toString 롬복

public class Notice {
	private String noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeWriter;
	private String noticeDate;
	private int readCount;
	
	//게시글에 대한 파일 및 댓글 리스트
	private ArrayList<NoticeFile> fileList;
	private ArrayList<NoticeComment> commentList;
}


