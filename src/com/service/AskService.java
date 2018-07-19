package com.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AskDAO;
import com.dao.HQLDAO;
import com.dao.UserDAO;
import com.pojo.Ask;
import com.pojo.HoaId;
import com.pojo.User;

@Service
public class AskService {
	
	@Autowired
	private AskDAO askDAO;
	@Autowired
	private HQLDAO hqldao;
	@Autowired
	private UserDAO userDAO;
	
	//找出所有
	public List<Ask> findall() {
		// TODO Auto-generated method stub
		String hql = "from Ask order by asTime desc ";
		List<Ask> as = hqldao.findByHQL(hql);
		return as;
	}

	//查找当前用户的留言
	public List<Ask> fingbyuid(String uid) {
		// TODO Auto-generated method stub
		String hql = "from Ask";
		List<Ask> asks = hqldao.findByHQL(hql);
		List<Ask> asks2 = new ArrayList<Ask>();
		for(Ask ask:asks){
			if((ask.getUser().getUId()+"").equals(uid)){
				asks2.add(ask);
			}
		}
		return asks2;
	}

	//添加留言
	public void addask(Ask ask) {
		// TODO Auto-generated method stub
		askDAO.save(ask);
	}

	//总数
	public Integer count() {
		// TODO Auto-generated method stub
		String hql = "from Ask";
		Integer num = hqldao.findByHQL(hql).size();
		return num;
	}

	//未回复总数
	public Integer countno() {
		String hql = "from Ask where RText=null";
		Integer num = hqldao.findByHQL(hql).size();
		return num;
	}

	//显示所有未回复
	public List<Ask> findnoask() {
		// TODO Auto-generated method stub
		String hql = "from Ask where RText=null order by asTime desc";
		List<Ask> asks = hqldao.findByHQL(hql);
		return asks;
	}

	//根据姓名查找
	public List<Ask> findbyname(String username) {
		// TODO Auto-generated method stub
		String hql = "from Ask";
		List<Ask> asks1 = hqldao.findByHQL(hql);
		
		List<User> users = userDAO.findByUName(username);
		User user = users.get(0);
		
		List<Ask> asks = new ArrayList<Ask>();
		for(Ask ask:asks1){
			if((ask.getUser()).equals(user)){
				asks.add(ask);
			}
		}
		return asks;
	}

	//删除
	public void deletebyid(String id) {
		// TODO Auto-generated method stub
		Ask ask = askDAO.findById(Integer.parseInt(id));
		askDAO.delete(ask);
	}

	//根据id找ask
	public Ask findbyid(String id) {
		// TODO Auto-generated method stub
		Ask ask = askDAO.findById(Integer.parseInt(id));
		return ask;
	}

	//更新
	public void update(Ask ask) {
		// TODO Auto-generated method stub
		Ask ask2 = askDAO.findById(ask.getAsId());
		ask2.setRText(ask.getRText());
		askDAO.merge(ask2);
	}

}
