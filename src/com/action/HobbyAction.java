package com.action;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pojo.Hoa;
import com.pojo.HoaId;
import com.pojo.Hoact;
import com.pojo.Hobby;
import com.pojo.Homem;
import com.pojo.HomemId;
import com.pojo.User;
import com.service.HobbyService;
import com.service.HomenService;

@Controller
@RequestMapping("/hobby.do")
public class HobbyAction {

	@Autowired
	private HobbyService hobbyService;
	
	@Autowired
	private HomenService homenService ;
	
	//JS显示一个活动
	@RequestMapping(params="p=showone")
	public String showone(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String an = request.getParameter("name");
		String aname = new String(an.getBytes("iso-8859-1"),"utf-8");
		Hoact hoact = hobbyService.findhoactbyname(aname);
		request.setAttribute("hoact", hoact);
		return "user/showoneact.jsp";
	}
	
	//根据uid找兴趣组
	@RequestMapping(params="p=wdqz")
	public String wdqz(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String uid = request.getParameter("uid");
		List<Hobby> hobbies = hobbyService.findxqzbyuid(uid);
		request.setAttribute("list", hobbies);
		return "user/wdqz.jsp";
	}
	
	//根据user找活动
	@RequestMapping(params="p=findhoactbyuser")
	public void findhoactbyuser(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String hoacts = hobbyService.findtop();
		response.getWriter().print(hoacts);
		
	}
	
	//跳转兴趣圈子页面
	@RequestMapping(params="p=findall")
	public String findall(HttpServletRequest request,HttpServletResponse response) throws IOException{
		List<Hobby> list = hobbyService.findall();
		request.setAttribute("list", list);
		return "/user/xqqz.jsp";
	}
	
	//跳转创建页面
	@RequestMapping(params="p=findalltocj")
	public String findalltocj(HttpServletRequest request,HttpServletResponse response) throws IOException{
		List<Hobby> list = hobbyService.findall();
		request.setAttribute("list", list);
		return "/user/cjxqz.jsp";
	}
	
	//搜索按钮
	@RequestMapping(params="p=sousuo")
	public String sousuo(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String xqzname1 = request.getParameter("Input");
		String xqzname=new String(xqzname1.getBytes("iso-8859-1"),"utf-8");
		System.out.println(xqzname);
		List<Hobby> list = hobbyService.findbyname(xqzname);
		request.setAttribute("list", list);
		return "/user/ssxqz.jsp";
	}
	
	//创建兴趣组
	@RequestMapping(params="p=addxqz")
	public String addxqz(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String xqzname1 = request.getParameter("Input");
		String xqzname=new String(xqzname1.getBytes("iso-8859-1"),"utf-8");
		System.out.println(xqzname);
		Hobby hobby = new Hobby();
		hobby.setHName(xqzname);
		hobbyService.addxqz(hobby);
		return "hobby.do?p=findalltocj";
	}
	
	
	//查找兴趣组成员和活动
	@RequestMapping(params="p=findalluser")
	public String findalluser(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String hid = request.getParameter("hid");
		List<User> list = homenService.findalluser(hid);
		
		List<Hoact> list1 = hobbyService.findallac(hid);

		request.setAttribute("list", list);
		request.setAttribute("hid", hid);
		
		request.setAttribute("list1", list1);
		return "user/xqz.jsp";
		
	}
	
	//加入兴趣组
	@RequestMapping(params="p=jiaru")
	public String jiaru(HttpServletRequest request,HttpServletResponse response) throws IOException{
		User user  = (User) request.getSession().getAttribute("user");
		String hid =  (String) request.getParameter("hid");
		Integer uid = user.getUId();
		HomemId homemId = new HomemId();
		System.out.println(Integer.parseInt(hid)+"bbbbb");
		homemId.setHId(Integer.parseInt(hid));
		homemId.setUId(uid);
		Homem homem = new Homem();
		homem.setId(homemId);
		homenService.add(homem);
		return "hobby.do?p=findalluser&hid="+hid;
	}
	
	//退出兴趣组
	@RequestMapping(params="p=tuichu")
	public String tuichu(HttpServletRequest request,HttpServletResponse response) throws IOException{
		User user  = (User) request.getSession().getAttribute("user");
		String hid =  (String) request.getParameter("hid");
		Integer uid = user.getUId();
		HomemId homemId = new HomemId();
		homemId.setHId(Integer.parseInt(hid));
		homemId.setUId(uid);
		Homem homem = new Homem();
		homem.setId(homemId);
		homenService.delete(homem);
		return "hobby.do?p=findalluser&hid="+hid;
	}
	
	//添加活动找兴趣组
	@RequestMapping(params="p=addac")
	public String addac(HttpServletRequest request,HttpServletResponse response) throws IOException{
		List<Hobby> list1 = hobbyService.findall();
		request.setAttribute("xqzs", list1);
		return "admin/addac.jsp";
	}
	
	//查询所有活动
	@RequestMapping(params="p=findallho")
	public String findallho(HttpServletRequest request,HttpServletResponse response) throws IOException{
		List<Hobby> list1 = hobbyService.findall();
		request.setAttribute("xqzs", list1);
		
		List<Hoact> hoacts = hobbyService.findallact();
		request.setAttribute("hoacts", hoacts);
		
		return "admin/showallho.jsp";
	}
	
	//按兴趣组查询
	@RequestMapping(params="p=findbyxqz")
	public String findbyxqz(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String hid = request.getParameter("bq");
		
		List<Hobby> list1 = hobbyService.findall();
		request.setAttribute("xqzs", list1);
		
		List<Hoact> hoacts = hobbyService.findallac(hid);
		request.setAttribute("hoacts", hoacts);
		
		return "admin/showallho.jsp";
	}
	
	//修改活动
	@RequestMapping(params="p=recom")
	public String recom(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String id = request.getParameter("id");
		Hoact hoact = hobbyService.findbyaid(id);
		request.setAttribute("hoact", hoact);
		
		Integer hid = hobbyService.findhidbyaid(id);
		
		Hobby hobby = hobbyService.findbyhid(hid);
		String hname = hobby.getHName();
		request.setAttribute("hname", hname);
		
		List<Hobby> list1 = hobbyService.findall();
		request.setAttribute("xqzs", list1);
		
		return "admin/recomhoact.jsp";
	}
	
	//添加活动
	@RequestMapping(params="p=addact")
	public String addact(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String acname = request.getParameter("acname");
		String actime = request.getParameter("actime");
		String acadress = request.getParameter("acadress");
		String content = request.getParameter("content");
		String spec = request.getParameter("spec");
		String bq = request.getParameter("bq");
		
		String actbq = new String(bq.getBytes("iso-8859-1"),"utf-8");
		String actname = new String(acname.getBytes("iso-8859-1"),"utf-8");
		String actadress = new String(acadress.getBytes("iso-8859-1"),"utf-8");
		String actcontent = new String(content.getBytes("iso-8859-1"),"utf-8");
		String actspec = new String(spec.getBytes("iso-8859-1"),"utf-8");
		Timestamp acttime = Timestamp.valueOf(actime);

		List<Hobby> hobbies = hobbyService.findbyname(actbq);
		Integer hid = hobbies.get(0).getHId();
		
		Hoact hoact = new Hoact();
		hoact.setAName(actname);
		hoact.setAAdress(actadress);
		hoact.setATime(acttime);
		hoact.setAComent(actcontent);
		hoact.setASpec(actspec);
		Integer aid = hobbyService.addact(hoact);
		
		HoaId hoaId = new HoaId(hid, aid);
		Hoa hoa = new Hoa(hoaId);
		hobbyService.addhoa(hoa);
		
		return "hobby.do?p=findallho";
	}
	
	//删除
	@RequestMapping(params="p=delbyid")
	public String delbyid(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String id = request.getParameter("id");
		
		hobbyService.delhoactbyid(id);
		
		Hoa hoa = hobbyService.findhoabyaid(id);
		
		hobbyService.delhoa(hoa);
		
		return "hobby.do?p=findallho";
	}
	
	//更新活动
	@RequestMapping(params="p=updateact")
	public String updateact(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String acname = request.getParameter("acname");
		String actime = request.getParameter("actime");
		String acadress = request.getParameter("acadress");
		String content = request.getParameter("content");
		String spec = request.getParameter("spec");
		String bq = request.getParameter("bq");
		String AId = request.getParameter("AId");
		
		Hoa hoa = hobbyService.findhoabyaid(AId);		
		hobbyService.delhoa(hoa);
		
		String actbq = new String(bq.getBytes("iso-8859-1"),"utf-8");
		List<Hobby> hobbies = hobbyService.findbyname(actbq);
		Integer hid = hobbies.get(0).getHId();
		
		HoaId hoaId = new HoaId(hid, Integer.parseInt(AId));
		Hoa hoa1 = new Hoa(hoaId);
		hobbyService.addhoa(hoa1);
		
		String actname = new String(acname.getBytes("iso-8859-1"),"utf-8");
		String actadress = new String(acadress.getBytes("iso-8859-1"),"utf-8");
		String actcontent = new String(content.getBytes("iso-8859-1"),"utf-8");
		String actspec = new String(spec.getBytes("iso-8859-1"),"utf-8");
		Timestamp acttime = Timestamp.valueOf(actime);
		
		Hoact hoact = new Hoact();
		hoact.setAId(Integer.parseInt(AId));
		hoact.setAAdress(actadress);
		hoact.setAComent(actcontent);
		hoact.setAName(actname);
		hoact.setASpec(actspec);
		hoact.setATime(acttime);
		
		hobbyService.update(hoact);
		
		return "hobby.do?p=findallho";
	}
}
