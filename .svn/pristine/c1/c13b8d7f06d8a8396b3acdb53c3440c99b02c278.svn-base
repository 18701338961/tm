package com.tm.serviceImpl;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tm.IDao.FileMapper;
import com.tm.domain.UploadFile;
import com.tm.service.FileService;

@Service("FileService")
public class FileServiceImpl implements FileService {

	@Resource
	private FileMapper fileDao;

	@Override
	public List<UploadFile> getFiles(int pageSize, int pageIndex,Integer fileGroup,Integer filePeople,Integer status,String managerNo,String fieldName) {
		return fileDao.getFiles(pageIndex, pageSize,fileGroup,filePeople,status,managerNo,fieldName);
	}

	@Override
	public int addFile(UploadFile file) {
		return fileDao.insert(file);
	}

	@Override
	public int getFileCount(int status,String managerNo,String fieldName) {
		return fileDao.getFileCount(status,managerNo,fieldName);
	}

	@Override
	public int delFile(List<String> ids) {
		int count = fileDao.deleteFile(ids);
		return count;
	}

	@Override
	public boolean IsExecute(String userId, List<String> list) {
		Map<String, Object> map = new HashMap<>();
		String manageNo = null;
		for(String id : list){
			UploadFile uploadFile = fileDao.selectByPrimaryKey(id);
			if(uploadFile == null){
				throw new RuntimeException("�h���ļ��e�`");
			}
			map.put(uploadFile.getManagerno(), uploadFile.getManagerno());
			manageNo = uploadFile.getManagerno();
		}
		if(map.size() > 1){
			return false;
		}
		if(!userId.equals(manageNo)){
			return false;
		}
		
		return true;
	}

	@Override
	public boolean delFileResources(List<String> list,String pathPrex) {
		String filePath;
		for (String id : list) {
			UploadFile uploadFile = fileDao.selectByPrimaryKey(id);
			filePath = pathPrex + "/" + uploadFile.getFilename();
			File file = new File(filePath);
			if(file.exists() && file.isFile()){
				if(file.delete()){
					return true;
				}else{
					return false;
				}
			}else{
				return false;
			}
		}
		return false;
	}

	@Override
	public int update(UploadFile file) {
		return fileDao.updateByPrimaryKeySelective(file);
	}

	@Override
	public UploadFile selectByFileName(String fileName) {
		return fileDao.selectByFileName(fileName);
	}

}
