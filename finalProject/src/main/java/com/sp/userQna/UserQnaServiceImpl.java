package com.sp.userQna;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("userQna.userQnaService")
public class UserQnaServiceImpl implements UserQnaService{
    
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertUserQna(UserQna dto, String pathname) {
		int result=0;
		try {
			if(dto.getUpload()!=null && ! dto.getUpload().isEmpty()){
				String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setUq_SaveFilename(saveFilename);
				dto.setUq_OriginalFilename(dto.getUpload().getOriginalFilename());
			}
			result=dao.insertData("userQna.insertUserQna", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<UserQna> listUserQna(Map<String, Object> map) {
		List<UserQna> list=null;
		try {
			list=dao.getListData("userQna.listUserQna", map);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return list;
	}

	@Override
	public UserQna readUserQna(int uq_Num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserQna prereadUserQna(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserQna nextreadUserQna(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int updateUserQna(UserQna dto, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteUserQna(int uq_Num, String uq_SaveFilename, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

}
