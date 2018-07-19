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
        <div class="right_title"> <span style="float:left;"><strong>缴费标准</strong>Payment standard&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
        	<div>
         		 <a href="javascript:window.print()" class="daying">打印本页</a>
          	</div>
          <div class="clear"></div>
        </div>
        <div style=" padding:10px 0 10px 10px;">
          
         一、电费缴费标准：
          <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#444444">
            <tr>
              <td width="25%" align="center" valign="middle" bgcolor="#ffffff"><strong>用电类别</strong></td>
              <td width="25%" align="center" valign="middle" bgcolor="#ffffff"><strong>用电阶梯</strong></td>
              <td width="25%" align="center" valign="middle" bgcolor="#ffffff"><strong>电量标准</strong></td>
              <td width="25%" align="center" valign="middle" bgcolor="#ffffff"><strong>电价</strong></td>
            </tr>
            <tr>
              <td rowspan="3" align="center" valign="middle" bgcolor="#ffffff">居民生活用电</td>
              <td align="center" valign="middle" bgcolor="#ffffff">第一档</td>
              <td align="center" valign="middle" bgcolor="#ffffff">每户每月180度</td>
              <td align="center" valign="middle" bgcolor="#ffffff">0.56元/度</td>
            </tr>
            <tr>
              <td align="center" valign="middle" bgcolor="#ffffff">第二档</td>
              <td align="center" valign="middle" bgcolor="#ffffff">每户每月180~260度</td>
              <td align="center" valign="middle" bgcolor="#ffffff">0.61元/度</td>
            </tr>
            <tr>
              <td align="center" valign="middle" bgcolor="#ffffff">第三档</td>
              <td align="center" valign="middle" bgcolor="#ffffff">每户每月260度以上</td>
              <td align="center" valign="middle" bgcolor="#ffffff">0.86元/度</td>
            </tr>
            <tr>
              <td rowspan="3" align="center" valign="middle" bgcolor="#ffffff">非居民照明用电</td>
              <td align="center" valign="middle" bgcolor="#ffffff">第一档</td>
              <td align="center" valign="middle" bgcolor="#ffffff">不满1千伏</td>
              <td align="center" valign="middle" bgcolor="#ffffff">0.7196元/千瓦时</td>
            </tr>
            <tr>
              <td align="center" valign="middle" bgcolor="#ffffff">第二档</td>
              <td align="center" valign="middle" bgcolor="#ffffff">1-10千伏</td>
              <td align="center" valign="middle" bgcolor="#ffffff">0.7116元/千瓦时</td>
            </tr>
            <tr>
              <td align="center" valign="middle" bgcolor="#ffffff">第三档</td>
              <td align="center" valign="middle" bgcolor="#ffffff">35-110千伏</td>
              <td align="center" valign="middle" bgcolor="#ffffff">0.7106元/千瓦时</td>
            </tr>
          </table>
           <br>
          二、水费缴费标准
          <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#444444">
            <tr>
              <td width="25%" align="center" valign="middle" bgcolor="#ffffff"><strong>用水类别</strong></td>
              <td width="25%" align="center" valign="middle" bgcolor="#ffffff"><strong>基本水价</strong></td>
              <td width="25%" align="center" valign="middle" bgcolor="#ffffff"><strong>附加费</strong></td>
              <td width="25%" align="center" valign="middle" bgcolor="#ffffff"><strong>到户价</strong></td>
            </tr>
            <tr>
              <td align="center" valign="middle" bgcolor="#ffffff">生活用水</td>
              <td align="center" valign="middle" bgcolor="#ffffff">1.62</td>
              <td align="center" valign="middle" bgcolor="#ffffff">1.33</td>
              <td align="center" valign="middle" bgcolor="#ffffff">2.95</td>
            </tr>
            <tr>
              <td align="center" valign="middle" bgcolor="#ffffff">生产用水</td>
              <td align="center" valign="middle" bgcolor="#ffffff">2.19</td>
              <td align="center" valign="middle" bgcolor="#ffffff">1.41</td>
              <td align="center" valign="middle" bgcolor="#ffffff">3.60</td>
            </tr>
            <tr>
              <td align="center" valign="middle" bgcolor="#ffffff">特种用水</td>
              <td align="center" valign="middle" bgcolor="#ffffff">4.00</td>
              <td align="center" valign="middle" bgcolor="#ffffff">1.57</td>
              <td align="center" valign="middle" bgcolor="#ffffff">5.57</td>
            </tr>
          </table><br>
          
          三、收视费缴费标准<br>
          &nbsp;&nbsp;月收视费标准：25元/月<br>
          &nbsp;&nbsp;年收视费标准：288元/年<br>
          <br>
          
         四、燃气费缴费标准
          <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#444444">
            <tr>
              <td width="50%" align="center" valign="middle" bgcolor="#ffffff"><strong>收费细目</strong></td>
              <td width="50%" align="center" valign="middle" bgcolor="#ffffff"><strong>收费标准</strong></td>
            </tr>
            <tr>
              <td align="center" valign="middle" bgcolor="#ffffff">居民用气（含学校师生食堂用气）</td>
              <td align="center" valign="middle" bgcolor="#ffffff">1.89元/立方米</td>
            </tr>
            <tr>
              <td align="center" valign="middle" bgcolor="#ffffff">非居民用气 </td>
              <td align="center" valign="middle" bgcolor="#ffffff">2.20元/立方米</td>
            </tr>
            <tr>
              <td align="center" valign="middle" bgcolor="#ffffff">CNG用气</td>
              <td align="center" valign="middle" bgcolor="#ffffff">2.85元/立方米</td>
            </tr>
          </table>
          
          <br>注意：<br>
          1、报停申请： <span style="margin-left:5px;">免费</span><br>
          2、过户申请： <span style="margin-left:5px;">5元/户</span><br>
          3、上门维修： <span style="margin-left:5px;">25元/次（上门费10元）</span><br>
          
          
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
