<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<LINK href="css/admin.css" type="text/css" rel="stylesheet">
	</HEAD>
 <BODY>
	<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
	    <TR height=28>
	    <TD background=images/title_bg1.jpg>当前位置:管理中心首页</TD>
	    </TR>
	    <TR>
	    <TD bgColor=#b1ceef height=1></TD>
	    </TR>
	    <TR height=20>
	    <TD background=images/shadow_bg.jpg></TD>
	    </TR>
	</TABLE>
    
	<TABLE cellSpacing=0 cellPadding=0 width="90%" align=center border=0>
  		<TR height=100>
   		<TD align="center" width=100><IMG height=100 src="images/admin_p.gif" width=90></TD>
    	<TD width=60>&nbsp;</TD>
    	<TD>
	      	<TABLE height=100 cellSpacing=0 cellPadding=0 width="100%" border=0>     
	        <TR>
	          <TD>登录时间：${time }</TD></TR>
	        <TR>
	          <TD style="FONT-WEIGHT: bold; FONT-SIZE: 16px">${admin.adminName}</TD></TR>
	        <TR>
	          <TD>欢迎进入社区生活服务系统管理中心！</TD></TR>
	        </TABLE>
        </TD></TR>
  		<TR>
    	<TD colSpan=3 height=10></TD></TR>
    </TABLE>
    
	<TABLE cellSpacing=0 cellPadding=0 width="95%" align=center border=0>
	  <TR height=20>
	    <TD></TD></TR>
	  <TR height=22>
	    <TD style="PADDING-LEFT: 20px; FONT-WEIGHT: bold; COLOR: #ffffff" 
	    align="center" background=images/title_bg2.jpg>社区生活服务系统管理中心</TD></TR>
	  <TR bgColor=#ecf4fc height=12>
	    <TD></TD></TR>
	  <TR height=20>
	    <TD></TD></TR>
	 </TABLE>
    
	 <TABLE cellSpacing=0 cellPadding=2 width="95%" align="center" border=0>
	   <tr>
	    <TD align="right" width=100>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;社&nbsp;&nbsp;区&nbsp;&nbsp;名&nbsp;&nbsp;称：</TD>
	    <TD style="COLOR: #880000">湖南省株洲市天元区天台小区2期社区</TD>
	   </tr>
	   <tr>
	    <TD align="right" width=100>注册居民总数：</TD>
	    <TD style="COLOR: #880000">总共有 ${usernum } 人</TD>
	   </tr>
	   <tr>
	    <TD align="right" width=100>兴趣圈子总数：</TD>
	    <TD style="COLOR: #880000">总共有 ${xqznum } 个</TD>
	   </tr>
	   <tr>
	    <TD align="right" width=100>兴趣活动总数：</TD>
	    <TD style="COLOR: #880000">总共有 ${hoactnum } 个</TD>
	   </tr>
	   
	   <tr>
	    <TD align="right" width=100>留言咨询总数：</TD>
	    <TD style="COLOR: #880000">总共有 ${asknum } 条(其中未回复留言共 ${asknonum } 条)</TD>
	   </tr>
	   
	   <tr>
	    <TD align="right" width=100>社区资讯总数：</TD>
	    <TD style="COLOR: #880000">总共有 ${newsnum } 条</TD>
	   </tr>
	  </TABLE>
 </BODY>
</HTML>