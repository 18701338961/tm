package com.tm.IDao;

import java.util.List;

import com.tm.domain.Manager;
	
public interface ManagerMapper {
	
    int deleteByPrimaryKey(String id);
    
    int deleteByManagerNo(String managerNo);

    int insert(Manager record);

    int insertSelective(Manager record);

    Manager selectByPrimaryKey(String id);
    
    List<Manager> getManagers();
    
    List<Manager> getManagersByNoOrName(String param);
    
    Manager selectByManagerNo(String managerNo);

    int updateByPrimaryKeySelective(Manager record);

    int updateByPrimaryKey(Manager record);
    
    int updateByManagerNo(Manager record);
}
