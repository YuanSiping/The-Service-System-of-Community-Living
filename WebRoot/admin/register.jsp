<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>社区生活服务系统管理中心</title>
    
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
	    <TD background=admin/images/title_bg1.jpg>当前位置:填写居民信息</TD>
	    </TR>
	    <TR>
	    <TD bgColor=#b1ceef height=1></TD>
	    </TR>
	    <TR height=20>
	    
	    </TR>
	</TABLE>
  	<br>
  	<!-- 
 	<h3 align="center">请填写居民信息</h3>   
    <hr width="219" align="center"/>
     -->
    <form action="user.do?p=regist" method="post" >
    	<table class="hovertable" style="BORDER-COLLAPSE: collapse;text-align: center;" border="1" cellspacing="0" cellpadding="1" align="center">
    		<tr>
    			<td bgcolor="#ADD8E6">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</td>
    			<td>
    			<input type="text" name="username"/>
    			</td>
    		</tr>
    		<tr>
    			<td bgcolor="#ADD8E6">昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称</td>
    			<td>
    			<input type="text" name="nickname"/>
    			</td>
    		</tr>
    		<tr>
    			<td bgcolor="#ADD8E6">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</td>
    			<td>
    			<input type="password" name="userpwd" size="20"/>
    			</td>
    		</tr>
    		<tr>
    			<td bgcolor="#ADD8E6">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</td>
    			<td>
	    			<input type="radio" name="usersex" value="男" checked="checked"/>男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    			<input type="radio" name="usersex" value="女"/>女
    			</td>
    		</tr>
    		<tr>
    			<td bgcolor="#ADD8E6">银行卡号</td>
    			<td>
    			<input type="text" name="usercard"/>
    			</td>
    		</tr>
    		<tr>
    			<td bgcolor="#ADD8E6">所住栋数</td>
    			<td>
    			<input type="text" name="userbulid"/>
    			</td>
    		</tr>
    		<tr>
    			<td bgcolor="#ADD8E6">所住单元</td>
    			<td>
    			<input type="text" name="userunit"/>
    			</td>
    		</tr>
    		<tr>
    			<td bgcolor="#ADD8E6">所住楼层</td>
    			<td>
    			<input type="text" name="userfloor"/>
    			</td>
    		</tr>
    	</table><br>
    	<p align="center">
    		 <input type="submit" value="添加"/>
    		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重置"/>
    	</p>
    </form>
  </body>
</html>
