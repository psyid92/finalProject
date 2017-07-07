package com.sp.store.mystore;

public interface MyStoreService {
	public int insertMenuCT(MyStore dto) throws Exception;
	public int insertMainMenu(MyStore dto) throws Exception;
	public int insertSubMenu(MyStore dto) throws Exception;
	
	public int deleteMenuCT(int menuct_Num) throws Exception;
	public int deleteMainMenu(int mainmenu_Num) throws Exception;
	public int deleteSubMenu(int submenu_Num) throws Exception;
}
