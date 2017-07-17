package com.sp.store.advertise;

import java.util.List;

import com.sp.jumun.Jumun;

public interface AdvertiseService {
	public List<Advertise> listAdvertise() throws Exception;
	public List<Jumun> wayList() throws Exception;
	public int insertGiupAd (Advertise dto) throws Exception;
}
