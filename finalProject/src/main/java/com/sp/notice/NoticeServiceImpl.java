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
		int result=0;
		
		try {
			result=dao.getIntValue("notice.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Notice> listNotice(Map<String, Object> map) throws Exception {
		List<Notice> list=null;
		
		try {
			list=dao.getListData("notice.listNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Notice> listNoticeTop() throws Exception {
		List<Notice> list = null;
		
		try {
			list=dao.getListData("notice.listNoticeTop");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int updateCount(int noti_Num) throws Exception {
		int result=0;
		try {
			result=dao.updateData("notice.updateCount", noti_Num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Notice readNotice(int noti_Num) throws Exception {
		Notice dto=null;
		try {
			dto=dao.getReadData("notice.readNotice", noti_Num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Notice preReadNotice(Map<String, Object> map) throws Exception {
		Notice dto=null;
		try {
			dto=dao.getReadData("notice.preReadNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Notice nextReadNotice(Map<String, Object> map) throws Exception {
		Notice dto=null;
		try {
			dto=dao.getReadData("notice.nextReadNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateNotice(Notice dto) throws Exception {
		try {
			dao.updateData("notice.updateNotice", dto);
		} catch (Exception e) {
			throw e;
		}
		
	}

	@Override
	public void deleteNotice(int noti_Num) throws Exception {
		try {
			dao.deleteData("notice.deleteNotice", noti_Num);
		} catch (Exception e) {
		    throw e;
		}
		
	}

}
