<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE>社区生活服务系统管理中心</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META http-equiv=Pragma content=no-cache>
<META http-equiv=Cache-Control content=no-cache>
<META http-equiv=Expires content=-1000>
<LINK href="css/admin.css" type="text/css" rel="stylesheet">
</HEAD>
<FRAMESET border=0 frameSpacing=0 rows="60, *" frameBorder=0>
<FRAME name=header src="${pageContext.request.contextPath}/admin/header.jsp" frameBorder=0 noResize scrolling=no>
<FRAMESET cols="170, *">
<FRAME name=menu src="${pageContext.request.contextPath}/admin/menu.jsp" frameBorder=0 noResize>
<FRAME name=main src="${pageContext.request.contextPath}/admin/main.jsp" frameBorder=0 noResize scrolling=yes>
</FRAMESET>
</FRAMESET>
<noframes>
</noframes>
</HTML>
