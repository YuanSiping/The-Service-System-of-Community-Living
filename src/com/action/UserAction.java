package com.action;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pojo.Ask;
import com.pojo.New;
import com.pojo.User;
import com.service.NewService;
import com.service.UserService;
import com.util.MD5Util;


@Controller
@RequestMapping("/user.do")
public class UserAction {
	
	@Autowired
	private UserService userService;
	@Autowired
	private NewService newService;
	
	// 产生验证码
	@RequestMapping(params="p=doGetImage")
	private void doGetImage(HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		String s = "abcdefghijklmnopqrstuvwxyz";
		Random random = new Random();

		char[] tempCode = new char[4];
		for (int i = 0; i < 4; i++) {
			tempCode[i] = s.charAt(random.nextInt(26));
		}

		String code = new String(tempCode);
		HttpSession session = request.getSession();
		session.setAttribute("code", code);

		// 开始画图
		// 1.画图区域
		BufferedImage bufferedImage = new BufferedImage(100, 30,
				BufferedImage.TYPE_INT_RGB);
		// 2.画笔
		Graphics graphics = bufferedImage.getGraphics();

		// 设置背景颜色
		graphics.setColor(Color.getColor("RGB", 110051));
		graphics.fillRect(0, 0, 100, 30);

		// 换颜色 开始写验证码
		graphics.setColor(Color.white);
		graphics.setFont(new Font("宋体", Font.BOLD, 30));

		// 开始写字
		graphics.drawString(tempCode[0] + "", 10, 24);
		graphics.drawString(tempCode[1] + "", 30, 29);
		graphics.drawString(tempCode[2] + "", 50, 26);
		graphics.drawString(tempCode[3] + "", 70, 28);

		// 画干扰线 两点确定一条直线
		graphics.drawLine(random.nextInt(100), random.nextInt(30), random
				.nextInt(100), random.nextInt(30));
		graphics.drawLine(random.nextInt(100), random.nextInt(30), random
				.nextInt(100), random.nextInt(30));
		graphics.drawLine(random.nextInt(100), random.nextInt(30), random
				.nextInt(100), random.nextInt(30));
		graphics.drawLine(random.nextInt(100), random.nextInt(30), random
				.nextInt(100), random.nextInt(30));
		graphics.drawLine(random.nextInt(100), random.nextInt(30), random
				.nextInt(100), random.nextInt(30));

		OutputStream out = response.getOutputStream();
		ImageIO.write(bufferedImage, "jpeg", out);
		out.close();

	}
	
	//Ajax检验注册用户的昵称是否已经存在
	@RequestMapping(params="p=checkname")
	public void checkname(HttpServletRequest request,HttpServletResponse response) throws IOException{
		//System.out.println("来了");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String username = request.getParameter("username1");
		
		String un=new String(username.getBytes("iso-8859-1"),"utf-8");
		
		User u = userService.findbyname(un);
		if (u!=null) {
			response.getWriter().print("true");
		}else{
			response.getWriter().print("false");
		}
	}
	
	//Ajax检验注册用户名是否已经存在
	@RequestMapping(params="p=checknickname")
	public void checknickname(HttpServletRequest request,HttpServletResponse response) throws IOException{
		//System.out.println("来了");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String nickname = request.getParameter("nickname");
		
		String nick=new String(nickname.getBytes("iso-8859-1"),"utf-8");
		
		User u = userService.findbynickname(nick);
		if (u!=null) {
			response.getWriter().print("true");
		}else{
			response.getWriter().print("false");
		}
	}
	
	//个人信息页面
	@RequestMapping(params="p=gerenxinxi")
	public String gerenxinxi(HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		return "user/gerenxinxi.jsp";
	}
	
	//修改基本信息
	@RequestMapping(params="p=recomxinxi")
	public String recomxinxi(HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		return "user/recomxinxi.jsp";
	}
	
	//更新修改的基本信息
	@RequestMapping(params="p=recommd1")
	public String recommd1(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String username = request.getParameter("username1");
		String nickname = request.getParameter("nickname");
		String userpwd = request.getParameter("userpwd1");
		String usersex = request.getParameter("usersex1");
		String usercard = request.getParameter("usercard1");
		String userbulid = request.getParameter("userbulid1");
		String userunit = request.getParameter("userunit1");
		String userfloor = request.getParameter("userfloor1");
		String UId = request.getParameter("uid");
		
		String us=new String(usersex.getBytes("iso-8859-1"),"utf-8");
		String un=new String(username.getBytes("iso-8859-1"),"utf-8");
		String nick = new String(nickname.getBytes("iso-8859-1"),"utf-8");
		
		User user = new User();
		user.setUId(Integer.parseInt(UId));
		user.setUNickname(nick);
		user.setUName(un);
		user.setUPassword(userpwd);
		user.setUSex(us);
		user.setUBankcard(usercard);
		user.setUBuild(Integer.parseInt(userbulid));
		user.setUUnit(Integer.parseInt(userunit));
		user.setUFloor(Integer.parseInt(userfloor));
		
		userService.update(user);
		request.getSession().setAttribute("user", user);
		
		return "user.do?p=gerenxinxi";
	}
	
	//居民登录
	@RequestMapping(params="p=log")
	public String log(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("gb2312");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String idcode = request.getParameter("image");
		String pwd = MD5Util.getMD5(MD5Util.getMD5(password));
		String un=new String(username.getBytes("iso-8859-1"),"utf-8");
		System.out.println(un);
		System.out.println(pwd);
		User log=userService.user(un, password);
		request.getSession().setAttribute("username", username);
		String imagecode = (String) request.getSession().getAttribute("code");

		if (log!=null&&(idcode+"").equals(imagecode)) {
			List<New> news = newService.findtopsix();
			request.getSession().setAttribute("news", news);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String time = sdf.format(new Date());
			request.getSession().setAttribute("user", log);
			request.getSession().setAttribute("time", time);
			response.getWriter().print("登录成功");
			return "/user/index.jsp";
		}else {
			response.getWriter().print("<script >alert('登录失败');location='user/login.jsp'</script>"); 
			
		}
		return null;
	}
	
	//查找所有居民信息
	@RequestMapping(params="p=findall")
	public String findall(HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		List<User> list = userService.findall();
		request.setAttribute("list", list);
		return "admin/showall.jsp";

	}
	
	//按ID删除居民信息
	@RequestMapping(params="p=delbyid")
	public String delbyid(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String id = request.getParameter("id");
		userService.delbyid(id);
		return "user.do?p=findall";
		
		
	}
	
	//修改居民信息
	@RequestMapping(params="p=recom")
	public String recom(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String id = request.getParameter("id");
		User user = userService.findbyid(id);
		request.setAttribute("user", user);
		return "/admin/recom.jsp";
	}
	
	//更新修改的居民信息
	@RequestMapping(params="p=recommd")
	public String recommd(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String username = request.getParameter("username");
		String nickname = request.getParameter("nickname");
		String userpwd = request.getParameter("userpwd");
		String usersex = request.getParameter("usersex");
		String usercard = request.getParameter("usercard");
		String userbulid = request.getParameter("userbulid");
		String userunit = request.getParameter("userunit");
		String userfloor = request.getParameter("userfloor");
		String UId = request.getParameter("UId");
		
		String us=new String(usersex.getBytes("iso-8859-1"),"utf-8");
		String un=new String(username.getBytes("iso-8859-1"),"utf-8");
		String nick = new String(nickname.getBytes("iso-8859-1"),"utf-8");
		
		User user = new User();
		user.setUId(Integer.parseInt(UId));
		user.setUName(un);
		user.setUNickname(nick);
		user.setUPassword(userpwd);
		user.setUSex(us);
		user.setUBankcard(usercard);
		user.setUBuild(Integer.parseInt(userbulid));
		user.setUUnit(Integer.parseInt(userunit));
		user.setUFloor(Integer.parseInt(userfloor));
		
		userService.update(user);
		return "user.do?p=findall";
	}
	
	//按条件搜索居民
	@RequestMapping(params="p=findby")
	public String findby(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String username = request.getParameter("username");
		String userbulid = request.getParameter("userbulid");
		String un=new String(username.getBytes("iso-8859-1"),"utf-8");
		List<User> list =userService.findby(un , userbulid);
		request.setAttribute("list", list);
		
		return "admin/showall.jsp";
	}
	
	//居民添加信息
	@RequestMapping(params="p=regist")
	public String regist(HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String username = request.getParameter("username");
		String nickname = request.getParameter("nickname");
		String userpwd = request.getParameter("userpwd");
		String usersex = request.getParameter("usersex");
		String usercard = request.getParameter("usercard");
		String userbulid = request.getParameter("userbulid");
		String userunit = request.getParameter("userunit");
		String userfloor = request.getParameter("userfloor");
		
		//System.out.println(userbulid);
		//System.out.println(username);
		//System.out.println(usercard);
		//System.out.println(usersex);
		//System.out.println(new String(usersex.getBytes("iso-8859-1"),"utf-8"));
		//System.out.println(new String(username.getBytes("iso-8859-1"),"utf-8"));
		String us=new String(usersex.getBytes("iso-8859-1"),"utf-8");
		String un=new String(username.getBytes("iso-8859-1"),"utf-8");
		String nick = new String(nickname.getBytes("iso-8859-1"),"utf-8");
		
		User user = new User();
		user.setUName(un);
		user.setUNickname(nick);
		String pwd = MD5Util.getMD5(MD5Util.getMD5(userpwd));
		user.setUPassword(pwd);
		user.setUSex(us);
		user.setUBankcard(usercard);
		user.setUBuild(Integer.parseInt(userbulid));
		user.setUUnit(Integer.parseInt(userunit));
		user.setUFloor(Integer.parseInt(userfloor));
	
		userService.regist(user);

		return "user.do?p=findall";
		
		
	}
	
	//居民注册信息
	@RequestMapping(params="p=register")
	public void register(HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String username = request.getParameter("username1");
		String nickname = request.getParameter("nickname");
		String userpwd = request.getParameter("userpwd1");
		String usersex = request.getParameter("usersex1");
		String usercard = request.getParameter("usercard1");
		String userbulid = request.getParameter("userbulid1");
		String userunit = request.getParameter("userunit1");
		String userfloor = request.getParameter("userfloor1");
		
		//System.out.println(userbulid);
		//System.out.println(username);
		//System.out.println(usercard);
		//System.out.println(usersex);
		//System.out.println(new String(usersex.getBytes("iso-8859-1"),"utf-8"));
		//System.out.println(new String(username.getBytes("iso-8859-1"),"utf-8"));
		String us=new String(usersex.getBytes("iso-8859-1"),"utf-8");
		String un=new String(username.getBytes("iso-8859-1"),"utf-8");
		String nick = new String(nickname.getBytes("iso-8859-1"),"utf-8");
		
		User user = new User();
		user.setUName(un);
		user.setUNickname(nick);
		//String pwd = MD5Util.getMD5(MD5Util.getMD5(userpwd));
		user.setUPassword(userpwd);
		user.setUSex(us);
		user.setUBankcard(usercard);
		user.setUBuild(Integer.parseInt(userbulid));
		user.setUUnit(Integer.parseInt(userunit));
		user.setUFloor(Integer.parseInt(userfloor));
	
		userService.regist(user);

		response.getWriter().print("<script >alert('注册成功');location='user/denglv.jsp'</script>"); 
	}

}
