package com.tm.service;

import java.util.List;

import com.tm.domain.UploadFile;

public interface FileService {
	
	List<UploadFile> getFiles(int pageSize,int pageIndex,Integer fileGroup,Integer filePeople,Integer status,String managerNo,String fieldName);
	
	int addFile(UploadFile file);
	
	int update(UploadFile file);
	
	int getFileCount(int status,String managerNo,String fieldName);
	
	int delFile(List<String> ids);
	
	boolean IsExecute(String userId, List<String> list);
	
	boolean delFileResources(List<String> list,String pathPrex);
	
	UploadFile selectByFileName(String fileName);
}
