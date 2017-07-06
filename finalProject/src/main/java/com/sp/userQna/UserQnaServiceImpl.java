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
		UserQna dto=null;
		try {
			dto=dao.getReadData("userQna.readUserQna", uq_Num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public UserQna preReadUserQna(Map<String, Object> map) {
		UserQna dto=null;
		try {
			dto=dao.getReadData("userQna.preReadUserQna", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public UserQna nextReadUserQna(Map<String, Object> map) {
		UserQna dto=null;
		try {
			dto=dao.getReadData("userQna.nextReadUserQna", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}


	@Override
	public int updateUserQna(UserQna dto, String pathname) {
		int result=0;
		try {
			if(dto.getUpload()!=null && !dto.getUpload().isEmpty()){
				//이전 파일 지우기
				if(dto.getUq_SaveFilename().length()!=0)
					fileManager.doFileDelete(dto.getUq_SaveFilename(), pathname);
				String newfilename = fileManager.doFileUpload(dto.getUpload(), pathname);
				if(newfilename != null){
					dto.setUq_OriginalFilename(dto.getUpload().getOriginalFilename());
				}
			}
			dao.updateData("userQna.updateUserQna", dto);
			result=1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteUserQna(int uq_Num, String uq_SaveFilename, String pathname) {
		int result=0;
		try {
			if(uq_SaveFilename != null){
				fileManager.doFileDelete(uq_SaveFilename, pathname);
			}
			dao.deleteData("userQna. deleteUserQna", uq_Num);
			result=1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result=0;
		try {
			result=dao.getIntValue("userQna.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
