<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<LINK href="admin/css/admins.css" type="text/css" rel="stylesheet">
	</HEAD>
<body bgcolor="#E0EEEE">
	<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
	    <TR height=28>
	    <TD background=admin/images/title_bg1.jpg>当前位置:住户信息管理</TD>
	    </TR>
	    <TR>
	    <TD bgColor=#b1ceef height=1></TD>
	    </TR>
	    <TR height=20>
	    
	    </TR>
	</TABLE>
<br>
<form  method="post" action="user.do?p=findby">
<table style="BORDER-COLLAPSE: collapse;text-align: center;" height=25 cellPadding=1 width=60% align="center" border=0 bgcolor="#C1CDCD">
	<tr>
		<td>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</td>
		<td>
    		<input type="text" name="username"/>
    	</td>
    	<td>所住栋数</td>
		<td>
    		<input type="text" name="userbulid"/>
    	</td>
    	<td><input type="submit" value="查询"/></td>
	</tr>
</table>
</form>
<table class="hovertable" style="BORDER-COLLAPSE: collapse;text-align: center;" height=25 cellPadding=1 width=90% align=center border=1>


	<tr bgcolor=#ADD8E6>
		<th>用户名</th>
		<th>昵称</th>
		<th>密码</th>
		<th>性別</th>
		<th>银行卡号</th>
		<th>所住栋数</th>
		<th>所住单元</th>
		<th>所住楼号</th>
		<th>操作</th>
		<th>操作</th>
	</tr>

	
	
<!-- 循环-->
	<c:forEach items="${list}" var="user">
	
		<tr onmouseover="this.style.backgroundColor='#C1CDCD';" onmouseout="this.style.backgroundColor='#d4e3e5';">
			<td>${user.UName }</td>
			<td>${user.UNickname}</td>
			<td>${user.UPassword }</td>
			<td>${user.USex }</td>
			<td>${user.UBankcard}</td>
			<td>${user.UBuild }</td>
			<td>${user.UUnit }</td>
			<td>${user.UFloor }</td>
			<td><a onclick="if (confirm('确定要删除吗？')) return true; else return false;"  href="user.do?p=delbyid&id=${user.UId }">刪除</a></td>
			<td><a href="user.do?p=recom&id=${user.UId }">修改</a></td>
		</tr>

	</c:forEach>

</table>


</body>
</html>






