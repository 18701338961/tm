package com.tm.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.tm.domain.Manager;
import com.tm.domain.UploadFile;
import com.tm.eum.util.FileGroupEnum;
import com.tm.eum.util.FilePeopleEnum;
import com.tm.service.FileService;
import com.tm.util.CommonUtils;

@Controller
public class FileController {
	
	@Resource
	private FileService fileService;
	
	@RequestMapping("check")
	public ModelAndView checkPage(@RequestParam("type") String type,HttpServletRequest request){
		HttpSession session = request.getSession(true);
		ModelAndView modelAndView = new ModelAndView();
		if("0".equals(type)) {
			session.setAttribute("type", "0");
			modelAndView.setViewName("admin/filelist");			
		}else{
			session.setAttribute("type", type);
			modelAndView.setViewName("admin/checklist");
			modelAndView.addObject(type, type);
		}				
		return modelAndView;
	}
	
	@RequestMapping("fileList")
	public  @ResponseBody Object getFileList(HttpServletRequest request,	
			@RequestParam(required = false, defaultValue = "1") Integer page, 
			@RequestParam(required = false, defaultValue = "15") Integer rows,
			@RequestParam(required = false) Integer fileGroup,
			@RequestParam(required = false) Integer filePeople)
	   {
		Manager manager = (Manager)request.getSession(true).getAttribute("manager");
		String type=(String)request.getSession(true).getAttribute("type");
		int status =  0;
		String fieldName ="";
		String managerNo  = manager.getManagerno();
		if(StringUtils.isEmpty(type)) {
			status = 0;
			fieldName = "managerNo"; 
		}else{
			if("0".equals(type)) {
				status = Integer.parseInt(type);
				fieldName = "managerNo"; 
			}else{
				status = Integer.parseInt(type)-1;
				if("1".equals(type)) {
					fieldName = "checkPeople"; 
				}else if("2".equals(type)) {
					fieldName = "reviewPeople"; 
				}else if("3".equals(type)) {
					fieldName = "makeSurePeople"; 
				}
			}
		}
		Map<String, Object> result = new HashMap<String, Object>(2);
		List<UploadFile> uploadFiles = null;
		int total = 0;
		if("managerNo".equals(fieldName)){
			uploadFiles = fileService.getFiles(rows, (page - 1) * rows, fileGroup, filePeople,null,managerNo,null);//fieldName
			total = fileService.getFileCount(status,managerNo,null);  //
		}else{
			uploadFiles = fileService.getFiles(rows, (page - 1) * rows, fileGroup, filePeople,status,managerNo,null);//fieldName
			total = fileService.getFileCount(status,managerNo,null);  //fieldName
		}
		JSONArray jsonArray = new JSONArray();
		for (UploadFile uploadFile : uploadFiles)
		{
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("id", uploadFile.getId());
			jsonObject.put("managerNo", uploadFile.getManagerno());
			jsonObject.put("uploadTime", CommonUtils.getyyyymmddHHmmssTime(uploadFile.getUploadtime()));
			jsonObject.put("fileName", uploadFile.getFilename());
			jsonObject.put("fileGroupName", FileGroupEnum.getDescByCode(uploadFile.getFileGroup()));
			jsonObject.put("filePeopleName", FilePeopleEnum.getDescByCode(uploadFile.getFilePeople()));
			jsonObject.put("checkPeople", uploadFile.getCheckPeople());
			jsonObject.put("reviewPeople", uploadFile.getReviewPeople());
			jsonObject.put("makeSurePeople", uploadFile.getMakeSurePeople());
			jsonObject.put("status", uploadFile.getStatus());
			jsonArray.add(jsonObject);
		}
		result.put("total", total);
		result.put("rows", jsonArray);
		return result;
	  }
	
	@RequestMapping(value = "/upload")
	public @ResponseBody Map<String, String> upload(HttpServletRequest request, Integer fileGroup, Integer filePeople,String checkPeople) throws IOException
	{
		Map<String, String> result = new HashMap<String, String>();
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		if (multipartResolver.isMultipart(request)) 
		{			
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;			
			Iterator<String> iter = multiRequest.getFileNames();
			while (iter.hasNext())
			{
				MultipartFile file = multiRequest.getFile(iter.next());
				String path = request.getSession().getServletContext().getRealPath("upload");
				String fileName = file.getOriginalFilename();
				if(fileService.selectByFileName(fileName) != null) {
					result.put("result", "failed");
					result.put("errorMsg", "该文件已经上传过了，请检查以后再上传！");
					return result;
				}
				File dir = new File(path, fileName);
				if (!dir.exists()) 
				{
					dir.mkdirs();
				}				
				file.transferTo(dir);
				HttpSession session = request.getSession(true);
				Manager manager = (Manager) session.getAttribute("manager");
				UploadFile uploadFile = new UploadFile();
				uploadFile.setFilePeople(filePeople);
				uploadFile.setFileGroup(fileGroup);
				uploadFile.setId(CommonUtils.getUUID());
				uploadFile.setFilename(fileName);
				uploadFile.setManagerno(manager.getManagerno());
				uploadFile.setUploadtime(new Date());
				uploadFile.setCheckPeople(checkPeople);
				// uploadFile.setFenzu(fileName);
				fileService.addFile(uploadFile);
			}
		}		
		result.put("result", "success");
		return result;
	}
	
	@RequestMapping("/down")
	public void down(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String name = request.getParameter("name");		
		name = java.net.URLDecoder.decode(name, "UTF-8");
		String fileName = request.getSession().getServletContext().getRealPath("upload") + "/" + name;
		InputStream bis = new BufferedInputStream(new FileInputStream(new File(fileName)));
		response.addHeader("Content-Disposition","attachment;filename=" + new String(name.getBytes("gbk"), "iso-8859-1"));
		response.setContentType("multipart/form-data");
		BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
		int len = 0;
		while ((len = bis.read()) != -1)
		{
			out.write(len);
			out.flush();
		}
		out.close();
		bis.close();
	}
	
	@RequestMapping("updateFileStatus")
	public @ResponseBody Map<String,String> updateManager(@ModelAttribute UploadFile uploadFile,HttpServletRequest request){
		
		Map<String, String> result = new HashMap<String,String>();
		
		String type=(String)request.getSession(true).getAttribute("type");
		if("1".equals(type)) {
			uploadFile.setStatus(1);
		}else if("2".equals(type)) {
			uploadFile.setStatus(2);
		}else if("3".equals(type)) {
			uploadFile.setStatus(3);
		}
		int count = fileService.update(uploadFile);
		if(count>0){
			result.put("result", "success");
		}else{
			result.put("result", "failed");
		}
		return result;
	}
	
	@RequestMapping("/delFile")
	@ResponseBody
	public Map<String, Object> delFile(HttpServletRequest request, @RequestParam("ids")List<String> ids) {
		Map<String, Object> resultMap = new HashMap<>();
		if (ids == null || ids.size() == 0) {
			resultMap.put("code", 400);
			resultMap.put("msg", "请选择删除条目.");
			return resultMap;
		}
		
		HttpSession session = request.getSession(true);
		Manager manager = (Manager) session.getAttribute("manager");
		if(manager == null){
			resultMap.put("code", 400);
			resultMap.put("msg", "请重新登陆后操作.");
			return resultMap;
		}
    	if(!fileService.IsExecute(manager.getManagerno(), ids)){
    		resultMap.put("code", 400);
			resultMap.put("msg", "沒有刪除权限,请选择您上传的文件.");
			return resultMap;
    	}
    	String pathPrex = request.getSession().getServletContext().getRealPath("upload");
    	System.out.println("filePath前缀:"+pathPrex);
    	if(!fileService.delFileResources(ids, pathPrex)){
    		resultMap.put("code", 400);
			resultMap.put("msg", "操作异常,删除失败.请联系管理员.");
			return resultMap;
    	}
		
		int count = fileService.delFile(ids);
		if (count <= 0) {
			resultMap.put("code", 400);
			resultMap.put("msg", "删除失败,请重新尝试.");
		} else {
			resultMap.put("code", 0);
			resultMap.put("msg", "删除成功.");
		}
		return resultMap;
	}

}
