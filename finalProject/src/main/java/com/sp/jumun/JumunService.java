package com.sp.jumun;

import java.util.List;
import java.util.Map;

public interface JumunService {
	public List<Jumun> listCategory() throws Exception;
	public List<Jumun> listGiup (Map<String, Object> map) throws Exception;
	public List<Jumun> readMenuCategory (int g1_Num) throws Exception;
	public List<Jumun> readMainMenu (int menuct_Num) throws Exception;
	public List<Jumun> readSubMenu (int mainmenu_Num) throws Exception;
	public List<Jumun> mainJumunMenu (String mainmenu_Num[]) throws Exception;
	public List<Jumun> subJumunMenu (String submenu_Num[]) throws Exception;
	public List<Jumun> listPayMethod() throws Exception;
	public int readMileage(String m1_Email) throws Exception;
	public List<Review> listReview (int g1_Num) throws Exception;
	public List<Review> listGiupReview(int g1_Num) throws Exception;
	public int likeGiup(Map<String, Object> map) throws Exception;
	public int insertLikeGiup(Map<String, Object> map) throws Exception;
	public int deleteLikeGiup(Map<String, Object> map) throws Exception;
	public void insertRefund(Map<String, Object> map) throws Exception;
	
	/*
	 * ---------- Member - 주문내역 가져오기
	 */
	public JumunMember readmyPayJumunNum(int jumun_Num) throws Exception;
	public List<JumunMember> listmyPay(int m1_num) throws Exception;
	public List<JumunMember> detailmyPay(Map<String, Object> map) throws Exception;
}
