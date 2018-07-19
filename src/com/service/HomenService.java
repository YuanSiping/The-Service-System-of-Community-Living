package com.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HQLDAO;
import com.dao.HomemDAO;
import com.dao.UserDAO;
import com.pojo.Homem;
import com.pojo.HomemId;
import com.pojo.User;

@Service
public class HomenService {
	
	
	@Autowired
	private HQLDAO hqldao ;
	@Autowired
	private UserDAO userDAO ;
	@Autowired
	private HomemDAO homemDAO;
	
	//得到所有的用户
	public List<User> findalluser(String hid){
		
		String hql = "from Homem ";
		List<Homem> homems = hqldao.findByHQL(hql);
		System.out.println(homems.size());
		List<HomemId> homemIds = new ArrayList<HomemId>();
		for (Homem homem : homems) {
			HomemId homemId = homem.getId();
			System.out.println(homemId.getHId());
			System.out.println(hid);
			if((homemId.getHId()+"").equals(hid)){
				
				homemIds.add(homemId);
			}
			
		}
		List<User> users = new ArrayList<User>();
		for (HomemId homemId : homemIds) {
			User user = userDAO.findById( homemId.getUId()) ;
			users.add(user);
		}	
		return users ;	
	}

	//添加
	public void add(Homem homem) {
		// TODO Auto-generated method stub
		homemDAO.save(homem);
	}

	//删除
	public void delete(Homem homem) {
		// TODO Auto-generated method stub
		homemDAO.delete(homem);
	}


}
