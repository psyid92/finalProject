package com.sp.store.mystore;

import org.springframework.web.multipart.MultipartFile;

public class MyStore {
	private int g1_Num;
	private int menuct_Num;
	private String menuct_Title, menuct_Info;
	private int mainmenu_Num;
	private String mainmenu_Title, mainmenu_Content, mainmenu_Photo, mainmenu_Pay;
	private int submenu_Num, menuct_Enabled, mainmenu_Enabled, submenu_Enabled;
	private String submenu_Title, submenu_Pay;
	private MultipartFile upload;
	
	public int getMenuct_Enabled() {
		return menuct_Enabled;
	}

	public void setMenuct_Enabled(int menuct_Enabled) {
		this.menuct_Enabled = menuct_Enabled;
	}

	public int getSubmenu_Enabled() {
		return submenu_Enabled;
	}

	public void setSubmenu_Enabled(int submenu_Enabled) {
		this.submenu_Enabled = submenu_Enabled;
	}

	public int getMainmenu_Enabled() {
		return mainmenu_Enabled;
	}

	public void setMainmenu_Enabled(int mainmenu_Enabled) {
		this.mainmenu_Enabled = mainmenu_Enabled;
	}

	public int getG1_Num() {
		return g1_Num;
	}

	public void setG1_Num(int g1_Num) {
		this.g1_Num = g1_Num;
	}

	public int getMenuct_Num() {
		return menuct_Num;
	}

	public void setMenuct_Num(int menuct_Num) {
		this.menuct_Num = menuct_Num;
	}

	public String getMenuct_Title() {
		return menuct_Title;
	}

	public void setMenuct_Title(String menuct_Title) {
		this.menuct_Title = menuct_Title;
	}

	public String getMenuct_Info() {
		return menuct_Info;
	}

	public void setMenuct_Info(String menuct_Info) {
		this.menuct_Info = menuct_Info;
	}

	public int getMainmenu_Num() {
		return mainmenu_Num;
	}

	public void setMainmenu_Num(int mainmenu_Num) {
		this.mainmenu_Num = mainmenu_Num;
	}

	public String getMainmenu_Title() {
		return mainmenu_Title;
	}

	public void setMainmenu_Title(String mainmenu_Title) {
		this.mainmenu_Title = mainmenu_Title;
	}

	public String getMainmenu_Content() {
		return mainmenu_Content;
	}

	public void setMainmenu_Content(String mainmenu_Content) {
		this.mainmenu_Content = mainmenu_Content;
	}

	public String getMainmenu_Photo() {
		return mainmenu_Photo;
	}

	public void setMainmenu_Photo(String mainmenu_Photo) {
		this.mainmenu_Photo = mainmenu_Photo;
	}

	public String getMainmenu_Pay() {
		return mainmenu_Pay;
	}

	public void setMainmenu_Pay(String mainmenu_Pay) {
		this.mainmenu_Pay = mainmenu_Pay;
	}

	public int getSubmenu_Num() {
		return submenu_Num;
	}

	public void setSubmenu_Num(int submenu_Num) {
		this.submenu_Num = submenu_Num;
	}

	public String getSubmenu_Title() {
		return submenu_Title;
	}

	public void setSubmenu_Title(String submenu_Title) {
		this.submenu_Title = submenu_Title;
	}

	public String getSubmenu_Pay() {
		return submenu_Pay;
	}

	public void setSubmenu_Pay(String submenu_Pay) {
		this.submenu_Pay = submenu_Pay;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
}