package com.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HQLDAO;
import com.dao.HoaDAO;
import com.dao.HoactDAO;
import com.dao.HobbyDAO;
import com.dao.HomemDAO;
import com.pojo.Hoa;
import com.pojo.HoaId;
import com.pojo.Hoact;
import com.pojo.Hobby;
import com.pojo.Homem;
import com.pojo.HomemId;
import com.pojo.User;

@Service
public class HobbyService {

	@Autowired
	private HobbyDAO hobbyDAO;
	@Autowired
	private HoactDAO hoactDAO;
	@Autowired
	private HoaDAO hoaDAO;
	@Autowired
	private HomemDAO homemDAO;
	@Autowired
	private HQLDAO hqldao;
	
	
	//查询活动总数
	public Integer count(){
		String hql = "from Hoact";
		Integer num = hqldao.findByHQL(hql).size();
		
		return num;
	}
	//查询兴趣组总数
	public Integer countxqz(){
		String hql = "from Hobby";
		Integer num = hqldao.findByHQL(hql).size();
		
		return num;
	}
	
	//找出所有兴趣组
	public List<Hobby> findall() {
		// TODO Auto-generated method stub
		List<Hobby> list=hobbyDAO.findAll();
		return list;
	}

	//根据兴趣组名找
	public List<Hobby> findbyname(String xqzname) {
		// TODO Auto-generated method stub
		List<Hobby> list=hobbyDAO.findByHName(xqzname);
		return list;
	}

	//添加兴趣组
	public void addxqz(Hobby hobby) {
		// TODO Auto-generated method stub
		hobbyDAO.save(hobby);
	}

	//得到所有兴趣组的活动
	public List<Hoact> findallac(String hid) {
		String hql = "from Hoa";
		List<Hoa> hoas = hqldao.findByHQL(hql);
		List<HoaId> hoaIds = new ArrayList<HoaId>();
		for(Hoa hoa: hoas){
			HoaId hoaId = hoa.getId();
			if((hoaId.getHId()+"").equals(hid)){
				hoaIds.add(hoaId);
			}
		}
		List<Hoact> hoacts = new ArrayList<Hoact>();
		for(HoaId hoaId: hoaIds){
			Hoact hoact = hoactDAO.findById(hoaId.getAId());
			hoacts.add(hoact);
		}
		return hoacts;
	}
	
	//根据aid找hid
	public Integer findhidbyaid(String id) {
		String hql = "from Hoa";
		List<Hoa> hoas = hqldao.findByHQL(hql);
		for(Hoa hoa: hoas){
			HoaId hoaId = hoa.getId();
			if((hoaId.getAId()+"").equals(id)){
				return hoaId.getHId();
			}
		}
		return null;
	}
	
	//找到所有活动
	public List<Hoact> findallact() {
		List<Hoact> hoacts = hoactDAO.findAll();
		return hoacts;
	}
	
	//根据活动表id找活动
	public Hoact findbyaid(String id) {
		// TODO Auto-generated method stub
		Hoact hoact = hoactDAO.findById(Integer.parseInt(id));
		return hoact;
	}
	
	//根据hid找hobby
	public Hobby findbyhid(Integer hid) {
		// TODO Auto-generated method stub
		Hobby hobby = hobbyDAO.findById(hid);
		return hobby;
	}
	
	//保存活动返回aid
	public Integer addact(Hoact hoact) {
		// TODO Auto-generated method stub
		hoactDAO.save(hoact);
		return hoact.getAId();
	}
	
	//保持hoa
	public void addhoa(Hoa hoa) {
		// TODO Auto-generated method stub
		hoaDAO.save(hoa);
	}
	
	//删除hoact活动
	public void delhoactbyid(String id) {
		// TODO Auto-generated method stub
		Hoact hoact = hoactDAO.findById(Integer.parseInt(id));
		hoactDAO.delete(hoact);
	}
	
	//根据aid找hoa
	public Hoa findhoabyaid(String id) {
		// TODO Auto-generated method stub
		String hql = "from Hoa";
		List<Hoa> hoas = hqldao.findByHQL(hql);
		for(Hoa hoa: hoas){
			HoaId hoaId = hoa.getId();
			if((hoaId.getAId()+"").equals(id)){
				return hoa;
			}
		}
		return null;
	}
	
	//删除hoa
	public void delhoa(Hoa hoa) {
		// TODO Auto-generated method stub
		hoaDAO.delete(hoa);
	}
	
	//更新活动
	public void update(Hoact hoact) {
		// TODO Auto-generated method stub
		Hoact hoact2 = hoactDAO.findById(hoact.getAId());
		
		hoact2.setAAdress(hoact.getAAdress());
		hoact2.setAComent(hoact.getAComent());
		hoact2.setAName(hoact.getAName());
		hoact2.setASpec(hoact.getASpec());
		hoact2.setATime(hoact.getATime());
		
		hoactDAO.merge(hoact2);
	}
	
	//找活动
	public String findtop() {
		// TODO Auto-generated method stub
		Timestamp time = new Timestamp((new Date().getTime()));
		String hql="from Hoact where ATime> ? order by ATime asc";
		List<Hoact> hoacts = hqldao.pageQuery(hql, 1, 7, time);
		Integer len = hoacts.size();
		
		//json
		
		StringBuffer sb = new StringBuffer("[");
		
		Integer i = 1;
		for (Hoact hoact : hoacts) {
			if(i<len){
				sb.append("{'AName':'").append(hoact.getAName()).append("','ATime':'").append(new Date(hoact.getATime().getTime())).append("'},");
				i++;
			}else{
				sb.append("{'AName':'").append(hoact.getAName()).append("','ATime':'").append(new Date(hoact.getATime().getTime())).append("'}");
			}
		}
		sb.append("]");
		
		return sb.toString();
	}
	
	//根据uid找兴趣组
	public List<Hobby> findxqzbyuid(String uid) {
		String hql = "from Homem ";
		List<Homem> homems = hqldao.findByHQL(hql);
		List<HomemId> homemIds = new ArrayList<HomemId>();
		for (Homem homem : homems) {
			HomemId homemId = homem.getId();
			if((homemId.getUId()+"").equals(uid)){
				
				homemIds.add(homemId);
			}			
		}
		List<Hobby> hobbies = new ArrayList<Hobby>();
		for (HomemId homemId : homemIds) {
			Hobby hobby = hobbyDAO.findById(homemId.getHId());
			hobbies.add(hobby);
		}	
		
		return hobbies;
	}
	
	//根据活动名找活动
	public Hoact findhoactbyname(String aname) {
		// TODO Auto-generated method stub
		System.out.println(aname);
		List<Hoact> hoacts = hoactDAO.findByAName(aname);
		return hoacts.get(0);
	}
	

}
