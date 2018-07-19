<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>社区服务系统</title>
<link href="css/css.css" rel="stylesheet" type="text/css">
</head>
<script src="js/muen.js" type="text/javascript"></script>
<script src="js/nav.js" type="text/javascript"></script>
<body>
<div class="juzhong">
  <div class="top">
    <div class="top_top"><span style="float:left; margin-left:14px;">欢迎访问社区生活服务系统！ 建站咨询热线: 18373337069</span><span style="float:right; margin-right:6px;">登录用户：${user.UNickname}&nbsp;&nbsp;&nbsp;今天是：${time }</span>
      <div class="clear"></div>
    </div>
    <div class="logo_bg"><img src="images/logo.jpg" style="float:left; margin:18px 0 0 25px;"><img src="images/logo_bg2.gif" width="502" height="100"  style=" float:right;">
      <div class="clear"></div>
    </div>
    <div class="muen">
      <div class="subnav">
        <ul id="nuw">
          <li class="one"><a href="${pageContext.request.contextPath}/user.do?p=log&username=${user.UName}&password=${user.UPassword}&image=${code}">&nbsp;&nbsp;&nbsp;&nbsp;首页</a></li>
          <li  class="one"><a href="user/shequxiangqing.jsp">关于社区</a>
            <ul>
              <li><a href="user/shequxiangqing.jsp">社区详情</a></li>
              <li><a href="user/shequrongyu.jsp">社区荣誉</a></li>
              <li><a href="user/shoufeibiaozhun.jsp">缴费标准</a></li>
            </ul>
          </li>
          <li  class="one"><a href="${pageContext.request.contextPath}/user.do?p=gerenxinxi">个人中心</a></li>
          <li class="one"><a href="${pageContext.request.contextPath}/hobby.do?p=findall">兴趣圈子</a>
            <ul>
              <li><a href="${pageContext.request.contextPath}/hobby.do?p=findalltocj">创建兴趣圈子</a></li>
              <li><a href="user/sousuoxqz.jsp">搜索兴趣圈子</a></li>
            </ul>
          </li>
          <li class="one"><a href="${pageContext.request.contextPath}/ask.do?p=liuyanzixun">留言咨询</a></li>
          <li class="one"><A style="COLOR: #fff" onclick="if (confirm('确定要退出吗？')) return true; else return false;" href="login.jsp">退出系统</A></li>
          <li class="one"><a style="COLOR: #fff;background-image: none;" href="javascript:window.close()">关闭窗口</a></li>
        </ul>
      </div>
      <div class="clear"></div>
    </div>
  </div>
  <div class="main_2">
    <div class="left_2">
      <ul class="nav">
        <li id="bottom_none"><a href="#"  onclick="DoMenu('ChildMenu1')">关于社区</a>
          <ul id="ChildMenu1" class="collapsed">
            <li id="border_top"><a href="shequxiangqing.jsp">社区详情</a></li>
            <li><a href="shequrongyu.jsp">社区荣誉</a></li>
            <li><a href="shoufeibiaozhun.jsp">缴费标准</a></li>
          </ul>
        </li>
        <li><a href="${pageContext.request.contextPath}/user.do?p=gerenxinxi">个人中心</a></li>
        <li id="bottom_none"><a href="#" onClick="DoMenu('ChildMenu2')">兴趣圈子</a>
          <ul id="ChildMenu2" class="collapsed">
            <li id="border_top"><a href="${pageContext.request.contextPath}/hobby.do?p=findalltocj">创建兴趣圈子</a></li>
            <li><a href="sousuoxqz.jsp">搜索兴趣圈子</a></li>
          </ul>
        </li>
        <li><a href="${pageContext.request.contextPath}/ask.do?p=liuyanzixun">留言咨询</a></li>
        <li><A onclick="if (confirm('确定要退出吗？')) return true; else return false;" href="login.jsp">退出系统</A></li>
        <li><a href="javascript:window.close()">关闭窗口</a></li>
      </ul>
      <div class="clear"></div>
    </div>
    <div class="right_2">
      <div class="right_nr">
        <div class="right_title"> <span style="float:left;"><strong>联系方式</strong></span> <span style="float:right;"> </span>
          <div class="clear"></div>
        </div>
        <div class="jieshao">
          <div class="jieshao_nr">
            <div class="jieshao_nr_left"><img src="images/touxiang.jpg"></div>
            <div class="jieshao_nr_right">
              <div class="jieshao_title"><strong style="font-size:14px; color:#4c657e;">联系人：</strong> 原思平</div>
              地址：湖南省株洲市天元区珠江南路天台小区<br>
              邮编：412007<br>
              热线：18373337069<br>
              电子邮箱：1510159299@qq.com </div>
            <div class="clear"></div>
          </div>
          
        </div>
	  <table border="0">
	      <tr height="40"><td width=100></td></tr>
	  </table>
      </div>
    </div>
    <div class="clear"></div>
  </div>
  
  <div class="bottom">
    <div class="bottom_left"> <a href="lianxi.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系我们&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> |  <a href="http://www.cnblogs.com/5211314jackrose/">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;官方博客</a>  </div>
    <div class="bottom_right">&nbsp;&nbsp;&nbsp;&nbsp;地址：湖南省株洲市天元区珠江南路&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮政编码：412007&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;版权所有人：原思平</div>
  </div>
</div>
</body>
</html>

