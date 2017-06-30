package com.sp.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("notice.noticeService")
public class NoticeServiceImpl implements NoticeService{
    @Autowired
	private CommonDAO dao; 
	
	@Override
	public void insertNotice(Notice dto) throws Exception {
		try {
			dao.insertData("notice.insertNotice", dto);
		} catch (Exception e) {
			throw e;
		}
		
	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Notice> listNotice(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Notice> listNoticeTop() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateCount(int noti_Num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Notice readNotice(int noti_Num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Notice preReadNotice(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Notice nextReadNotice(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateNotice(Notice dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteNotice(int noti_Num) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
