package com.sp.giupReview;

import java.util.List;
import java.util.Map;

public interface giupReviewService {
	
	public int insertReview(giupReview dto, String pathname) throws Exception;
	public int getNumReview(giupReview dto) throws Exception;
	public giupReview getReview(giupReview dto) throws Exception;
	public int deleteReview(giupReview dto) throws Exception;
	public List<giupReview> getListMyReview(giupReview dto,String pathname) throws Exception;
	
	//모든 리뷰 - Admin 
	public List<giupReview> getListAllReview(Map<String, Object> map) throws Exception;
	public int dataCount(Map<String, Object> map) throws Exception; 

}
