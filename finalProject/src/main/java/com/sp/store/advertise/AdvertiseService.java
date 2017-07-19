package com.sp.store.advertise;

import java.util.List;
import java.util.Map;

import com.sp.jumun.Jumun;

public interface AdvertiseService {
	public List<Advertise> listAdvertise() throws Exception;
	public List<Jumun> wayList() throws Exception;
	public int insertNewGiupAd(Advertise dto) throws Exception;
	public int insertAddGiupAd(Advertise dto) throws Exception;
	public int countGiupAd(int g1_Num) throws Exception;
	public String readGiupAd(int g1_Num) throws Exception;
	public List<Advertise> listGiupAd(Map<String, Object> map) throws Exception;
	public int dataCount(int g1_Num) throws Exception;
	public int updateGiupAdState() throws Exception;
}
