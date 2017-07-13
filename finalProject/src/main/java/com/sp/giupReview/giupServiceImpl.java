package com.sp.giupReview;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("giupReviewService")
public class giupServiceImpl  implements giupReviewService{
	
	@Autowired
	private CommonDAO dao;

	//등록 - 삽입
	@Override
	public int insertReview(giupReview dto) throws Exception {
		int result = 0;
		try {
			result = dao.insertData("giupreview.insertGiupReview", dto); 
		} catch (Exception e) {
		}
		return result;
	}

	//확인
	@Override
	public int getNumReview(giupReview dto) throws Exception {
		int result = 0;
		try {
			result = dao.getReadData("giupreview.getNumReview", dto);
		} catch (Exception e) {
		}
		return result;
	}

	//읽기
	@Override
	public giupReview getReview(giupReview dto) throws Exception {
		giupReview review = new giupReview();
		try {
			review = dao.getReadData("giupreview.getReview", dto);
		} catch (Exception e) {
		}
		return review;
	}

	//삭제
	@Override
	public int deleteReview(giupReview dto) throws Exception {
		int result = 0;
		try {
			result = dao.deleteData("giupreview.deleteReview", dto);
		} catch (Exception e) {
		}
		return result;
	}

}
