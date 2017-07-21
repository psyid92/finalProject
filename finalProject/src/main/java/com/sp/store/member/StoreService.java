package com.sp.store.member;

import java.util.Map;

public interface StoreService {
	
	//회원가입
	public void insertStore(Store storeDto) throws Exception;
	public Store readStore(String g1_Id);
	public Store readStore2(String g2_Giupnum);
	
	public void updateStore(Store storeDto)throws Exception;
	public int deleteStore(int g1_Num) throws Exception;
	
	
	public String findGiupId(Map<String, Object> map) throws Exception;
	public int findGiupPwd(Map<String, Object> map) throws Exception;
	public int changeGiupPwd(Map<String, Object> map) throws Exception;
}
