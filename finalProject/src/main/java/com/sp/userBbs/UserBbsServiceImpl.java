package com.sp.userBbs;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("userBbs.userBbsService")
public class UserBbsServiceImpl implements UserBbsService{
    
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertUserBbs(UserBbs dto, String pathname) {
		int result=0;
		try {
			if(dto.getUpload()!=null && ! dto.getUpload().isEmpty()){
				String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setBbs_SaveFilename(saveFilename);
				dto.setBbs_Originalfilename(dto.getUpload().getOriginalFilename());
			}
			result=dao.insertData("userBbs.insertUserBbs", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<UserBbs> listUserBbs(Map<String, Object> map) {
		List<UserBbs>list=null;
		try {
			list=dao.getListData("userBbs.listUserBbs", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.getIntValue("userBbs.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public UserBbs readuserBbs(int bbs_Num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateCount(int bbs_Num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserBbs preReadUserBbs(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserBbs nextReadUserBbs(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateUserBbs(UserBbs dto, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteUserBbs(int bbs_Num, String bbs_SaveFilename, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertUserbbsLike(UserBbs dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int countUserbbsLike(int bbs_Num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertUserReply(UserReply dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<UserReply> listUserReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserReply> listUserReplyAnswer(int answer) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int replyDataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int replyCountAnswer(int answer) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteUserReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

}
