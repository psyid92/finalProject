package com.sp.blog.guest;

import java.util.List;
import java.util.Map;

public interface GuestService {
	public int insertGuest(Guest dto);
	public List<Guest> listGuest(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public int deleteGuest(Map<String, Object> map);
}
