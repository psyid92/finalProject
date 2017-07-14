package com.sp.store.mystore;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.store.member.SessionInfo;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller("mystore.myStoreStatController")
public class MyStoreStatController {
	@Autowired
	MyStoreStatService service;
	
	// 메뉴1(통계)
	@RequestMapping(value = "/store/mystore", method = RequestMethod.GET)
	public String mystoreForm(Model model, HttpSession session) {
		SessionInfo info = (SessionInfo)session.getAttribute("store");
		List<MyStoreStat> list=new ArrayList<>();
		try {
			list = service.paySumList(info.getG1_Num());
		} catch (Exception e) { 
			System.out.println(e.toString());
		}
		model.addAttribute("list", list);
		
		model.addAttribute("mainMenu", "0");
		model.addAttribute("subMenu", "1");
		return ".store4.menu1.mystore.list";
	}
	
	@RequestMapping(value="/store/storeSales")
	@ResponseBody
	public String storeSales(Model model, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("store");
		List<MyStoreStat> list=new ArrayList<>();
		
		try {
			// 일매출이 있을때 리스트 g1_num, pay_pay, pay_created, g1_num, g1_name
			list = service.paySumList(info.getG1_Num());
		} catch (Exception e) { 
			System.out.println(e.toString());
		}
		
		//store에 일매출이 있을때의 리스트
		MyStoreStat dayOfList[] = new MyStoreStat[list.size()];
		
		
		// dayOfList의 개수(실제 매출이 있는 날짜의 개수)
		int realDaySales[] = new int[list.size()];
		String realDateInList[] = new String [3];
		
		int dayOfListNum=0;
		Iterator<MyStoreStat> it=list.iterator();
		while(it.hasNext()){
			
			dayOfList[dayOfListNum]=it.next();
			realDateInList=dayOfList[dayOfListNum].getPay_created().split("/");
			//realDaySales[dayOfListNum++]=dayOfList[dayOfListNum];
		}
		
		Calendar cal=Calendar.getInstance();
		
		int year=cal.get(Calendar.YEAR);
		int month=cal.get(Calendar.MONTH);	
		
		// year년 month월 1일로 날짜를 설정
		cal.set(year, month,1);
		
		// y년 m월의 마지막 날짜
		int end=cal.getActualMaximum(Calendar.DATE);
		
		// hichart로 보낼 날짜별 총 매출을 담을 배열
		int daySales[] = new int[end];
		
		
		
		JSONArray arr=new JSONArray();
		JSONObject ob=new JSONObject();
		ob.put("name", "일매출");
		//ob.put("data", )
		
		return arr.toString();
	}
}
