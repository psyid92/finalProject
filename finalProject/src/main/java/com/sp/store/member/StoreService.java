package com.sp.store.member;

public interface StoreService {
	
	//회원가입
	public int insertStore(Store dto) throws Exception;
	
	public void readStore(String g1_Id) throws Exception;
}
