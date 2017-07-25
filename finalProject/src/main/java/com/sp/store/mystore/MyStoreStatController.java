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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.store.member.SessionInfo;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller("mystore.myStoreStatController")
public class MyStoreStatController {
	@Autowired
	MyStoreStatService service;
	
	// 메뉴1(통계)
	@RequestMapping(value = "/store/mystore")
	public String mystoreForm(Model model, HttpSession session) {
		
		Calendar cal=Calendar.getInstance();
		
		int cur_Year=cal.get(Calendar.YEAR);
		int cur_Month=cal.get(Calendar.MONTH)+1;	
		
		model.addAttribute("mainMenu", "0");
		model.addAttribute("subMenu", "4");
		model.addAttribute("cur_Year",cur_Year);
		model.addAttribute("cur_Month",cur_Month);
		return ".store4.menu1.mystore.list";
	}
	
	@RequestMapping(value="/store/storeSales", produces="application/json; charset=utf-8")
	@ResponseBody
	public String storeSales(Model model, HttpSession session
			,@RequestParam(value="cur_Year", defaultValue="0") int cur_Year
			,@RequestParam(value="cur_Month", defaultValue="0") int cur_Month
			) throws Exception {
		
		System.out.println(cur_Year);
		System.out.println(cur_Month);
		
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
		String realDateSales[][] = new String[list.size()][3];
		
		int dayOfListNum=0;
		
		Calendar cal=Calendar.getInstance();
		int year, month;
		
		//년도 선택을 안했으면 현재년도
		year=cur_Year==0?cal.get(Calendar.YEAR):cur_Year;
		//달 선택을 안했으면 현재 달
		month=cur_Month==0?month=cal.get(Calendar.MONTH):cur_Month-1;
		
		// year년 month월 1일로 날짜를 설정
		cal.set(year, month,1);
		
		// y년 m월의 마지막 날짜
		int end=cal.getActualMaximum(Calendar.DATE);
		
		// highchart로 보낼 날짜별 총 매출을 담을 배열 (1~최고 31일까지)
		int daySales[] = new int[end];
		int daySalesMonth=0;
		// 판매 총액
		int totalDaySales[] = new int[end];
		int totalDaySalesMonth=0;
		
		Iterator<MyStoreStat> it=list.iterator();
		while(it.hasNext()){
			dayOfList[dayOfListNum]=it.next();
			
			//realDateSales[][0] : 년도(4자리)  ,  realDateSales[][1] : 월  ,  realDateSales[][2] : 일
			
			realDateSales[dayOfListNum]=dayOfList[dayOfListNum].getPay_created().substring(0, 10).split("/");
			
			//일매출이 있을때 해당 날짜에 매출액 넣기
			//고객이 결제한 금액
			if(Integer.parseInt(realDateSales[dayOfListNum][0])==year && Integer.parseInt(realDateSales[dayOfListNum][1])==(month+1)){
				daySales[Integer.parseInt(realDateSales[dayOfListNum][2])-1]+=dayOfList[dayOfListNum].getPay_pay();
				totalDaySales[Integer.parseInt(realDateSales[dayOfListNum][2])-1]+=dayOfList[dayOfListNum].getMenuTotalPay();
				daySalesMonth+=dayOfList[dayOfListNum].getPay_pay();
				totalDaySalesMonth+=dayOfList[dayOfListNum].getMenuTotalPay();
				dayOfListNum++;
			} else {
				it.remove();
			}
		}
		
		JSONArray arr=new JSONArray();
		JSONObject ob;
		ob=new JSONObject();
		ob.put("name", "결제금액");
		ob.put("data", daySales);
		//ob.put("ajaxYear", year);
		//ob.put("ajaxMonth", month);
		arr.add(ob);
		ob=new JSONObject();
		ob.put("name", "판매총액");
		ob.put("data", totalDaySales);
		arr.add(ob);
		
		JSONObject job=new JSONObject();
		job.put("year", year);
		job.put("series", arr);
		job.put("list", list);
		job.put("daySalesMonth", daySalesMonth);
		job.put("totalDaySalesMonth", totalDaySalesMonth);
		
		return job.toString();
	}
}
