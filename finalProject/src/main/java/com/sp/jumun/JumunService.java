package com.sp.jumun;

import java.util.List;
import java.util.Map;

public interface JumunService {
	public List<Jumun> listGiup (Map<String, Object> map) throws Exception;
	public List<Jumun> readMenuCategory (int g1_Num) throws Exception;
	public List<Jumun> readMainMenu (int menuct_Num) throws Exception;
	public List<Jumun> readSubMenu (int mainmenu_Num) throws Exception;
	public List<Jumun> mainJumunMenu (String mainmenu_Num[]) throws Exception;
	public List<Jumun> subJumunMenu (String submenu_Num[]) throws Exception;
	
	/*
	 * ---------- Member - 주문내역 가져오기
	 */
	
	public List<JumunMember> listmyPay(int m1_num) throws Exception;
	public JumunMember detailmyPay(JumunMember dto) throws Exception;
}
