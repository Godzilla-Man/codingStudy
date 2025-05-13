package kr.or.iei.common;

import java.util.ArrayList;

import kr.or.iei.notice.model.vo.Notice;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ListData <T>{
	
	ArrayList<T> list;
	String pageNavi;
}
