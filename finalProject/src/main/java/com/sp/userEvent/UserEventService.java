package com.sp.userEvent;

import java.util.List;
import java.util.Map;
                     
public interface UserEventService {
	public int insertUserEvent(UserEvent dto, String pathname);
	public int dataCount(Map<String, Object>map);
    public List<UserEvent> listUserEvent(Map<String, Object>map);
    public int updateCount(int ev_Num);
    public UserEvent readUserEvent(int ev_Num);
    public UserEvent preReadUserEvent(Map<String, Object>map);
    public UserEvent nextReadUserEvent(Map<String, Object>map);
    public int updateUserEvent(UserEvent dto, String pathname);
    public int deleteUserEvent(int ev_Num, String pathname);
    
    public int insertFile(UserEvent dto);
    public List<UserEvent>listFile(int ev_Num);
    public UserEvent readFile(int fileNum);
    public int deleteFile(Map<String, Object>map);
    
}
