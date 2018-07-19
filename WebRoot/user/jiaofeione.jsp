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

<link href="css/style.css" rel="stylesheet">	
</head>
<script src="js/muen.js" type="text/javascript"></script>
<script src="js/nav.js" type="text/javascript"></script>

<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script src="js/json2.js"></script>
<script type="text/javascript" src="js/searchconfig.js?version=20151217"></script>
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
      <div class="right_nr" >
      	<div class="right_title"> <span style="float:left;"><strong>缴费</strong></span>
          <div class="clear"></div>
        </div>
        <div><img src="images/Y01.jpg" width="757"/></div>

        <div class="bill_main" >
		      <div class="bill_type" id="billProduct">
		      	<div class="type_one mar-r-40 cur_type" id="type1000000210" onclick="chargeCityBillOrg('1000000210')">
		      		<div class="type_pic type_pic1"></div>
		      		<div class="type_name">电费</div>
		      	</div>
		      	<div class="type_one mar-r-40" id="type1000000209" onclick="chargeCityBillOrg('1000000209')">
			      	<div class="type_pic type_pic2"></div>
			      	<div class="type_name">水费</div>
		      	</div>
		      	<div class="type_one mar-r-40" id="type1000000211" onclick="chargeCityBillOrg('1000000211')">
			      	<div class="type_pic type_pic3"></div>
			      	<div class="type_name">燃气费</div>
		      	</div>
		      	<div class="type_one mar-r-40" id="type1000000207" onclick="chargeCityBillOrg('1000000207')">
			      	<div class="type_pic type_pic4"></div>
			      	<div class="type_name">宽带固话费</div>
		      	</div>
		      	<div class="type_one mar-r-40" id="type1000000208" onclick="chargeCityBillOrg('1000000208')">
			      	<div class="type_pic type_pic6"></div>
			      	<div class="type_name">收视费</div>
		      	</div>
		      </div>
		      
		      <div class="bill_con clearfix">
		        <div class="bill_con_left"><br>
		          <div class="bill_em clearfix">
		            <div class="bill_l">出账机构：</div>
		            <div class="bill_r">
		            	<input id="cop" type="text" value="湖南省株洲市电力公司" size=50 style="background-color:#1C86EE;font-family: 楷体;color:white;font-size: 15px"/>
		            </div>
		          </div>
				</div>
			  </div>
			  	
			  <div class="bill_con clearfix">
		        <div class="bill_con_left"><br>
		          <div class="bill_em clearfix">
			  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  		&nbsp;<a id="ahref" href="${pageContext.request.contextPath}/acut.do?p=jf&id=1000000210"><input type="button" value="下一步"/></a>
			  	  </div>
			  	</div>
			  </div>
			  
			</div><br>
      
    </div>

 </div>

</div>
<div class="juzhong">
 <div class="bottom">
    <div class="bottom_left"> <a href="lianxi.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系我们&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> |  <a href="http://www.cnblogs.com/5211314jackrose/">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;官方博客</a>  </div>
    <div class="bottom_right">&nbsp;&nbsp;&nbsp;&nbsp;地址：湖南省株洲市天元区珠江南路&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮政编码：412007&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;版权所有人：原思平</div>
  </div>
</div>
</body>
</html>