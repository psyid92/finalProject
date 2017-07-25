package com.sp.jumun;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("jumun.jumunService")
public class JumunServiceImpl implements JumunService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Jumun> listGiup(Map<String, Object> map) throws Exception {
		List<Jumun> list = new ArrayList<>();
		try {
			list = dao.getListData("jumun.listGiup", map);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}
	
	@Override
	public List<Jumun> readMenuCategory(int g1_Num) throws Exception {
		List<Jumun> list = new ArrayList<>();
		try {
			list = dao.getListData("jumun.readMenuCategory", g1_Num);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public List<Jumun> readMainMenu(int menuct_Num) throws Exception {
		List<Jumun> list = new ArrayList<>();
		try {
			list = dao.getListData("jumun.readMainMenu", menuct_Num);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public List<Jumun> readSubMenu(int mainmenu_Num) throws Exception {
		List<Jumun> list = new ArrayList<>();
		try {
			list = dao.getListData("jumun.readSubMenu", mainmenu_Num);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public List<Jumun> mainJumunMenu(String mainmenu_Num[]) throws Exception {
		List<Jumun> list = new ArrayList<>();
		try {
			for (int i = 0; i < mainmenu_Num.length; i++) {
				Jumun dto = new Jumun();
				dto = dao.getReadData("jumun.mainJumunMenu", mainmenu_Num[i]);
				list.add(dto);
			}
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public List<Jumun> subJumunMenu(String submenu_Num[]) throws Exception {
		List<Jumun> list = new ArrayList<>();
		try {
			for (int i = 0; i < submenu_Num.length; i++) {
				Jumun dto = new Jumun();
				dto = dao.getReadData("jumun.subJumunMenu", submenu_Num[i]);
				list.add(dto);
			}
		} catch (Exception e) {
			throw e;
		}
		return list;
	}
	
	@Override
	public List<Jumun> listPayMethod() throws Exception {
		List<Jumun> list = new ArrayList<>();
		try {
			list = dao.getListData("jumun.listPayMethod");
		} catch (Exception e) {
			throw e;
		}
		return list;
	}
	
	/*
	 * -------------------------------------------------
	 * 			MEMBER : GetList
	 */
	//회원 - 
	@Override
	public JumunMember readmyPayJumunNum(int jumun_Num) throws Exception {
		JumunMember dto = new JumunMember();
		try {
			dto = dao.getReadData("jumun.getMemberPayJumunNum", jumun_Num);
		} catch (Exception e) {
			throw e;
		}
		return dto;
	}
	
	@Override
	public List<JumunMember> listmyPay(int m1_num) throws Exception {
		List<JumunMember> list = new ArrayList<>();
		try {
			list = dao.getListData("jumun.getMemberPayList", m1_num);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public List<JumunMember> detailmyPay(Map<String, Object> map) throws Exception {
		List<JumunMember> list = new ArrayList<>();
		try {
			list = dao.getListData("jumun.getMemberPayDetail", map);
		} catch (Exception e) {
		}
		return list;
	}
	
	
	// 마일리지
	@Override
	public int readMileage(String m1_Email) throws Exception {
		int mil_Point = 0;
		try {
			mil_Point = dao.getReadData("mileage.getMemberMileage", m1_Email);
		} catch (Exception e) {
			throw e;
		}
		return mil_Point;
	}

	@Override
	public List<Jumun> listCategory() throws Exception {
		List<Jumun> list = new ArrayList<>();
		try {
			list = dao.getListData("jumun.listCategory");
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public List<Review> listReview(int g1_Num) throws Exception {
		List<Review> list = new ArrayList<>();
		try {
			list = dao.getListData("jumun.listReview", g1_Num);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}
	
	@Override
	public List<Review> listGiupReview(int g1_Num) throws Exception {
		List<Review> list = new ArrayList<>();
		try {
			list = dao.getListData("jumun.listGiupReview", g1_Num);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}
	
	@Override
	public int likeGiup(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = dao.getIntValue("jumun.likeGiup", map);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	@Override
	public int insertLikeGiup(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = dao.insertData("jumun.insertLikeGiup", map);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	@Override
	public int deleteLikeGiup(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = dao.deleteData("jumun.deleteLikeGiup", map);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	@Override
	public void insertRefund(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("jumun.insertRefund", map);
		} catch (Exception e) {
			throw e;
		}
	}
}
