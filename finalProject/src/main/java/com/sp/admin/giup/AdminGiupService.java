package com.sp.admin.giup;

import java.util.List;
import java.util.Map;

public interface AdminGiupService {
	public List<AdminGiup> listAdminGiup(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public AdminGiup readAdminGiup(int num);
	
}
