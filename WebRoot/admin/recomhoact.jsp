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
	    <TD background=admin/images/title_bg1.jpg>当前位置:修改活动信息</TD>
	    </TR>
	    <TR>
	    <TD bgColor=#b1ceef height=1></TD>
	    </TR>
	    <TR height=20>
	    
	    </TR>
	</TABLE>
  	<br>
  	<!--  
 	<h3 align="center">请修改活动信息</h3>
    <hr width="68%" align="center"/><br>
    -->
    <form action="hobby.do?p=updateact" method="post" >
    	<table border="0" cellspacing="0" cellpadding="1" align="center">
    		<tr>
    			<td>活&nbsp;&nbsp;动&nbsp;&nbsp;名</td>
    			<td>
    			<input type="text" name="acname" size="53" value="${hoact.AName} "/>&nbsp;&nbsp;活动时间
    			<input type="text" name="actime" value="${hoact.ATime}" size="22"/>
    			</td>
    		</tr>
    		<tr><td>&nbsp;</td></tr>
    		<tr>
    			<td>活动地点</td>
    			<td>
    			<input type="text" name="acadress" size="53.5" value="${hoact.AAdress}"/>&nbsp;&nbsp;活动标签
    			  <select name="bq" size="1">
		            <option value="${hname}" selected="selected">--默认为“ ${hname}” 兴趣组-- </option>
		            	<c:forEach items="${xqzs}" var="x">
							<option value="${x.HName }">${x.HName }</option>
						</c:forEach>
		          </select>
    			</td>
    		</tr>
    		<tr><td>&nbsp;</td></tr>
    		<tr>
    			<td valign="top">活动内容</td>
    			<td><textarea name="content" rows="12" cols="90">${hoact.AComent}</textarea></td>
    		</tr>
    		<tr><td>&nbsp;</td></tr>
    		<tr>
    			<td valign="top">活动备注</td>
    			<td><textarea name="spec" rows="5" cols="90">${hoact.ASpec}</textarea></td>
    		</tr>
    		
    	</table><br>
    	<p align="center">
    		<input type="hidden" name="AId" value="${hoact.AId }" >
    		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="提交"/>
    		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重置"/>
    	</p>
    </form>
  </body>
</html>
