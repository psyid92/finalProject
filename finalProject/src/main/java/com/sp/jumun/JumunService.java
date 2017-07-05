package com.sp.jumun;

import java.util.List;
import java.util.Map;

public interface JumunService {
	public List<Jumun> listGiup (Map<String, Object> map) throws Exception;
	public List<Jumun> readMenuCategory (int g1_Num) throws Exception;
	public List<Jumun> readMainMenu (int menuct_Num) throws Exception;
	public List<Jumun> readSubMenu (int mainmenu_Num) throws Exception;
	
}
