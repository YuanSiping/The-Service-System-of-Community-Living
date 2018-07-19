<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	    <TD background=admin/images/title_bg1.jpg>当前位置:新闻资讯管理</TD>
	    </TR>
	    <TR>
	    <TD bgColor=#b1ceef height=1></TD>
	    </TR>
	    <TR height=20>
	    
	    </TR>
	</TABLE>
<br>
<form  method="post" action="new.do?p=findby">
<table style="BORDER-COLLAPSE: collapse" height=25 cellPadding=1 width=50% align="center" border=0 bgcolor="#C1CDCD">
	<tr>
		<td align="right">新闻主题</td>
		<td align="center">
    		<input type="text" name="newtitle" size="62"/>
    	</td>
    	<td align="left"><input type="submit" value="查询"/></td>
	</tr>
</table>
</form>
<table class="hovertable" style="BORDER-COLLAPSE: collapse;text-align: center;" height=25 cellPadding=1 width=90% align=center border=1>
	<tr bgcolor=#ADD8E6>
		<th>新闻标题</th>
		<th>新闻时间</th>
		<th>操作</th>
		<th>操作</th>
	</tr>
<!-- 循环-->
	<c:forEach items="${newss}" var="n">
	
		<tr onmouseover="this.style.backgroundColor='#C1CDCD';" onmouseout="this.style.backgroundColor='#d4e3e5';">
			<td>${n.NTitle }</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${n.NTime }"/></td>
			<td><a onclick="if (confirm('确定要删除吗？')) return true; else return false;"  href="new.do?p=delbyid&id=${n.NId }">刪除</a></td>
			<td><a href="new.do?p=recom&id=${n.NId }">修改</a></td>
		</tr>

	</c:forEach>
</table>

</body>
</html>
