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
	public void insertStore(Store dto) throws Exception {
		try {
			if(dto.getTel1() != null && dto.getTel1().length()!=0 &&
					dto.getTel2() != null && dto.getTel2().length()!=0 &&
					dto.getTel3() != null && dto.getTel3().length()!=0)
				dto.setG2_Tel(dto.getTel1 () + "-" + dto.getTel2() + "-" + dto.getTel3());
			
			dao.insertData("store.insertStore1", dto);
			dao.insertData("store.insertStore2", dto);
			dao.insertData("store.insertStore3", dto);
			
		} catch (Exception e) {
			System.out.println(e.toString());
			
			throw e;
		}
	}

	//정보 읽어오기
	@Override
	public Store readStore(String g1_Id) {
		Store dto = null;
		try {
			dto = dao.getReadData("store.readStore", g1_Id);
			
			if(dto!=null) {
				if(dto.getG2_Tel()!=null) {
					String [] s=dto.getG2_Tel().split("-");
					dto.setTel1(s[0]);
					dto.setTel2(s[1]);
					dto.setTel3(s[2]);
				}
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public Store readStore2(String g2_Giupnum) {
		Store dto = null;
		try {
			dto = dao.getReadData("store.readStore2", g2_Giupnum);
			
			if(dto!=null) {
				if(dto.getG2_Tel()!=null) {
					String [] s=dto.getG2_Tel().split("-");
					dto.setTel1(s[0]);
					dto.setTel2(s[1]);
					dto.setTel3(s[2]);
				}
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

}