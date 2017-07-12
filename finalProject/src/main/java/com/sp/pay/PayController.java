package com.sp.pay;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.member.SessionInfo;

@Controller("pay.payController")
public class PayController {
	@Autowired
	private PayService service;
	
	@RequestMapping(value="/pay/pay", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> paySuccess(Pay dto, String main_Nums, String sub_Nums, @RequestParam(value="mileage",defaultValue="0") int mil_Point,  HttpSession session) throws Exception {
		Map<String, Object> model = new HashMap<>();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String []main_Num = main_Nums.split(",");
		String []sub_Num = sub_Nums.split(",");
		dto.setOrders_Num(3);
		
		service.insertJumun(dto);
		for (int i = 0; i < main_Num.length; i++) {
			dto.setMainmenu_Num(Integer.parseInt(main_Num[i]));
			dto.setMainGoods_Count(1);
			service.insertMainGoods(dto);
			if (sub_Num != null && sub_Num.length > 0 && sub_Num[i] != null && sub_Num[i].length() > 0) {
				dto.setSubmenu_Num(Integer.parseInt(sub_Num[i]));
				service.insertSubGoods(dto);
			}
		}
		dto.setPayMethod_Num(1);
		service.insertPay(dto);
		
		Map<String, Object> map = new HashMap<>();
		map.put("m1_Num", info.getM1_Num());

		if (mil_Point > 0) {
			map.put("mil_State", "사용");
			map.put("mil_Point", mil_Point);
			service.insertMileage(map);
			service.useMemberMileage(map);
		} else if (mil_Point == 0) {
			map.put("mil_State", "적립");
			mil_Point = dto.getJumun_Pay() / 100;
			map.put("mil_Point", mil_Point);
			service.insertMileage(map);
			service.earnMemberMileage(map);
		}
		
		return model;
	}
}
