package com.sp.userQna;

import java.util.List;
import java.util.Map;

public interface UserQnaService {
	public int insertUserQna(UserQna dto, String pathname);
	public List<UserQna> listUserQna(Map<String, Object>map); 
	public UserQna readUserQna(int uq_Num);
	public UserQna prereadUserQna(Map<String, Object>map);
	public UserQna nextreadUserQna(Map<String, Object>map);
	public int updateUserQna(UserQna dto, String pathname);
	public int deleteUserQna(int uq_Num, String uq_SaveFilename, String pathname);
	
	

}
