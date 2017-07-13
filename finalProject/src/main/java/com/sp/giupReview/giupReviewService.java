package com.sp.giupReview;

public interface giupReviewService {
	
	public int insertReview(giupReview dto) throws Exception;
	public int getNumReview(giupReview dto) throws Exception;
	public giupReview getReview(giupReview dto) throws Exception;
	public int deleteReview(giupReview dto) throws Exception;

}
