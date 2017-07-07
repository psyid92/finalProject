package com.sp.userBbs;

import java.util.List;
import java.util.Map;

public interface UserBbsService {
    public int insertUserBbs(UserBbs dto, String pathname);
    public List<UserBbs> listUserBbs(Map<String, Object>map);
    public int dataCount(Map<String, Object>map);
    public UserBbs readuserBbs(int bbs_Num);
    public int updateCount(int bbs_Num);
    public UserBbs preReadUserBbs(Map<String, Object>map);
    public UserBbs nextReadUserBbs(Map<String, Object>map);
    public int updateUserBbs(UserBbs dto, String pathname);
    public int deleteUserBbs(int bbs_Num, String bbs_SaveFilename, String pathname);
    
    public int insertUserbbsLike(UserBbs dto);
    public int countUserbbsLike(int bbs_Num);
    
    public int insertUserReply(UserReply dto);
    public List<UserReply> listUserReply(Map<String, Object>map);
    public List<UserReply> listUserReplyAnswer(int answer);
    public int replyDataCount(Map<String, Object>map);
    public int replyCountAnswer(int answer);
    public int deleteUserReply(Map<String, Object>map);
    
}
