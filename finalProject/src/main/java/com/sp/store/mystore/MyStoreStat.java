package com.sp.store.mystore;
/*
--orders_num 3:주문완료 4:주문승인 5:취소 6:배달완료
--pay_created : 주문한 날짜와 시간, menuct_title : 스토어 메뉴 큰 카테고리
--mainmenu_title : 메인메뉴 타이틀, submenu_title : 서브메뉴 타이틀
--pay_pay : 고객 실제 결제 금액
--menuct_count : 메인메뉴(타이틀) 기준의 판매 개수
--menuTotalPay : 메인메뉴(타이틀) 기준의 판매 개수*단가=총합
*/
public class MyStoreStat {
	private int jumun_num;
	private String pay_created, menuct_title, mainmenu_title, submenu_title;
	private int orders_num, pay_pay, menuct_count, menuTotalPay;
	private int g1_num;
	private String g1_name;
	
	public int getG1_num() {
		return g1_num;
	}
	public void setG1_num(int g1_num) {
		this.g1_num = g1_num;
	}
	public String getG1_name() {
		return g1_name;
	}
	public void setG1_name(String g1_name) {
		this.g1_name = g1_name;
	}
	public int getJumun_num() {
		return jumun_num;
	}
	public void setJumun_num(int jumun_num) {
		this.jumun_num = jumun_num;
	}
	public String getPay_created() {
		return pay_created;
	}
	public void setPay_created(String pay_created) {
		this.pay_created = pay_created;
	}
	public String getMenuct_title() {
		return menuct_title;
	}
	public void setMenuct_title(String menuct_title) {
		this.menuct_title = menuct_title;
	}
	public String getMainmenu_title() {
		return mainmenu_title;
	}
	public void setMainmenu_title(String mainmenu_title) {
		this.mainmenu_title = mainmenu_title;
	}
	public String getSubmenu_title() {
		return submenu_title;
	}
	public void setSubmenu_title(String submenu_title) {
		this.submenu_title = submenu_title;
	}
	public int getOrders_num() {
		return orders_num;
	}
	public void setOrders_num(int orders_num) {
		this.orders_num = orders_num;
	}
	public int getPay_pay() {
		return pay_pay;
	}
	public void setPay_pay(int pay_pay) {
		this.pay_pay = pay_pay;
	}
	public int getMenuct_count() {
		return menuct_count;
	}
	public void setMenuct_count(int menuct_count) {
		this.menuct_count = menuct_count;
	}
	public int getMenuTotalPay() {
		return menuTotalPay;
	}
	public void setMenuTotalPay(int menuTotalPay) {
		this.menuTotalPay = menuTotalPay;
	}
	
}
