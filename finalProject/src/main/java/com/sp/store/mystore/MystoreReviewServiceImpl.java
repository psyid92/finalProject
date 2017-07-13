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
			result = dao.getIntValue("storerivew.reviewRepSeq");
			reviewDto.setRrep_Num(result);
			result = dao.insertData("storerivew.insertReply", reviewDto);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public List<MyStoreReview> reviewList(int g1_Num) throws Exception {
		List<MyStoreReview> reviewlistAll = new ArrayList<>();
		try {
			reviewlistAll = dao.getListData("storerivew.reviewlistAll",g1_Num);
		} catch (Exception e) {
		}
		return reviewlistAll;
	}
	
	@Override
	public List<MyStoreReview> reviewListYed(int g1_Num) throws Exception {
		List<MyStoreReview> reviewlistYet = new ArrayList<>();
		try {
			reviewlistYet = dao.getListData("storerivew.reviewlistYet",g1_Num);
		} catch (Exception e) {
		}
		return reviewlistYet;
	}
	
	@Override
	public int updateReviewReply(int rrep_Num) throws Exception {
		return 0;
	}

	@Override
	public int deleteReviewReply(int rrep_Num) throws Exception {
		return 0;
	}

	
}
