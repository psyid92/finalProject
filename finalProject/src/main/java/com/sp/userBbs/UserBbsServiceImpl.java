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
				dto.setBbs_OriginalFilename(dto.getUpload().getOriginalFilename());
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
		UserBbs dto=null;
		try {
			dto=dao.getReadData("userBbs.readUserBbs", bbs_Num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int updateCount(int bbs_Num) {
		int result=0;
		try {
			result=dao.updateData("userBbs.updateCount", bbs_Num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public UserBbs preReadUserBbs(Map<String, Object> map) {
		UserBbs dto=null;
		try {
			dto=dao.getReadData("userBbs.preReadUserBbs", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public UserBbs nextReadUserBbs(Map<String, Object> map) {
		UserBbs dto=null;
		try {
			dto=dao.getReadData("userBbs.nextReadUserBbs", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int updateUserBbs(UserBbs dto, String pathname) {
		int result=0;
		try {
			if(dto.getUpload()!=null && !dto.getUpload().isEmpty()){
				if(dto.getBbs_SaveFilename().length()!=0)
					fileManager.doFileDelete(dto.getBbs_SaveFilename(), pathname);
				String newFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
				if(newFilename != null){
					dto.setBbs_OriginalFilename(dto.getUpload().getOriginalFilename());
					dto.setBbs_SaveFilename(newFilename);
				}
			}
			dao.updateData("userBbs.updateUserBbs", dto);
			result=1;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteUserBbs(int bbs_Num, String bbs_SaveFilename, String pathname) {
		int result=0;
		try {
			if(bbs_SaveFilename != null){
				fileManager.doFileDelete(bbs_SaveFilename, pathname);
			}
			dao.deleteData("userBbs.deleteUserBbs", bbs_Num);
			result=1;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int insertUserBbsLike(UserBbs dto) {
		int result=0;
		try {
			result=dao.insertData("userBbs.insertUserBbsLike", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int countUserBbsLike(int bbs_Num) {
		int result=0;
		try {
			result=dao.getIntValue("userBbs.countUserBbsLike", bbs_Num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int insertUserReply(UserReply dto) {
		int result=0;
		try {
			result=dao.insertData("userBbs.insertUserReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<UserReply> listUserReply(Map<String, Object> map) {
		List<UserReply> list=null;
		try {
			list=dao.getListData("userBbs.listUserReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<UserReply> listUserReplyAnswer(int rep_Answer) {
		List<UserReply> list=null;
		try {
			list=dao.getListData("userBbs.listUserReplyAnswer", rep_Answer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int replyDataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.getIntValue("userBbs.replyDataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int replyCountAnswer(int rep_Answer) {
		int result=0;
		try {
			result=dao.getIntValue("userBbs.replyCountAnswer", rep_Answer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteUserReply(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.deleteData("userBbs.deleteUserReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
