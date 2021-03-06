package com.sp.store.mystore;

import java.util.List;

public interface MyStoreService {
	public int insertMenuCT(MyStore dto) throws Exception;
	public int insertMainMenu(MyStore dto, String path) throws Exception;
	public int insertSubMenu(MyStore dto) throws Exception;
	
	public int updateMenuCT(int menuct_Num) throws Exception;
	public int updateMainMenu(int mainmenu_Num) throws Exception;
	public int updateSubMenu(int submenu_Num) throws Exception;
	
	public List<MyStore> readMenuCT(int g1_Num) throws Exception;
	public List<MyStore> readMainMenu(int menuCT_Num) throws Exception;
	public List<MyStore> readSubmenu(int mainmenu_Num) throws Exception;
}
