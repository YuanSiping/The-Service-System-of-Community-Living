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
	    <TD background=admin/images/title_bg1.jpg>当前位置:修改回复内容</TD>
	    </TR>
	    <TR>
	    <TD bgColor=#b1ceef height=1></TD>
	    </TR>
	    <TR height=20>
	    
	    </TR>
	</TABLE>
  	<br>
  	<!--
 	<h3 align="center">请修改回复内容</h3>
    <hr width="70%" align="center"/><br>
    -->
    <form action="ask.do?p=replyto&askid=${ask.asId }&time=${ask.asTime}&userid=${ask.user.UId }&text=${ask.asText }<" method="post" >
    	<table class="hovertable" style="BORDER-COLLAPSE: collapse;text-align: center;" border="0" cellspacing="0" cellpadding="1" align="center">
    		<tr>
    			<td bgcolor=#ADD8E6>咨询时间:</td>
    			<td bgcolor=#ADD8E6 align="left" bgcolor="white"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${ask.asTime}"/></td>
    		</tr>
    	
    		<tr>
    			<td bgcolor=#ADD8E6>咨&nbsp;询&nbsp;者:</td>
    			<td bgcolor=#ADD8E6 align="left" bgcolor="white"><font >${ask.user.UName }</font></td>
    		</tr>
    	
    		<tr>
    			<td bgcolor=#ADD8E6 valign="top">咨询内容:</td>
    			<!--<td><textarea name="content" rows="12" cols="90"></textarea></td>  -->
    			<td bgcolor=#ADD8E6 align="left" bgcolor="white" width=80><font >${ask.asText }</font></td>
    		</tr>
    		<tr>
    			<td valign="top"><font style="font-weight:bold">请&nbsp;编&nbsp;辑：</font></td>
    			<td><textarea name="replytext" rows="5" cols="90">${ask.RText}</textarea></td>
    		</tr>
    		
    	</table><br>
    	<p align="center">
    		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="提交"/>
    		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重置"/>
    	</p>
    </form>
  </body>
</html>

