package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AdminDAO;
import com.dao.HQLDAO;
import com.pojo.Admin;
import com.util.MD5Util;

@Service
public class AdminService {

	@Autowired
	private AdminDAO adminDAO;
	@Autowired
	private HQLDAO hqldao;
	
	/**
	 * π‹¿Ì‘±µ«¬º
	 */
	public Admin admin(String username,String password){
		String hql="from Admin where adminName=? and adminPassword=?";
		//String pwd = MD5Util.getMD5(MD5Util.getMD5(password));
		List<Admin> list=hqldao.pageQuery(hql,1,1,username,password);
		if(list.size()>0){
			return list.get(0);
		}
		else
			return null;
	}
}
