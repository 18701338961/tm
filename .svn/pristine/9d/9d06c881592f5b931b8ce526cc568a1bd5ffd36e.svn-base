package com.tm.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;

public class WholeFilter implements Filter {
	
    /**
     * Default constructor. 
     */
    public WholeFilter() {
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}
	
	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest requesth = (HttpServletRequest) request;
        HttpServletResponse responseh = (HttpServletResponse) response;
        String servletPath = requesth.getServletPath();
        System.out.println("servletPath:--->"+requesth.getContextPath()+servletPath);
        if(servletPath.endsWith(".css") || servletPath.endsWith(".xls") || servletPath.endsWith(".gif") 
        		|| servletPath.endsWith(".jpg") || servletPath.endsWith(".png") || servletPath.endsWith(".js") || servletPath.equals("/code")) {
        	chain.doFilter(request, response);
        }else{
	        if(servletPath.equals("/admin/login.jsp") || servletPath.equals("/admin/signup.jsp") || servletPath.equals("/managerLogin")|| 
	        		servletPath.equals("/addStudentByParam") || servletPath.contains("addManager")) {
	        	chain.doFilter(request, response);
	        	return;
	        }else{
	        	HttpSession session = requesth.getSession(true);
	        	if(session.getAttribute("manager") == null) {
	        		if(servletPath.contains(".jsp")){
	        			responseh.sendRedirect(requesth.getContextPath()+"/admin/login.jsp");
	        			return;
	        		}else{
	        			if("XMLHttpRequest".equals(requesth.getHeader("X-Requested-With"))){
		        			response.setCharacterEncoding("UTF-8");
		        			response.setContentType("application/json; charset=utf-8");
		        			PrintWriter writer = response.getWriter();
		        			Map<String, Object> result = new HashMap<>();
		        			result.put("code", -1);
		        			System.out.println(JSON.toJSONString(result));
		        			writer.write(JSON.toJSONString(result));
		        			writer.close();
		        			writer.flush();
		        			return;
		        		}else{
		        			PrintWriter writer = response.getWriter();
		        			writer.write("<script>window.location.href = '/admin/login.jsp'</script>");
		        			writer.close();
		        			writer.flush();
		        			return;
		        		}
	        		}
	        		
	        	} else{
	        		chain.doFilter(request, response);
	        	}
	        }
        }
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}
	
	
	public static void main(String[] args) {
		try {
			System.out.println("aa");
		} catch (Exception e) {
			throw e;
		}
	}

}
