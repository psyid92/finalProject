package com.sp.admin.event;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// 회원 이벤트 컨트롤러

@Controller("admin.adminMemberEventController")
public class AdminMemberEventController {
   @RequestMapping(value="/admin/memberevent", method=RequestMethod.GET)
   public String memberEventList(Model model) {
      
      model.addAttribute("mainMenu", "2");
      model.addAttribute("subMenu", "1");
      return ".admin4.menu3.memberevent.list";
   }
   
  
}