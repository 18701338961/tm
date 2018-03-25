package com.tm.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tm.domain.Manager;
import com.tm.service.ManagerService;
import com.tm.util.CommonUtils;

@Controller
public class LoginController {
	
	@Resource
	private ManagerService managerService;
	
	@RequestMapping("managerLogin")
	public ModelAndView managerLogin(HttpServletRequest req) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		String managerNo = req.getParameter("username");
		String password = req.getParameter("Password");
		
		HttpSession session = req.getSession(true);
		
		Manager manager = managerService.selectManagerByManagerNo(managerNo);
		
		if(manager == null){
			modelAndView.setViewName("admin/login");
			modelAndView.addObject("message","用户不存在！");
			return modelAndView;
		}
		
		if(!CommonUtils.getMD5Pssword(password).equals(manager.getPassword())) {
			modelAndView.setViewName("admin/login");
			modelAndView.addObject("message","密码或者用户名错误！");
		}else {
			session.setAttribute("manager", manager);
			
			modelAndView.setViewName("redirect:admin/filelist.jsp");
			
		}
		return modelAndView;
	}
	
	@RequestMapping("managerLogout")
	public ModelAndView adminLogout(HttpServletRequest req){
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = req.getSession(true);
		session.setAttribute("manager", null);
		modelAndView.setViewName("admin/login");
		return modelAndView;
	}
	
}
	