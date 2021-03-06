package com.sp.store.mystore;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("store.mystore.myStoreService")
public class MyStoreServiceImpl implements MyStoreService{
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager filemanger;
	@Override
	public int insertMenuCT(MyStore mystoreDto) throws Exception {
		int result = 0;
		try {
			result=dao.getIntValue("menu.seqmenuct");
			mystoreDto.setMenuct_Num(result);
			result = dao.insertData("menu.insertMenuCT", mystoreDto);
		} catch (Exception e) {
			result = 0;
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int insertMainMenu(MyStore mystoreDto, String path) throws Exception {
		int result = 0;
		try {
				//사진 업로드
				String newFilename = filemanger.doFileUpload(mystoreDto.getUpload(), path);
				
				result=dao.getIntValue("menu.seqmainmenu");
				mystoreDto.setMainmenu_Num(result);
				mystoreDto.setMainmenu_Photo(newFilename);
				
				result = dao.insertData("menu.insertMainMenu", mystoreDto);
		} catch (Exception e) {
			result = 0;
			System.out.println(e.toString());
			
		}
		return result;
	}

	@Override
	public int insertSubMenu(MyStore mystoreDto) throws Exception {
		int result = 0;
		try {
			result=dao.getIntValue("menu.seqsubmenu");
			mystoreDto.setSubmenu_Num(result);
			result = dao.insertData("menu.insertSubMenu", mystoreDto);
		} catch (Exception e) {
			result = 0;
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updateMenuCT(int menuct_Num) throws Exception {
		int result = 0;
		try {
			result = dao.updateData("menu.updateMenuCT", menuct_Num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updateMainMenu(int mainmenu_Num) throws Exception {
		int result = 0;
		try {
			result = dao.updateData("menu.updateMainMenu", mainmenu_Num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updateSubMenu(int submenu_Num) throws Exception {
		int result = 0;
		try {
			result = dao.updateData("menu.updateSubmenu", submenu_Num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<MyStore> readMenuCT(int g1_Num) throws Exception {
		List<MyStore> menuctlist = new ArrayList<>();
		try {
			menuctlist = dao.getListData("menu.readMenuCT", g1_Num);
		} catch (Exception e) {
			throw e;
		}
		return menuctlist;
	}

	@Override
	public List<MyStore> readMainMenu(int menuct_num) throws Exception {
		List<MyStore> mainmenulist = new ArrayList<>();
		try {
			mainmenulist = dao.getListData("menu.readMainMenu", menuct_num);
		} catch (Exception e) {
			throw e;
		}
		return mainmenulist;
	}

	@Override
	public List<MyStore> readSubmenu(int mainmenu_Num) throws Exception {
		List<MyStore> submenulist = new ArrayList<>();
		try {
			submenulist = dao.getListData("menu.readSubMenu", mainmenu_Num);
		} catch (Exception e) {
			throw e;
		}
		return submenulist;
	}
}
