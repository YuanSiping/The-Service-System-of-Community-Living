package com.action;

import groovy.ui.SystemOutputInterceptor;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.SizeSequence;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pojo.New;
import com.pojo.User;
import com.service.NewService;

@Controller
@RequestMapping("/new.do")
public class NewAction {

	@Autowired
	private NewService newService;
	
	//分页查询
	@RequestMapping(params="p=see")
	public String see(HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		int page = 1;
		int size = 3;
		
		String pageSring = request.getParameter("page");
		if(pageSring!=null){
			page = Integer.parseInt(pageSring);
		}
		String sizeString = request.getParameter("size");
		if(sizeString!=null){
			size = Integer.parseInt(sizeString);
		}
		
		Map map = newService.fenye(page,size);
		request.setAttribute("newmap", map);
		return "user/zixun.jsp";
	}
	
	//根据id找
	@RequestMapping(params="p=findone")
	public String findone(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String nid = request.getParameter("nid");
		New news = newService.findone(nid);
		request.setAttribute("n", news);
		return "user/zixunxiangqing.jsp";
	}
	
	//查询所有新闻
	@RequestMapping(params="p=findallnew")
	public String findallnew(HttpServletRequest request,HttpServletResponse response) throws IOException{
		List<New> news = newService.findall();
		request.setAttribute("newss", news);
		return "admin/showallnew.jsp";
	}
	
	//按ID删除资讯
	@RequestMapping(params="p=delbyid")
	public String delbyid(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String id = request.getParameter("id");
		newService.delbyid(id);
		return "new.do?p=findallnew";
	}
	
	//修改资讯信息
	@RequestMapping(params="p=recom")
	public String recom(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String id = request.getParameter("id");
		New new1 = newService.findone(id);
		request.setAttribute("news1", new1);
		return "/admin/recomnew.jsp";
	}
	
	//更新修改的资讯信息
	@RequestMapping(params="p=recommd")
	public String recommd(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String newtitle = request.getParameter("newtitle");
		String newcontent = request.getParameter("newcontent");
		String newtime = request.getParameter("newtime");
		String nid = request.getParameter("NId");
		
		String nt=new String(newtitle.getBytes("iso-8859-1"),"utf-8");
		String nc=new String(newcontent.getBytes("iso-8859-1"),"utf-8");
		Timestamp ntime = Timestamp.valueOf(newtime);
		
		New new1 = new New();
		new1.setNId(Integer.parseInt(nid));
		new1.setNText(nc);
		new1.setNTitle(nt);
		new1.setNTime(ntime);
		
		newService.updatenew(new1);
		return "new.do?p=findallnew";
	}
	
	//添加资讯
	@RequestMapping(params="p=addnew")
	public String addnew(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String newtitle = request.getParameter("newtitle");
		String newcontent = request.getParameter("newcontent");
		String newtime = request.getParameter("newtime");
		
		String nte=new String(newtitle.getBytes("iso-8859-1"),"utf-8");
		String nct=new String(newcontent.getBytes("iso-8859-1"),"utf-8");
		Timestamp ntimes = Timestamp.valueOf(newtime);
		
		New new3 = new New();
		new3.setNText(nct);
		new3.setNTime(ntimes);
		new3.setNTitle(nte);
		
		newService.addnew(new3);
		
		return "new.do?p=findallnew";
	}
	
	//近似查询
	@RequestMapping(params="p=findby")
	public String findby(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String newtitle = request.getParameter("newtitle");
		String nt=new String(newtitle.getBytes("iso-8859-1"),"utf-8");
		
		List<New> news =newService.findby(nt);
		request.setAttribute("newss", news);
		
		return "admin/showallnew.jsp";
	}
}
