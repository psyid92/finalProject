package com.sp.notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {
    public void insertNotice(Notice dto)throws Exception;
    public int dataCount(Map<String, Object>map)throws Exception;
    public List<Notice> listNotice(Map<String, Object>map)throws Exception;
    public List<Notice> listNoticeTop()throws Exception;
    public int updateCount(int  noti_Num)throws Exception;
    public Notice readNotice(int  noti_Num)throws Exception;
    public Notice preReadNotice(Map<String, Object>map)throws Exception;
    public Notice nextReadNotice(Map<String, Object>map)throws Exception;
    public void updateNotice(Notice dto)throws Exception;
    public void deleteNotice(int noti_Num)throws Exception;
}
