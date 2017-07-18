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
	public int insertUserFaq(UserFaq dto) {
		int result=0;
		
		try {
			result=dao.insertData("userFaq.insertUserFaq", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
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
	public List<UserFaq> listUserFaqCategory() {
		// TODO Auto-generated method stub
		return null;
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

	@Override
	public int insertCategory(UserFaq dto) {
		int result=0;
		try {
			result=dao.insertData("userFaq.insertCategory", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<UserFaq> listCategory() {
		List<UserFaq> list=null;
		
		try {
			list=dao.getListData("userFaq.listCategory");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCountCategory() {
		int result=0;
		
		try {
			result=dao.getIntValue("userFaq.dataCountCategory");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int deleteCategory(int ca_Num) {
		int result=0;
		
		try {
			dao.deleteData("userFaq.deleteCategory", ca_Num);
			result=1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	

}
