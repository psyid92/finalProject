package com.sp.store.member;

public interface StoreService {
	
	//회원가입
	public void insertStore(Store storeDto) throws Exception;
	public Store readStore(String g1_Id);
	public Store readStore2(String g2_Giupnum);
	
	public void updateStore(Store storeDto)throws Exception;
	public void deleteStore(int g1_Num) throws Exception;
}
