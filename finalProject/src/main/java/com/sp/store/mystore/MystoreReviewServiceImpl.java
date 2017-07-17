package com.sp.store.mystore;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("store.review.mystoreReviewServiceImpl")
public class MystoreReviewServiceImpl implements MystoreReivewService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertReviewReply(MyStoreReview reviewDto) throws Exception {
		int result = 0;
		try {
			result = dao.getIntValue("storereview.reviewRepSeq");
			reviewDto.setRrep_Num(result);
			result = dao.insertData("storereview.insertReply", reviewDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<MyStoreReview> reviewList(int g1_Num) throws Exception {
		List<MyStoreReview> reviewlistAll = new ArrayList<>();
		try {
			reviewlistAll = dao.getListData("storereview.reviewlistAll",g1_Num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reviewlistAll;
	}
	
	@Override
	public List<MyStoreReview> reviewListYed(int g1_Num) throws Exception {
		List<MyStoreReview> reviewlistYet = new ArrayList<>();
		try {
			reviewlistYet = dao.getListData("storereview.reviewlistYet",g1_Num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reviewlistYet;
	}
	
	@Override
	public List<MyStoreReview> reviewReplyList(int rep_Num) throws Exception {
		List<MyStoreReview> reviewReplyList = new ArrayList<>();
		try {
			reviewReplyList = dao.getListData("storereview.reviewReplylist",rep_Num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reviewReplyList;
	}
	@Override
	public int updateReviewReply(int rrep_Num) throws Exception {
		return 0;
	}

	@Override
	public int deleteReviewReply(int rrep_Num) throws Exception {
		return 0;
	}

	@Override
	public int dataCount(int g1_Num) {
		int result = 0;
		try {
			result = dao.getIntValue("storereview.dataCount",g1_Num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	
}