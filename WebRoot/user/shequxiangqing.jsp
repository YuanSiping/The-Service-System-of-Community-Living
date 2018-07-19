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
        <div class="right_title"> <span style="float:left;"><strong>社区介绍</strong>Community introduction</span> <span style="float:right;"> </span>
          <div class="clear"></div>
        </div>
        <div class="jieshao">
          <div class="jieshao_nr">
            <div class="jieshao_nr_left"><img src="images/tu_4.jpg"></div>
            <div class="jieshao_nr_right">
              <div class="jieshao_title"><strong style="font-size:14px; color:#4c657e;">基本信息</strong></div>
              面积：容积率1.5，社区面积16万平米，包含3万多平米中央公园<br>
              绿化率：高达50%<br>
             车位总数：共有477个地下和350个地上车位<br>
              物业公司：全球知名物业公司第一太平戴维斯物业 </div>
            <div class="clear"></div>
          </div>
          <div class="jieshao_nr_2">
            <div class="jieshao_nr_2_title">配套信息</div>
            <div class="jieshao_nr_2_nr"> 地铁：5号线、亦庄线<br>
              公交：17路、2路5、43路、39路、300路、368路、705路、732路、741路<br> 
              学校：丰台区康华小学、第一实验小学彩虹分校、东铁匠营第一小学、东铁匠营第二中学、北京市第二二二中学、木樨园中学<br>
              医院：石榴园医院、丰台区和平医院、丰台区兴海医院、京温社区卫生站、永南医院、中医疑难病研究会刘家窑门诊部<br>
             银行：农业银行光彩支行、工商银行光彩路支行、建设银行海慧寺储蓄所、石榴庄邮政储蓄<br>
             超市：物美便利超市南顶路店、超市发南顶路店、华润万家生活超市光彩店、中铁购物中心<br>
             餐饮：南顶村烤鸭、朋友居餐厅、凯旋一元利羊羯子火锅店、南顶冬秋烤肉城、粥全粥道、乾为天酒楼 </div>
          </div>
          
          <div class="jieshao_nr_2">
            <div class="jieshao_nr_2_title">售卖信息</div>
            <div class="jieshao_nr_2_nr"> 价格走势：均价：33123元/平米，环比上涨20.86%，小区共有出售房源56套，出租房源68套，服务该小区的经纪人有16位。</div>
          </div>
          
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
