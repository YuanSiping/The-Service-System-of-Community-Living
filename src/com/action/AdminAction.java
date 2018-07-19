package com.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pojo.Admin;
import com.service.AdminService;
import com.service.AskService;
import com.service.HobbyService;
import com.service.NewService;
import com.service.UserService;

@Controller
@RequestMapping("/admin.do")
public class AdminAction {
	
	@Autowired
	private AdminService adminloginService;
	@Autowired
	private NewService newService;
	@Autowired
	private HobbyService hobbyService;
	@Autowired
	private UserService userService;
	@Autowired
	private AskService askService;
	
	//管理员登录
	@RequestMapping(params="p=login")
	public String login(HttpServletRequest request,HttpServletResponse response) throws IOException{		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		String username = request.getParameter("username");
		String un=new String(username.getBytes("iso-8859-1"),"utf-8");
		String password = request.getParameter("password");
		Admin login= adminloginService.admin(un,password);
		if (login!=null) {
			Integer newsnum = newService.count();
			Integer hoactnum = hobbyService.count();
			Integer xqznum = hobbyService.countxqz();
			Integer usernum = userService.count();
			Integer asknum = askService.count();
			Integer asknonum = askService.countno();
			request.getSession().setAttribute("newsnum", newsnum);
			request.getSession().setAttribute("hoactnum", hoactnum);
			request.getSession().setAttribute("xqznum", xqznum);
			request.getSession().setAttribute("usernum", usernum);
			request.getSession().setAttribute("asknum", asknum);
			request.getSession().setAttribute("asknonum", asknonum);
			
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time = sdf.format(new Date());
			request.getSession().setAttribute("admin", login);
			request.getSession().setAttribute("time", time);
			response.getWriter().print("登录成功");
			return "/admin/index.jsp";
		}else {
			response.getWriter().print("<script >alert('登录失败');location='admin/login.jsp'</script>"); 
		}
		return null;
	}

}
