package com.sp.giupQna;

import java.util.List;
import java.util.Map;

public interface QnaService {
	public int insertQna(Qna dto, String mode, String pathname); // mode는 원문(질문), 답변 , pathname은 첨부파일
	public int dataCount(Map<String, Object> map); // searchkey 등이 대해 필요
	public List<Qna> ListQna(Map<String, Object> map);
	public Qna readQna(int q_Num);
	public int updateHitCount(int q_Num);
	public Qna preReadQna(Map<String, Object> map); // search등이 필요
	public Qna nextReadQna(Map<String, Object> map);
	public int updateQna(Qna dto, String mode, String pathname);
	public int deleteQna(int q_Num, String q_SaveFileName, String pathname); // map으로 가져와도 됨. save~는 data, path~ 물리파일.. 
}
