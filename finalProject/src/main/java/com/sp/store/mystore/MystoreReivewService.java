package com.sp.store.mystore;

import java.util.List;
import java.util.Map;

public interface MystoreReivewService {
	public int insertReviewReply(MyStoreReview reviewDto) throws Exception;
	
	public int updateReviewReply(int rrep_Num) throws Exception;
	
	public int deleteReviewReply(Map<String, Object>map) throws Exception;
	public int dataCount(int g1_Num);
	public int dataCountYet(int g1_Num);
	public List<MyStoreReview> reviewList(Map<String, Object>map) throws Exception;
	public List<MyStoreReview> reviewListYet(Map<String, Object>map) throws Exception;
	public List<MyStoreReview> reviewReplyList(int rep_Num) throws Exception;
}
