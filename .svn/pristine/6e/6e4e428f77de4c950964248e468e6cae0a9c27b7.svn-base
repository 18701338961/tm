package com.tm.service;

import java.util.List;

import com.tm.domain.Manager;

public interface ManagerService {
	
	Manager selectManagerByManagerNo(String managerNo);
	
	Manager selectManagerById(String id);
	
	boolean checkUniqueManagerNo(String managerNo);
	
	List<Manager> getManagerList();
	
	List<Manager> getManagerListByNoOrName(String param);
	
	int addManager(Manager manager);
	
	int updateManager(Manager manager);
	
	int deleteManagerById(String id);

	int deleteManagerByManagerNo(String managerNo);
}
