package com.tm.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import  com.tm.domain.Manager;
import com.tm.service.ManagerService;
import com.tm.util.CommonUtils; 

@Controller
public class ManagerController {

	@Resource
	private ManagerService managerService;
	
	@RequestMapping("addManager")
	public ModelAndView addManager(@ModelAttribute Manager manager,HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession(true);
		manager.setId(CommonUtils.getUUID());
		manager.setPassword(CommonUtils.getMD5Pssword(manager.getPassword()));
		int count = managerService.addManager(manager);
		
		if(count>0){
			session.setAttribute("manager", manager);
			modelAndView.setViewName("redirect:admin/filelist.jsp");
		}else{
			modelAndView.addObject("message","注册失败！");
		}
		return modelAndView;
	}
	@RequestMapping("/getManagers")
	public @ResponseBody List<Manager> getManagers(){
		List<Manager> managers = managerService.getManagerList();
		return managers;
	}
}
