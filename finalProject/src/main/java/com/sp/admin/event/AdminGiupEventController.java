package com.sp.admin.event;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// 판매자 이벤트 컨트롤러

@Controller("admin.adminGiupEventController")
public class AdminGiupEventController {
	 @RequestMapping(value="/admin/giupevent", method=RequestMethod.GET)
	   public String giupEventList(Model model) {
	      
	      model.addAttribute("mainMenu", "2");
	      model.addAttribute("subMenu", "2");
	      return ".admin4.menu3.giupevent.list";
	   }
}
