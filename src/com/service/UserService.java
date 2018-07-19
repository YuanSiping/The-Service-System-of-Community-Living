package com.service;

import java.util.ArrayList;
import java.util.List;

import org.codehaus.groovy.ant.UberCompileTask;
import org.jruby.compiler.ir.operands.Array;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sun.security.krb5.internal.UDPClient;

import com.dao.HQLDAO;
import com.dao.UserDAO;
import com.pojo.User;

@Service
public class UserService {

	@Autowired
	private UserDAO userDAO;
	@Autowired
	private HQLDAO hqldao;

	//查询居民总数
	public Integer count(){
		String hql = "from User";
		Integer num = hqldao.findByHQL(hql).size();
		
		return num;
	}
	
	// 居民登录
	public User user(String username, String password) {
		String hql = "from User where UName=? and UPassword=?";
		List<User> list = hqldao.pageQuery(hql, 1, 1, username, password);
		if (list.size() > 0) {
			return list.get(0);
		} else
			return null;
	}

	// 查找所有居民
	public List<User> findall() {

		List<User> list = userDAO.findAll();
		return list;

	}

	// 按ID删除居民
	public void delbyid(String id) {
		// TODO Auto-generated method stub

		User user = userDAO.findById(Integer.parseInt(id));
		userDAO.delete(user);

	}

	// 保存添加的居民信息
	public void regist(User user) {
		userDAO.save(user);

	}

	//按姓名或所住栋数查询
	public List findby(String username, String userbulid) {
		
		List list = new ArrayList();

		String hql = "from User where 1=1 ";

		if (userbulid != null && userbulid.trim().length() > 0) {

			hql = hql + " and UBuild = ? ";
			list.add(Integer.parseInt(userbulid));
		}

		if (username != null && username.trim().length() > 0) {
			hql = hql + " and UName = ? ";
			list.add(username);

		}

		List<User> list2 = hqldao.findByHQL(hql, list.toArray());
		return list2 ;

	}

	//根据id找居民信息
	public User findbyid(String id) {
		User user = userDAO.findById(Integer.parseInt(id));
		return user;
	}

	//更新修改的居民信息
	public void update(User user) {
		User userinfo = userDAO.findById(user.getUId());
		
		userinfo.setUBankcard(user.getUBankcard());
		userinfo.setUBuild(user.getUBuild());
		userinfo.setUFloor(user.getUFloor());
		userinfo.setUName(user.getUName());
		userinfo.setUNickname(user.getUNickname());
		userinfo.setUNickname(user.getUNickname());
		userinfo.setUPassword(user.getUPassword());
		userinfo.setUSex(user.getUSex());
		userinfo.setUUnit(user.getUUnit());
		
		userDAO.merge(userinfo);
	}

	//根据姓名找
	public User findbyname(String un) {
		// TODO Auto-generated method stub
		List<User> u = userDAO.findByUName(un);
		if (u.size() > 0) {
			return u.get(0);
		} else
			return null;
	}

	//根据昵称找
	public User findbynickname(String nick) {
		List<User> u = userDAO.findByUNickname(nick);
		if (u.size() > 0) {
			return u.get(0);
		} else
			return null;
	}

}
