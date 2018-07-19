<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.w3c.dom.Document"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>社区服务系统</title>
<link href="user/css/css.css" rel="stylesheet" type="text/css">
</head>
<script src="user/js/muen.js" type="text/javascript"></script>
<script src="user/js/nav.js" type="text/javascript"></script>
<body>
<div class="juzhong">
  <div class="top">
    <div class="top_top"><span style="float:left; margin-left:14px;">欢迎访问社区生活服务系统！ 建站咨询热线: 18373337069</span><span style="float:right; margin-right:6px;">登录用户：${user.UNickname}&nbsp;&nbsp;&nbsp;今天是：${time }</span>
      <div class="clear"></div>
    </div>
    <div class="logo_bg"><img src="user/images/logo.jpg" style="float:left; margin:18px 0 0 25px;"><img src="user/images/logo_bg2.gif" width="502" height="100"  style=" float:right;">
      <div class="clear"></div>
    </div>
    <div class="muen">
      <div class="subnav">
        <ul id="nuw">
          <li class="one"><a href="${pageContext.request.contextPath}/user.do?p=log&username=${user.UName}&password=${user.UPassword}&image=${code}">&nbsp;&nbsp;&nbsp;&nbsp;首页</a></li>
          <li  class="one"><a href="user/shequxiangqing.jsp">关于社区</a>
            <ul>
              <li><a href="user/shequxiangqing.jsp">社区详情</a></li>
              <li><a href="vshequrongyu.jsp">社区荣誉</a></li>
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
            <li id="border_top"><a href="user/shequxiangqing.jsp">社区详情</a></li>
            <li><a href="user/shequrongyu.jsp">社区荣誉</a></li>
            <li><a href="user/shoufeibiaozhun.jsp">缴费标准</a></li>
          </ul>
        </li>
        <li><a href="${pageContext.request.contextPath}/user.do?p=gerenxinxi">个人中心</a></li>
        <li id="bottom_none"><a href="#" onClick="DoMenu('ChildMenu2')">兴趣圈子</a>
          <ul id="ChildMenu2" class="collapsed">
            <li id="border_top"><a href="${pageContext.request.contextPath}/hobby.do?p=findalltocj">创建兴趣圈子</a></li>
            <li><a href="user/sousuoxqz.jsp">搜索兴趣圈子</a></li>
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
        <div class="right_title"> <span style="float:left;"><strong>缴费</strong></span>
        
        <div class="fanye_right">
           <span style="margin:0 2px;font-size=2;">
               <a href="user/jiaofeione.jsp"><font size=2>返回第一步&lt;</font></a>
           </span>
        </div>
              
          <div class="clear"></div>
        </div>        
        <div><img src="user/images/Y02.jpg" width="757"/></div>
        
        <div class="zaixianfalv"><br>   
          <table width="80%" border="0" cellpadding="0" cellspacing="0" bgcolor="#cbcbcb" align="center">
          	<tr>
				<td height="25" bgcolor="#f8f8f8" style="padding-top:8px; color:#4c657e;">
					<font style="font-weight:bold;font-family: 楷体;">账户信息</font>
				</td>
			</tr>
          </table>
          <table width="80%" border="0" cellpadding="0" cellspacing="1" bgcolor="#cbcbcb" class="biaoge" align="center">		
            <tr>
              <td height="35" bgcolor="#9FB6CD" style="color:white"> 户&nbsp;&nbsp;&nbsp;&nbsp;号：</td>
              <td bgcolor="#f8f8f8" colspan="5">
                <label>
                <input type="text" id="name" name="username1" value="${user.UName}" style="border: solid 1px #ccc;">
                </label>
              </td>                         
            </tr>      
            <tr>
              <td height="35" bgcolor="#9FB6CD" style="color:white"> 所住栋数：</td>
              <td bgcolor="#f8f8f8">
                <input size=3 type="text" name="userbulid1" value="${user.UBuild}" id="userbulid1" style="border: solid 1px #ccc;">
              </td>
              <td height="35" bgcolor="#9FB6CD" style="color:white"> 所住单元：</td>
              <td bgcolor="#f8f8f8">
                <input size=2 type="text" name="userunit1" value="${user.UUnit}" id="userunit1" style="border: solid 1px #ccc;">
              </td>   
              <td height="35" bgcolor="#9FB6CD" style="color:white"> 所住楼号：</td>
              <td bgcolor="#f8f8f8">
                <input size=4 type="text" name="userfloor1" value="${user.UFloor}" id="userfloor1" style="border: solid 1px #ccc;">
              </td>
            </tr>       
          </table>
          <table width="80%" border="0" cellpadding="0" cellspacing="0" bgcolor="#cbcbcb" align="center">
          	<tr>
				<td height="25" bgcolor="#f8f8f8" colspan="2" style="padding-top:8px; color:#4c657e;">
					<font style="font-weight:bold;font-family: 楷体;">缴费项目</font>
				</td>
			</tr>
          </table>
		 <form method="post" action="${pageContext.request.contextPath}/acut.do?p=tojq&acid=${act.acid}">
          <table width="80%" border="0" cellpadding="0" cellspacing="1" bgcolor="#cbcbcb" class="biaoge" align="center">
          	<tr>
              <td height="35" bgcolor="#9FB6CD" width=100 style="color:white"> 缴费类型：</td>
              <td bgcolor="#f8f8f8">
                <label>
                <input value="${act.acname}" size=10 type="text" id="name" name="type" onblur="#" id="username1" style="border: solid 1px #ccc;">
                </label>
              </td>
              <td height="35" bgcolor="#9FB6CD" style="color:white"> 收费部门：</td>
              <td bgcolor="#f8f8f8" align="left">
                <input value="${act.accompany}" size=28 type="text" name="userbulid1" id="userbulid1" style="border: solid 1px #ccc;">
              </td>
            </tr>
            <tr>
            	<td height="35" bgcolor="#9FB6CD" width=100 style="color:white"> 缴费条形码：</td>
            	<td colspan="3" bgcolor="#f8f8f8">
            		<input value="${tiao}" size=36 type="text" name="ma" id="userbulid1" style="border: solid 1px #ccc;">
            		<a href="${pageContext.request.contextPath}/acut.do?p=refer&actid=${act.acid}">
            			<img style="margin:0px 165px 0px 0px;" align="right" src="user/images/reload.gif" width=21/>
            		</a>
            	</td>
            </tr>
            <tr>
              <td height="35" bgcolor="#9FB6CD" width=100 style="color:white"> 缴费金额：</td>
              <td bgcolor="#f8f8f8" colspan="2">
                <label>
                <input value="${num}" size=19 type="text" id="money1" name="money" onblur="#" style="border: solid 1px #ccc;">
                </label>
              </td>
              <td height="35" bgcolor="#9FB6CD" style="color:white"> 单位：元</td>
            </tr>    

          </table>
          	<p align="center">
          		<input align="middle" type="submit" value="下一步"/>
          	</p>
          </form>
        </div>
      </div>
    </div>
    <div class="clear"></div>
  </div>
  <div class="bottom">
    <div class="bottom_left"> <a href="user/lianxi.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系我们&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> |  <a href="http://www.cnblogs.com/5211314jackrose/">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;官方博客</a>  </div>
    <div class="bottom_right">&nbsp;&nbsp;&nbsp;&nbsp;地址：湖南省株洲市天元区珠江南路&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮政编码：412007&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;版权所有人：原思平</div>
  </div>
</div>
</body>
</html>
