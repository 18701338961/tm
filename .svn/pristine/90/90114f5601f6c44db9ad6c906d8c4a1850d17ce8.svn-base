package com.tm.IDao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tm.domain.UploadFile;

public interface FileMapper {
    int deleteByPrimaryKey(String id);

    int insert(UploadFile record);

    UploadFile selectByPrimaryKey(String id);
    
    UploadFile selectByFileName(String fileName);

    int updateByPrimaryKeySelective(UploadFile record);

    int updateByPrimaryKey(UploadFile record);
    
    List<UploadFile> getFiles(@Param("pageIndex")int pageIndex,@Param("pageSize")int pageSize,@Param("fileGroup")Integer fileGroup,@Param("filePeople")Integer filePeople,@Param("status")Integer status,@Param("managerNo")String managerNo,@Param("fieldName")String fieldName);
    
    int getFileCount(@Param("status")int status,@Param("managerNo")String managerNo,@Param("fieldName")String fieldName);
    
    int deleteFile(@Param("ids")List<String> ids);
    }