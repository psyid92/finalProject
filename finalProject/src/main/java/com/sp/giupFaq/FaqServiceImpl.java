 package com.sp.giupFaq;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("giupFaq.faqService")
public class FaqServiceImpl implements FaqService{
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertFaq(Faq dto) {
		int result = 0;
		
		try {
			result= dao.insertData("giupFaq.insertFaq", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.getIntValue("giupFaq.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Faq> listFaq(Map<String, Object> map) {
		List<Faq> list = null;
		
		try {
			list = dao.getListData("giupFaq.listFaq", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Faq> listedFCate() {
		List<Faq> list = null;
		
		try {
			list = dao.getListData("giupFaq.listedFCate");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Faq readFaq(int f_Num) {
		Faq dto = null;
		
		try {
			dto = dao.getReadData("giupFaq.readFaq", f_Num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int updateHitCount(int f_Num) {
		int result = 0;
		
		try {
			result = dao.updateData("giupFaq.updateHitCount", f_Num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int updateFaq(Faq dto) {
		int result = 0;
		
		try {
			result = dao.updateData("giupFaq.updateFaq", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int deleteFaq(int f_Num) {
		int result = 0;
		
		try {
			result = dao.deleteData("giupFaq.deleteFaq", f_Num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void insertFCate(Faq dto) throws Exception {
		try {
			dao.insertData("giupFaq.insertFCate", dto);
		} catch (Exception e) {
			throw e;
		}
		
	}

	@Override
	public List<Faq> listFCate() {
		List<Faq> list = null;
		
		try {
			list = dao.getListData("giupFaq.listFCate");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCountFCate() {
		int result = 0;
		try {
			result = dao.getIntValue("giupFaq.dataCountFCate");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void deleteFCate(int fCate_Num) throws Exception {
		try {
			dao.deleteData("giupFaq.deleteFCate", fCate_Num);
		} catch (Exception e) {
			throw e;
		}
		
	}

}
