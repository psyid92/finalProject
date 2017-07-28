package com.sp.userEvent;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("userEvent.userEventService")
public class UserEventServiceImpl implements UserEventService{
    
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;

	private MultipartFile mf;
	
	     
	@Override
	public int insertUserEvent(UserEvent dto, String pathname) {
		int result=0;
		try {
			result=dao.insertData("userEvent.insertUserEvnet", dto);
			
			if(! dto.getUpload().isEmpty()){
				for(MultipartFile mf:dto.getUpload())
					if(mf.isEmpty())
						continue;
				
				    String saveFilename=fileManager.doFileUpload(mf, pathname);
				    if(saveFilename!=null){
				    	String originalFilename=mf.getOriginalFilename();
				    	long fileSize=mf.getSize();
				    	
				    	dto.setEv_OriginalFilename(originalFilename);
				    	dto.setEv_SaveFilename(saveFilename);
				    	dto.setFileSize(fileSize);
				    	
				    	insertFile(dto);
				    }
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<UserEvent> listUserEvent(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateCount(int ev_Num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserEvent readUserEvent(int ev_Num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserEvent preReadUserEvent(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserEvent nextReadUserEvent(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateUserEvent(UserEvent dto, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteUserEvent(int ev_Num, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertFile(UserEvent dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<UserEvent> listFile(int ev_Num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserEvent readFile(int fileNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteFile(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

}
