package com.sp.store.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("store.member.storeService")
public class StoreServiceImpl implements StoreService {
	@Autowired
	private CommonDAO dao;

	// 회원가입하기
	@Override
	public void insertStore(Store storeDto) throws Exception {
		try {
			if (storeDto.getTel1() != null && storeDto.getTel1().length() != 0 && storeDto.getTel2() != null
					&& storeDto.getTel2().length() != 0 && storeDto.getTel3() != null
					&& storeDto.getTel3().length() != 0)
				storeDto.setG2_Tel(storeDto.getTel1() + "-" + storeDto.getTel2() + "-" + storeDto.getTel3());

			dao.insertData("store.insertStore1", storeDto);
			dao.insertData("store.insertStore2", storeDto);
			dao.insertData("store.insertStore3", storeDto);

		} catch (Exception e) {
			System.out.println(e.toString());

			throw e;
		}
	}

	// 정보 읽어오기
	@Override
	public Store readStore(String g1_Id) {
		Store storeDto = null;
		try {
			storeDto = dao.getReadData("store.readStore", g1_Id);

			if (storeDto != null) {
				if (storeDto.getG2_Tel() != null) {
					String[] s = storeDto.getG2_Tel().split("-");
					storeDto.setTel1(s[0]);
					storeDto.setTel2(s[1]);
					storeDto.setTel3(s[2]);
				}
			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return storeDto;
	}

	@Override
	public Store readStore2(String g2_Giupnum) {
		Store storeDto = null;
		try {
			storeDto = dao.getReadData("store.readStore2", g2_Giupnum);

			if (storeDto != null) {
				if (storeDto.getG2_Tel() != null) {
					String[] s = storeDto.getG2_Tel().split("-");
					storeDto.setTel1(s[0]);
					storeDto.setTel2(s[1]);
					storeDto.setTel3(s[2]);
				}
			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return storeDto;
	}

	@Override
	public void updateStore(Store storeDto) throws Exception {
		try {
			if (storeDto.getTel1() != null &&
					storeDto.getTel1().length() != 0 
					&& storeDto.getTel2() != null
					&& storeDto.getTel2().length() != 0 
					&& storeDto.getTel3() != null
					&& storeDto.getTel3().length() != 0)
				storeDto.setG2_Tel(storeDto.getTel1() + "-" + storeDto.getTel2() + "-" + storeDto.getTel3());
			dao.updateData("store.updateStore1", storeDto);
			dao.updateData("store.updateStore2", storeDto);
			dao.updateData("store.updateStore3", storeDto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int deleteStore(int g1_Num) throws Exception {
		int result = 0;
		try {
			result = dao.updateData("store.deleteStore", g1_Num);
		} catch (Exception e) {
			result = 0;
			e.printStackTrace();
			throw e;
		}
		return result;
	}

	@Override
	public String findGiupId(Map<String, Object> map) throws Exception {
		String g1_Id = "";
		try {
			g1_Id = dao.getReadData("store.findGiupId", map);
		} catch (Exception e) { 
			e.printStackTrace();
		}
		return g1_Id;
	}

	@Override
	public int findGiupPwd(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = dao.getReadData("store.findGiupPwd",map);
		} catch (Exception e) { 
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int changeGiupPwd(Map<String, Object> map) throws Exception {
		int result=0;
		try{
			result = dao.updateData("store.updateGiupPwd",map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


}