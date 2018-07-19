package com.action;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pojo.Account;
import com.pojo.At;
import com.pojo.Atac;
import com.pojo.AtacId;
import com.pojo.Atuser;
import com.pojo.AtuserId;
import com.pojo.User;
import com.service.AccountService;
import com.sun.xml.internal.txw2.Document;

@Controller
@RequestMapping("/acut.do")
public class AccountAction {

	@Autowired
	private AccountService accountService;

	//条形码搜索
	@RequestMapping (params="p=refer")
	public String refer(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String acid = request.getParameter("actid");
		Account account = accountService.findallbyacid(acid);
		request.setAttribute("act", account);
		Double num = 20+(int)(Math.random()*100)*2.5;
		request.setAttribute("num", num);
		
		String tiao = request.getParameter("ma");
		System.out.println(tiao);
		request.setAttribute("tiao", tiao);
		return "user/jiaofeitwo.jsp";
	}
	
	//跳转网银界面
	@RequestMapping(params="p=tojq")
	public String tojq(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String acid = request.getParameter("acid");
		Account account = accountService.findallbyacid(acid);
		String money = request.getParameter("money");
		System.out.println(money);
		request.getSession().setAttribute("act", account);
		request.getSession().setAttribute("money", money);
		return "user/jiaofei.jsp";
	}
	
	//网银界面回退填写缴费信息页面
	@RequestMapping(params="p=tojqtwo")
	public String tojqtwo(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String acid = request.getParameter("acid");
		Account account = accountService.findallbyacid(acid);
		request.setAttribute("act", account);
		return "user/jiaofeitwo.jsp";
	}
	
	//根据id找公司名
	@RequestMapping(params="p=getcompanybyid")
	public void getcompanybyid(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String acid = request.getParameter("productId");
		Account account = accountService.findallbyacid(acid);
		response.getWriter().print(account.getAccompany());
	}
	
	//根据缴费类型跳转
	@RequestMapping(params="p=jf")
	public String jf(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String acid = request.getParameter("id");
		Account account = accountService.findallbyacid(acid);
		request.setAttribute("act", account);
		//随机生成条形码
		String allChar = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKMNLOPQRSTUVWXYZ"; 
		StringBuffer sb = new StringBuffer();
		Random random = new Random();
		for(int i=0;i<20;i++){
			sb.append(allChar.charAt(random.nextInt(allChar.length())));
		}
		String tiao = sb.toString();
		request.getSession().setAttribute("tiao", tiao);
		return "user/jiaofeitwo.jsp";
	}
	
	//显示具体用户具体种类的缴费记录
	@RequestMapping(params="p=findbytype")
	public String findbytype(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String uid = request.getParameter("uid");
		String acname1 = request.getParameter("select");
		String acname=new String(acname1.getBytes("iso-8859-1"),"utf-8");
		Integer acid = accountService.findbyname(acname).get(0).getAcid();
		List<At> ats = accountService.findbyuidandacid(uid,acid);
		request.setAttribute("ats", ats);
		request.setAttribute("type", acname);
		return "user/findjiaofei.jsp";
	}
	
	//显示具体用户的缴费记录
	@RequestMapping(params="p=useract")
	public String useract(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String uid = request.getParameter("uid");
		List<At> ats = accountService.findbyuid(uid);
		request.setAttribute("ats", ats);
		return "user/jiaofeijilv.jsp";
	}
	
	//缴费
	@RequestMapping(params="p=jiaofei")
	public void jiaofei(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		User user  = (User) request.getSession().getAttribute("user");
		Integer uid = user.getUId();
		
		String money1 = request.getParameter("money");
		double money = Double.parseDouble(money1);
		
		String leibie = request.getParameter("type");
		String lb=new String(leibie.getBytes("iso-8859-1"),"utf-8");
		List<Account> account = accountService.findbyname(lb);
		Integer acid = account.get(0).getAcid();
		
		//Date date=new Date();
		//SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//String time=df.format(date);
		Timestamp time = new Timestamp((new Date().getTime()));
		
		At at = new At();
		at.setCNumber(money);
		at.setCTime(time);
		Integer cid = accountService.saveat(at);
		
		AtacId atacId = new AtacId();
		atacId.setCId(cid);
		atacId.setAcid(acid);
		Atac atac1 = new Atac();
		atac1.setId(atacId);
		accountService.saveatac(atac1);
		
		AtuserId atuserId = new AtuserId();
		atuserId.setCId(cid);
		atuserId.setUId(uid);
		Atuser atuser = new Atuser();
		atuser.setId(atuserId);
		accountService.saveatuser(atuser);
		
		response.getWriter().print("<script >alert('保存成功');location='user/fjf.jsp'</script>"); 

	}
}
