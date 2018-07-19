<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'recomnew.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<LINK href="admin/css/admins.css" type="text/css" rel="stylesheet">
  </head>
  
  <body bgcolor="#E0EEEE">
 	 <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
	    <TR height=28>
	    <TD background=admin/images/title_bg1.jpg>当前位置:修改资讯信息</TD>
	    </TR>
	    <TR>
	    <TD bgColor=#b1ceef height=1></TD>
	    </TR>
	    <TR height=20>
	  
	    </TR>
	</TABLE>
  	<br>
  	<!-- 
 	<h3 align="center">请修改资讯信息</h3>
    <hr width="96%" align="center"><br>
     -->
    <form action="new.do?p=recommd" method="post" >
    	<table border="0" cellspacing="0" cellpadding="1" align="center">
    		
    		<tr>
    			<td>新闻时间</td>
    			<td>
    			<%java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    			java.util.Date currentTime = new java.util.Date();//得到当前系统时间 
    			String str_date1 = formatter.format(currentTime); //将日期时间格式化 
				%>
    			<input type="text" name="newtime" size="30" value="<%=str_date1%>"/>&nbsp;
    			新闻标题&nbsp;&nbsp;<input type="text" name="newtitle" size="85" value="${news1.NTitle}"/>
    			</td>
    		</tr>
    		<tr><td>&nbsp;</td></tr>
    		<tr>
    			<td valign="top">新闻内容</td>
    			<td><textarea name="newcontent" rows="22" cols="130">${news1.NText}</textarea></td>
    		</tr>
    		
    	</table><br>
    	<p align="center">
    		<input type="hidden" name="NId" value="${news1.NId }" >
    		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="提交"/>
    		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重置"/>
    	</p>
    </form>
  </body>
</html>
