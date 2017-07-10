package com.sp.giupNotice;

import java.util.List;
import java.util.Map;

public interface NoticeService {
	public int insertNotice(Notice dto, String pathname);
	public int dataCount (Map<String, Object> map);
	public List<Notice> listNotice(Map<String, Object> map);
	public List<Notice> listNoticeTop();
	public int updateHit(int num);
	public Notice readNotice(int num);
	public Notice preReadNotice(Map<String, Object> map);
	public Notice nextReadNotice(Map<String, Object> map);
	public int updateNotice(Notice dto, String pathname);
	public int deleteNotice(Notice dto, String pathname); 
	
	public int insertFile(Notice dto);
	public List<Notice> listFile(int num);
	public Notice readFile(int filenum);
	public int deleteFile(Map<String, Object> map);
}
