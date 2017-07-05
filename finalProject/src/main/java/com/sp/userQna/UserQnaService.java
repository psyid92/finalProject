package com.sp.userQna;

import java.util.List;
import java.util.Map;

public interface UserQnaService {
	public int insertUserQna(UserQna dto, String pathname)throws Exception;
	public List<UserQna> listUserQna(Map<String, Object>map)throws Exception; 
	public int dataCount(Map<String, Object>map)throws Exception;
	public UserQna readUserQna(int uq_Num)throws Exception;
	public UserQna preReadUserQna(Map<String, Object>map)throws Exception;
	public UserQna nextReadUserQna(Map<String, Object>map)throws Exception;
	public int updateUserQna(UserQna dto, String pathname)throws Exception;
	public int deleteUserQna(int uq_Num, String uq_SaveFilename, String pathname)throws Exception;
}
