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
<link href="css/css2.css" rel="stylesheet" type="text/css">
</head>
<script src="js/jquery-1[1].2.1.pack.js" type="text/javascript"></script>
<script src="js/muen.js" type="text/javascript"></script>
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
          <li  class="one"><a href="shequxiangqing.jsp">关于社区</a>
            <ul>
              <li><a href="shequxiangqing.jsp">社区详情</a></li>
              <li><a href="shequrongyu.jsp">社区荣誉</a></li>
              <li><a href="shoufeibiaozhun.jsp">缴费标准</a></li>
            </ul>
          </li>
          <li  class="one"><a href="${pageContext.request.contextPath}/user.do?p=gerenxinxi">个人中心</a></li>
          <li class="one"><a href="${pageContext.request.contextPath}/hobby.do?p=findall">兴趣圈子</a>
            <ul>
              <li><a href="${pageContext.request.contextPath}/hobby.do?p=findalltocj">创建兴趣圈子</a></li>
              <li><a href="sousuoxqz.jsp">搜索兴趣圈子</a></li>
            </ul>
          </li>
          <li class="one"><a href="${pageContext.request.contextPath}/ask.do?p=liuyanzixun">留言咨询</a></li>
          <li class="one"><A style="COLOR: #fff" onclick="if (confirm('确定要退出吗？')) return true; else return false;" href="login.jsp">退出系统</A></li>
          <li class="one"><a style="COLOR: #fff;background-image: none;" href="javascript:window.close()">关闭窗口</a></li>
        </ul>
      </div>
      <div class="clear">
    </div>
    
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
        <div class="right_title"> <span style="float:left;"><strong>留言咨询</strong>On-line consultation</span>
          <div class="clear"></div>
        </div>
        <div class="zaixianfalv">
          <div style="padding-top:8px; color:#4c657e;"></div>
          <form method="post" action="${pageContext.request.contextPath}/ask.do?p=addask&uid=${user.UId}">
          <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#cbcbcb" class="biaoge">
            <tr>
              <td height="25" bgcolor="#f8f8f8"><strong>请留言：</strong></td>
            </tr>
            <tr>
              <td height="95" bgcolor="#f8f8f8" align="center">
                <textarea name="liuyantext" id="textarea2" cols="45" rows="8" class="wenben" ></textarea>
              </td>
            </tr>
          </table>
          <div>
            <div align="center" style="padding:15px 0;">
              <input name="提交" type="submit" value="咨询" style="border: solid 1px #ccc; background:#fff; margin-right:10px;">
              <input name="重置" type="reset" value="重置" style="border: solid 1px #ccc; background:#fff;">
            </div>
          </div>
         </form>
        </div>
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
