package com.sp.jumun;

public class JumunMember {
	//기본 주문 보기
	private String jumun_created, jumun_addr, jumun_tel, jumun_memo, orders_state , g1_name;
	private int jumun_num, jumun_pay, m1_num, pay_pay, orders_num, maingoods_num;
	
	//detail 디테일 부분 : 주문 상세
	private String MAINMENU_TITLE, SUBMENU_TITLE;
	private int mainmenu_num, MAINGOODS_COUNT, submenu_num, SUBGOODS_NUM;
	
	
	public int getMaingoods_num() {
		return maingoods_num;
	}
	public void setMaingoods_num(int maingoods_num) {
		this.maingoods_num = maingoods_num;
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
	public String getOrders_state() {
		return orders_state;
	}
	public void setOrders_state(String orders_state) {
		this.orders_state = orders_state;
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
	public int getJumun_pay() {
		return jumun_pay;
	}
	public void setJumun_pay(int jumun_pay) {
		this.jumun_pay = jumun_pay;
	}
	public int getM1_num() {
		return m1_num;
	}
	public void setM1_num(int m1_num) {
		this.m1_num = m1_num;
	}
	public int getPay_pay() {
		return pay_pay;
	}
	public void setPay_pay(int pay_pay) {
		this.pay_pay = pay_pay;
	}
	public int getOrders_num() {
		return orders_num;
	}
	public void setOrders_num(int orders_num) {
		this.orders_num = orders_num;
	}
	
	
	
	/*
	 * 주문 상세
	 */
	
	public String getMAINMENU_TITLE() {
		return MAINMENU_TITLE;
	}
	public void setMAINMENU_TITLE(String mAINMENU_TITLE) {
		MAINMENU_TITLE = mAINMENU_TITLE;
	}
	public String getSUBMENU_TITLE() {
		return SUBMENU_TITLE;
	}
	public void setSUBMENU_TITLE(String sUBMENU_TITLE) {
		SUBMENU_TITLE = sUBMENU_TITLE;
	}
	public int getMainmenu_num() {
		return mainmenu_num;
	}
	public void setMainmenu_num(int mainmenu_num) {
		this.mainmenu_num = mainmenu_num;
	}
	public int getMAINGOODS_COUNT() {
		return MAINGOODS_COUNT;
	}
	public void setMAINGOODS_COUNT(int mAINGOODS_COUNT) {
		MAINGOODS_COUNT = mAINGOODS_COUNT;
	}
	public int getSubmenu_num() {
		return submenu_num;
	}
	public void setSubmenu_num(int submenu_num) {
		this.submenu_num = submenu_num;
	}
	public int getSUBGOODS_NUM() {
		return SUBGOODS_NUM;
	}
	public void setSUBGOODS_NUM(int sUBGOODS_NUM) {
		SUBGOODS_NUM = sUBGOODS_NUM;
	}
	
	
}
