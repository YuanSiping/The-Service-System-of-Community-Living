package com.action;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.UserDAO;
import com.pojo.Ask;
import com.pojo.User;
import com.service.AskService;
import com.service.UserService;

@Controller
@RequestMapping("/ask.do")
public class AskAction {
	
	@Autowired
	private AskService askService;
	@Autowired
	private UserService userService;

	//编辑回复
	@RequestMapping(params="p=replyagain")
	public String replyagain(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String id = request.getParameter("id");
		Ask ask = askService.findbyid(id);
		request.setAttribute("ask", ask);
		return "admin/wirteagain.jsp";
	}
	
	//回复提交
	@RequestMapping(params="p=replyto")
	public String replyto(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String id = request.getParameter("askid");
		String reply = request.getParameter("replytext");
		String time = request.getParameter("time");
		String text = request.getParameter("text");
		String uid = request.getParameter("userid");
		
		String replytext =new String(reply.getBytes("iso-8859-1"),"utf-8");
		String asktext = new String(text.getBytes("iso-8859-1"),"utf-8");
		User user = userService.findbyid(uid);
		Timestamp asktime = Timestamp.valueOf(time);
		
		Ask ask = new Ask();
		ask.setAsId(Integer.parseInt(id));
		ask.setRText(replytext);
		ask.setAsText(asktext);
		ask.setUser(user);
		ask.setAsTime(asktime);
		
		System.out.println(replytext);
		
		askService.update(ask);
		
		return "ask.do?p=findallliuyan";
	}
	
	//回复
	@RequestMapping(params="p=reply")
	public String reply(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String id = request.getParameter("id");
		Ask ask = askService.findbyid(id);
		request.setAttribute("ask", ask);
		return "admin/wirteback.jsp";
	}
	
	//删除
	@RequestMapping(params="p=delbyid")
	public String delbyid(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String id = request.getParameter("id");
		askService.deletebyid(id);
		return "ask.do?p=findallliuyan";
	}
	
	//根据姓名找留言
	@RequestMapping(params="p=findby")
	public String findby(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String username1 = request.getParameter("username");
		String username =new String(username1.getBytes("iso-8859-1"),"utf-8");
		List<Ask> asks = askService.findbyname(username);
		request.setAttribute("list", asks);
		return "admin/showallask.jsp";
	}
	
	//留言咨询页面
	@RequestMapping(params="p=liuyanzixun")
	public String liuyanzixun(HttpServletRequest request,HttpServletResponse response) throws IOException{
		List<Ask> asks = askService.findall();
		request.setAttribute("asks", asks);
		return "user/liuyanzixun.jsp";
	}
	
	//我的留言
	@RequestMapping(params="p=myliuyan")
	public String myliuyan(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String uid = request.getParameter("useruid");
		List<Ask> asks = askService.fingbyuid(uid);
		request.setAttribute("asks", asks);
		return "user/liuyanzixun.jsp";
	}
	
	//添加留言
	@RequestMapping(params="p=addask")
	public String addask(HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String uid = request.getParameter("uid");
		User user = userService.findbyid(uid);
		Timestamp time = new Timestamp((new Date().getTime()));
		String asktext = request.getParameter("liuyantext");
		
		String text =new String(asktext.getBytes("iso-8859-1"),"utf-8");
		
		Ask ask = new Ask();
		ask.setAsText(text);
		ask.setAsTime(time);
		ask.setUser(user);
		
		askService.addask(ask);
		
		return "ask.do?p=liuyanzixun";
	}
	
	//显示所有
	@RequestMapping(params="p=findallliuyan")
	public String findallliuyan(HttpServletRequest request,HttpServletResponse response) throws IOException{
		List<Ask> asks = askService.findall();
		request.setAttribute("list", asks);
		return "admin/showallask.jsp";
	}
	
	//显示为回复的
	@RequestMapping(params="p=replyliuyan")
	public String replyliuyan(HttpServletRequest request,HttpServletResponse response) throws IOException{
		List<Ask> asks = askService.findnoask();
		request.setAttribute("list", asks);
		return "admin/replyliuyan.jsp";
	}
}
