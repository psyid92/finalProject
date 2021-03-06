package com.sp.store.mystoreCTR;
/*
--orders_num 3:주문완료 4:주문승인 5:취소 6:배달완료
-- menuct_title : 메뉴 최상위 카테고리
-- menu_title : mainmenu+submenu title
-- menu_count : 하나의 주문에서 동일한 메뉴 개수

*/
public class MyStoreCTR {
	private String m1_nickname;
	private int g1_num;
	private String g1_name;
	private String menuct_title, menu_title;
	private int menu_count, menu_pay;
	private int jumun_num;
	private String jumun_created, jumun_addr, jumun_tel, jumun_memo;
	private int orders_num;
	private String orders_state;
	
	public String getM1_nickname() {
		return m1_nickname;
	}
	public void setM1_nickname(String m1_nickname) {
		this.m1_nickname = m1_nickname;
	}
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
	public String getMenuct_title() {
		return menuct_title;
	}
	public void setMenuct_title(String menuct_title) {
		this.menuct_title = menuct_title;
	}
	public String getMenu_title() {
		return menu_title;
	}
	public void setMenu_title(String menu_title) {
		this.menu_title = menu_title;
	}
	public int getMenu_count() {
		return menu_count;
	}
	public void setMenu_count(int menu_count) {
		this.menu_count = menu_count;
	}
	public int getMenu_pay() {
		return menu_pay;
	}
	public void setMenu_pay(int menu_pay) {
		this.menu_pay = menu_pay;
	}
	public int getJumun_num() {
		return jumun_num;
	}
	public void setJumun_num(int jumun_num) {
		this.jumun_num = jumun_num;
	}
	public String getJumun_created() {
		return jumun_created;
	}
	public void setJumun_created(String jumun_created) {
		this.jumun_created = jumun_created;
	}
	public String getJumun_addr() {
		return jumun_addr;
	}
	public void setJumun_addr(String jumun_addr) {
		this.jumun_addr = jumun_addr;
	}
	public String getJumun_tel() {
		return jumun_tel;
	}
	public void setJumun_tel(String jumun_tel) {
		this.jumun_tel = jumun_tel;
	}
	public String getJumun_memo() {
		return jumun_memo;
	}
	public void setJumun_memo(String jumun_memo) {
		this.jumun_memo = jumun_memo;
	}
	public int getOrders_num() {
		return orders_num;
	}
	public void setOrders_num(int orders_num) {
		this.orders_num = orders_num;
	}
	public String getOrders_state() {
		return orders_state;
	}
	public void setOrders_state(String orders_state) {
		this.orders_state = orders_state;
	}
	
	
}
