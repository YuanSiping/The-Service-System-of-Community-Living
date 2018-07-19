package com.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AccountDAO;
import com.dao.AtDAO;
import com.dao.AtacDAO;
import com.dao.AtuserDAO;
import com.dao.HQLDAO;
import com.pojo.Account;
import com.pojo.At;
import com.pojo.Atac;
import com.pojo.AtacId;
import com.pojo.Atuser;
import com.pojo.AtuserId;
import com.pojo.Hoa;

@Service
public class AccountService {

	@Autowired
	private AccountDAO accountDAO;
	@Autowired
	private AtDAO atDAO;
	@Autowired
	private AtuserDAO atuserDAO;
	@Autowired
	private AtacDAO atacDAO;
	@Autowired
	private HQLDAO hqldao;
	
	
	//根据名字找
	public List<Account> findbyname(String lb) {
		List<Account> acot = accountDAO.findByAcname(lb);
		return acot;
	}

	//生成缴费记录
	public Integer saveat(At at) {
		atDAO.save(at);
		Integer cid = at.getCId();
		return cid;
	}

	//生成缴费类别关系
	public void saveatac(Atac atac1) {
		// TODO Auto-generated method stub
		atacDAO.save(atac1);
	}

	//生成缴费居民关系
	public void saveatuser(Atuser atuser) {
		// TODO Auto-generated method stub
		atuserDAO.save(atuser);
	}

	//根据uid找缴费记录
	public List<At> findbyuid(String uid) {
		// TODO Auto-generated method stub
		String hql = "from Atuser";
		List<Atuser> atusers = hqldao.findByHQL(hql);
		List<AtuserId> atuserIds = new ArrayList<AtuserId>();
		for(Atuser atuser : atusers){
			AtuserId atuserId = atuser.getId();
			if((atuserId.getUId()+"").equals(uid)){
				atuserIds.add(atuserId);
			}
		}
		List<At> ats = new ArrayList<At>();
		for(AtuserId atuserId : atuserIds){
			At at = atDAO.findById(atuserId.getCId());
			ats.add(at);
		}
		return ats;
	}

	//根据具体用户具体种类找缴费记录
	public List<At> findbyuidandacid(String uid, Integer acid) {
		// TODO Auto-generated method stub
		String hql = "from Atuser";
		List<Atuser> atusers = hqldao.findByHQL(hql);
		List<AtuserId> atuserIds = new ArrayList<AtuserId>();
		for(Atuser atuser : atusers){
			AtuserId atuserId = atuser.getId();
			if((atuserId.getUId()+"").equals(uid)){
				atuserIds.add(atuserId);
			}
		}
		
		List<At> ats = new ArrayList<At>();
		for(AtuserId atuserId : atuserIds){
			At at = atDAO.findById(atuserId.getCId());
			ats.add(at);
		}
		
		String hql1 = "from Atac";
		List<Atac> Atac = hqldao.findByHQL(hql1);
		List<AtacId> atacIds = new ArrayList<AtacId>();
		for(Atac atac2: Atac){
			AtacId atacId = atac2.getId();
			if((atacId.getAcid()).equals(acid)){
				atacIds.add(atacId);
			}
		}
		
		List<At> ats2 = new ArrayList<At>();
		for(AtacId atacId :atacIds){
			for(At at:ats){
				if(at.getCId().equals(atacId.getCId())){
					ats2.add(at);
				}
			}
		}
		
		return ats2;
	}

	//根据acid找种类名字
	public String findbyacid(String acid) {
		// TODO Auto-generated method stub
		Account account = accountDAO.findById(Integer.parseInt(acid));
		return account.getAcname();
	}

	//根据acid找
	public Account findallbyacid(String acid) {
		// TODO Auto-generated method stub
		Account account = accountDAO.findById(Integer.parseInt(acid));
		return account;
	}

}
