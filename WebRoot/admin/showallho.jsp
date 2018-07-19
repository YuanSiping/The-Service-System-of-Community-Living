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
	    <TD background=admin/images/title_bg1.jpg>当前位置:兴趣活动管理</TD>
	    </TR>
	    <TR>
	    <TD bgColor=#b1ceef height=1></TD>
	    </TR>
	    <TR height=20>
	    
	    </TR>
	</TABLE>
<br>

<table border=0>
	<tbody>
		<tr>
			<td valign="top" width=300>
				<div>
					<form  method="post" action="${pageContext.request.contextPath}/hobby.do?p=findbyxqz">
						<table style="BORDER-COLLAPSE: collapse" height=25 cellPadding=1 width=100% align="left" border=0 bgcolor="#C1CDCD">
							<tr>
								<td align="right">兴&nbsp;&nbsp;趣&nbsp;&nbsp;组</td>
								<td align="center">
									<select name="bq" size="1">
							            <option value="#" selected="selected">--------兴趣组标签--------</option>
							            <c:forEach items="${xqzs}" var="x">
							            	<option value="${x.HId }">${x.HName }</option>
							            </c:forEach>
							        </select>
								</td>
								<td align="left"><input type="submit" value="查询"/></td>
							</tr>
						</table>
					</form>
				</div>
			</td>
			<td valign="top" width=1066> 
				<div>
					<table class="hovertable" style="BORDER-COLLAPSE: collapse;text-align: center;" height=25 cellPadding=1 width=100% align="left" border=1>
						<tr bgcolor=#ADD8E6>
							<th>活动名</th>
							<th>活动地点</th>
							<th>活动时间</th>
							<th>操作</th>
							<th>操作</th>
						</tr>
						<!-- 循环-->
							<c:forEach items="${hoacts}" var="act">
								<tr onmouseover="this.style.backgroundColor='#C1CDCD';" onmouseout="this.style.backgroundColor='#d4e3e5';">
									<td>${act.AName }</td>
									<td>${act.AAdress }</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${act.ATime }"/></td>
									<td><a onclick="if (confirm('确定要删除吗？')) return true; else return false;"  href="hobby.do?p=delbyid&id=${act.AId}">刪除</a></td>
									<td><a href="hobby.do?p=recom&id=${act.AId }">修改</a></td>
								</tr>
							</c:forEach>
					</table>
				</div>
			</td>
		</tr>
	</tbody>
</table>

</body>
</html>
