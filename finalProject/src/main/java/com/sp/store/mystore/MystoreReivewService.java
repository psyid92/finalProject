package com.sp.store.mystore;

import java.util.List;

public interface MystoreReivewService {
	public int insertReviewReply(MyStoreReview reviewDto) throws Exception;
	
	public int updateReviewReply(int rrep_Num) throws Exception;
	
	public int deleteReviewReply(int rrep_Num) throws Exception;
	public int dataCount(int g1_Num);
	public List<MyStoreReview> reviewList(int g1_Num) throws Exception;
	public List<MyStoreReview> reviewListYed(int g1_Num) throws Exception;
	public List<MyStoreReview> reviewReplyList(int rep_Num) throws Exception;
}
