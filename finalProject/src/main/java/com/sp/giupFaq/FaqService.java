package com.sp.giupFaq;

import java.util.List;
import java.util.Map;

public interface FaqService {
	public int insertFaq(Faq dto); // insert,update,delete의 int는 성공여부에 대한 체크. parameterType을 받는 것
	public int dataCount(Map<String, Object> map); // Query에서는 int는 ResultType.. parameterType이 map
	public List<Faq> listFaq(Map<String, Object> map);
	public List<Faq> listedFCate();
	public Faq readFaq(int f_Num); 
	public int updateHitCount(int f_Num); // 선택된 f_num만 증가하여야 함.
	public int updateFaq(Faq dto);
	public int deleteFaq(int f_Num);
	
	public void insertFCate(Faq dto) throws Exception;
	public List<Faq> listFCate();
	public int dataCountFCate();
	public void deleteFCate(int fCate_Num) throws Exception;
}
