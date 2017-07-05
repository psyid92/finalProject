package com.sp.store.member;

public interface StoreService {
	
	//회원가입
	public void insertStore(Store dto) throws Exception;
	public Store readStore(String g1_Id);
	public Store readStore2(String g2_Giupnum);
}
