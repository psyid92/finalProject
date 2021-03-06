package com.sp.giupReview;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.swing.plaf.synth.SynthSpinnerUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("giupReviewService")
public class giupServiceImpl implements giupReviewService {

	@Autowired
	private CommonDAO dao;

	@Autowired
	private FileManager fileManager;

	// 등록 - 삽입
	@Override
	public int insertReview(giupReview dto, String pathname) throws Exception {
		int result = 0;

		try {
			int seq = dao.getReadData("giupreview.selectReviewSeq");
			dto.setRep_num(seq);

			// 사진 업로드
			String newFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
			dto.setRphoto_SaveFilename(newFilename);
			dto.setRphoto_OriginalFilename(dto.getUpload().getOriginalFilename());
			
			result = dao.insertData("giupreview.insertGiupReview", dto);
			dao.insertData("giupreview.insertReviewPhoto", dto);
			
		} catch (Exception e) {
		}
		return result;
	}

	// 확인
	@Override
	public int getNumReview(giupReview dto) throws Exception {
		int result = 0;
		try {
			result = dao.getReadData("giupreview.getNumReview", dto);
		} catch (Exception e) {
		}
		return result;
	}

	// 읽기
	@Override
	public giupReview getReview(giupReview dto) throws Exception {
		giupReview review = new giupReview();
		try {
			review = dao.getReadData("giupreview.getReviewWithPhoto", dto);
			
			if(review != null){
					String myStar = "";
					int star = review.getRep_star();
					for(int a=0; a<5; a++){
						if(a < star){
							myStar += "★";
						} else {
							myStar += "☆";
						}
						review.setMyStar(myStar);

				}
			}
		} catch (Exception e) {
		}
		return review;
	}

	// 삭제
	@Override
	public int deleteReview(giupReview dto) throws Exception {
		int result = 0;
		try {
			result = dao.deleteData("giupreview.deleteReview", dto);
		} catch (Exception e) {
		}
		return result;
	}

	// 회원 - 리뷰 리스트
	@Override
	public List<giupReview> getListMyReview(giupReview dto, String pathname) throws Exception {
		List<giupReview> list = new ArrayList<>();
		try {
			// 리스트 가져오기
			list = dao.getListData("giupreview.getReviewListWithPhoto", dto);
			
				if(! list.isEmpty()){
					for (giupReview rev : list) {
						String myStar = "";
						int star = rev.getRep_star();
						for(int a=0; a<5; a++){
							if(a < star){
								myStar += "★";
							} else {
								myStar += "☆";
							}
							rev.setMyStar(myStar);
						}
					}
				}
				
		} catch (Exception e) {
		}
		return list;
	}

	
	
	/*----------------------------------------------------------------------------
	 *----------------------------------------------------------------------------
	 *                            모든 리뷰 - Admin 
	 * ---------------------------------------------------------------------------
	 */
	@Override
	public List<giupReview> getListAllReview(Map<String, Object> map) throws Exception {
		List<giupReview> list = new ArrayList<>();
		try {
			list = dao.getListData("giupreview.getReviewAllList", map);
			
			if(! list.isEmpty()){
				for (giupReview rev : list) {
					String myStar = "";
					int star = rev.getRep_star();
					for(int a=0; a<5; a++){
						if(a < star){
							myStar += "★";
						} else {
							myStar += "☆";
						}
						rev.setMyStar(myStar);
					}
				}
			}
			
		} catch (Exception e) {
		}
		return list;
	}

	//데이터 수 가져오기
	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = dao.getReadData("giupreview.getDataCount", map);
		} catch (Exception e) {
		}
		return result;
	}

}
