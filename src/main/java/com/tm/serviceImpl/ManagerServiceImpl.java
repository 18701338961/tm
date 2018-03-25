package com.tm.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tm.IDao.ManagerMapper;
import com.tm.domain.Manager;
import com.tm.service.ManagerService;

@Service("ManagerService")
public class ManagerServiceImpl implements ManagerService {
	
	@Resource
	private ManagerMapper managerDao;

	public Manager selectManagerByManagerNo(String managerNo) {
		
		return managerDao.selectByManagerNo(managerNo);
	}
	
	@Override
	public List<Manager> getManagerList() {
		return managerDao.getManagers();
	}
	
	@Override
	public int addManager(Manager manager) {
		return managerDao.insert(manager);
	}
	
	@Override
	public int updateManager(Manager manager) {
		return managerDao.updateByManagerNo(manager);
	}

	@Override
	public int deleteManagerById(String id) {
		return managerDao.deleteByPrimaryKey(id);
	}
	
	@Override
	public int deleteManagerByManagerNo(String managerNo) {
		return managerDao.deleteByManagerNo(managerNo);
	}

	@Override
	public boolean checkUniqueManagerNo(String managerNo) {
		Manager manager= managerDao.selectByManagerNo(managerNo);
		if(manager==null) {
			return false;
		}else{
			return true;
		}
	}
	
	@Override
	public List<Manager> getManagerListByNoOrName(String param){
		return managerDao.getManagersByNoOrName(param);
	}
	
	@Override
	public Manager selectManagerById(String id) {
		return managerDao.selectByPrimaryKey(id);
	}
}
