package com.sp.userFaq;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("userFaq.userFaqService")
public class UserFaqServiceImpl implements UserFaqService{
    
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertUserFaq(UserFaq dto) throws Exception {
		try {
			dao.insertData("userFaq.insertUserFaq", dto);
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
	public List<UserFaq> listUserFaq(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateCount(int faq_Num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserFaq readUserFaq(int faq_Num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserFaq preReadUserFaq(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserFaq nextReadUserFaq(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateUserFaq(UserFaq dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteUserFaq(int Faq_Num) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
