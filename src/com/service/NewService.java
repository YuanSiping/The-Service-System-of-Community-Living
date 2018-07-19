package com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HQLDAO;
import com.dao.NewDAO;
import com.pojo.New;

@Service
public class NewService {

	@Autowired
	private NewDAO newDAO;
	@Autowired
	private HQLDAO hqldao;
	
	//找出所有
	public List<New> findall() {
		// TODO Auto-generated method stub
		List<New> news = newDAO.findAll();
		return news;
	}
	
	//查询总数
	public Integer count(){
		String hql = "from New";
		Integer num = hqldao.findByHQL(hql).size();
		
		return num;
	}
	
	//查找前六条
	public List<New> findtopsix(){
		
		String hql = "from New order by NTime desc ";
		List list = hqldao.pageQuery(hql, 1, 6);
		return list ;

	}
	

	//根据id找
	public New findone(String nid) {
		// TODO Auto-generated method stub
		New new1 = newDAO.findById(Integer.parseInt(nid));
		return new1;
	}

	//根据id删除
	public void delbyid(String id) {
		// TODO Auto-generated method stub
		New new1 = newDAO.findById(Integer.parseInt(id));
		newDAO.delete(new1);
	}

	//更新
	public void updatenew(New new1) {
		
		New new2 = newDAO.findById(new1.getNId());
		new2.setNText(new1.getNText());
		new2.setNTime(new1.getNTime());
		new2.setNTitle(new1.getNTitle());

		newDAO.merge(new2);
	}

	//添加
	public void addnew(New new3) {
		// TODO Auto-generated method stub
		newDAO.save(new3);
	}

	//近似查询
	public List<New> findby(String nt) {
		String hql = "from New where NTitle like '%"+nt+"%' ";	
		List<New> news = hqldao.findByHQL(hql);
		return news;
	}

	/**
	 * 分页
	 * @param page
	 * @param size
	 * @return
	 */
	public Map fenye(int page, int size) {
		String sumhql = "select count(*) from New order by NTime desc";
		
		//总条数
		int sum = (int)hqldao.unique(sumhql);
		
		//总页数
		int count = sum%size==0?sum/size:sum/size+1;
		
		//越界判断
		if(page<1){
			page = 1;
		}
		if(page>count){
			page = count;
		}
		String hql = "from New order by NTime desc";
		List<New> list = hqldao.pageQuery(hql, page, size);
	
		Map map = new HashMap();
		map.put("page", page);
		map.put("size", size);
		map.put("sum", sum);
		map.put("count", count);
		map.put("list", list);
		return map;
	}

	
}
