package com.sp.store.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("store.member.storeService")
public class StoreServiceImpl implements StoreService {
	@Autowired
	private CommonDAO dao;
	
	//회원가입하기
	@Override
	public void insertStore(Store store) throws Exception {
		try {
			if(store.getTel1() != null && store.getTel1().length()!=0 &&
					store.getTel2() != null && store.getTel2().length()!=0 &&
					store.getTel3() != null && store.getTel3().length()!=0)
				store.setG2_Tel(store.getTel1 () + "-" + store.getTel2() + "-" + store.getTel3());
			
			dao.insertData("store.insertStore1", store);
			dao.insertData("store.insertStore2", store);
			dao.insertData("store.insertStore3", store);
			
		} catch (Exception e) {
			System.out.println(e.toString());
			
			throw e;
		}
	}

	//정보 읽어오기
	@Override
	public Store readStore(String g1_Id) {
		Store store = null;
		try {
			store = dao.getReadData("store.readStore", g1_Id);
			
			if(store!=null) {
				if(store.getG2_Tel()!=null) {
					String [] s=store.getG2_Tel().split("-");
					store.setTel1(s[0]);
					store.setTel2(s[1]);
					store.setTel3(s[2]);
				}
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return store;
	}

	@Override
	public Store readStore2(String g2_Giupnum) {
		Store store = null;
		try {
			store = dao.getReadData("store.readStore2", g2_Giupnum);
			
			if(store!=null) {
				if(store.getG2_Tel()!=null) {
					String [] s=store.getG2_Tel().split("-");
					store.setTel1(s[0]);
					store.setTel2(s[1]);
					store.setTel3(s[2]);
				}
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return store;
	}

}