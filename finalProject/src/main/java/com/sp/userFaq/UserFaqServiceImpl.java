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
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.getIntValue("userFaq.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<UserFaq> listUserFaq(Map<String, Object> map) {
		List<UserFaq> list =null;
		
		try {
			list=dao.getListData("userFaq.listUserFaq", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<UserFaq> listUserFaqCategory() {
        List<UserFaq> list =null;
		
		try {
			list=dao.getListData("userFaq.listUserFaqCategory");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public UserFaq readUserFaq(int faq_Num){
		UserFaq dto= null;
		try {
			dto=dao.getReadData("userFaq.readUserFaq", faq_Num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}


	@Override
	public int updateUserFaq(UserFaq dto) throws Exception {
		int result=0;
		
		try {
			result=dao.updateData("userFaq.updateUserFaq", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}

	@Override
	public int deleteUserFaq(int faq_Num) throws Exception {
		int result=0;
		
		try {
			result=dao.deleteData("userFaq.deleteUserFaq", faq_Num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
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
