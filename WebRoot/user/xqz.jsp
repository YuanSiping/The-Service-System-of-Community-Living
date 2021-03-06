<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
              <li><a href="user/shequrongyu.jsp">社区荣誉</a></li>
              <li><a href="user/shoufeibiaozhun.jsp">缴费标准</a></li>
            </ul>
          </li>
          <li  class="one"><a href="user.do?p=gerenxinxi">个人中心</a></li>
          <li class="one"><a href="${pageContext.request.contextPath}/hobby.do?p=findall">兴趣圈子</a>
            <ul>
              <li><a href="${pageContext.request.contextPath}/hobby.do?p=findalltocj">创建兴趣圈子</a></li>
              <li><a href="user/sousuoxqz.jsp">搜索兴趣圈子</a></li>
            </ul>
          </li>
          <li class="one"><a href="${pageContext.request.contextPath}/ask.do?p=liuyanzixun">留言咨询</a></li>
          <li class="one"><A style="COLOR: #fff" onclick="if (confirm('确定要退出吗？')) return true; else return false;" href="user/login.jsp">退出系统</A></li>
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
        <li><a href="user.do?p=gerenxinxi">个人中心</a></li>
        <li id="bottom_none"><a href="#" onClick="DoMenu('ChildMenu2')">兴趣圈子</a>
          <ul id="ChildMenu2" class="collapsed">
            <li id="border_top"><a href="${pageContext.request.contextPath}/hobby.do?p=findalltocj">创建兴趣圈子</a></li>
            <li><a href="user/sousuoxqz.jsp">搜索兴趣圈子</a></li>
          </ul>
        </li>
        <li><a href="${pageContext.request.contextPath}/ask.do?p=liuyanzixun">留言咨询</a></li>
        <li><A onclick="if (confirm('确定要退出吗？')) return true; else return false;" href="user/login.jsp">退出系统</A></li>
        <li><a href="javascript:window.close()">关闭窗口</a></li>
      </ul>
      <div class="clear"></div>
    </div>
    
    <div class="right_2">
      <div class="right_nr">
      	<div class="right_title"> <span style="float:left;"><strong>兴趣组成员</strong></span>
          <div class="clear"></div>
        </div>
      
      	<div class="zaixianfalv"><br>
      		<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#cbcbcb" class="biaoge">
      		
      			<c:forEach items="${list}" var="user" varStatus="s" >
      			
      				<c:if test="${user.UId == sessionScope.user.UId}">
      					<c:set var="flag" value="true"></c:set>
      				</c:if>
      			
      				<c:if test="${s.index%6==0}">
		      			<tr>
	            	</c:if>
	            	 <td height="35" bgcolor="#f8f8f8" width="22">${user.UName}</td>
	            	 
	            	 <c:if test="${s.index>0 && s.index%5==0 or fn:length(list)== (s.index%5+1)} ">
		      			</tr>
	            	</c:if>
            	</c:forEach>
            
            	
            	
      		</table>
      		
      		<div>
            <div align="center" style="padding:15px 0;">
              <c:if test="${empty flag}" var="f">
              	<a href="${pageContext.request.contextPath}/hobby.do?p=jiaru&hid=${hid}"><img src="user/images/jiaru.gif" width="35" height="20"></a>
              </c:if>
              <c:if test="${not f}">
              	<a href="${pageContext.request.contextPath}/hobby.do?p=tuichu&hid=${hid}"><img src="user/images/tuichu.gif" width="35" height="20"></a>
              </c:if>
              
            </div>
          </div>
      		
      	</div><br>
      
      
        <div class="right_title"> <span style="float:left;"><strong>兴趣组活动</strong></span>
          <div class="clear"></div>
        </div>
        
        <div class="shouji_nr"> 
        	<c:forEach items="${list1}" var="act" varStatus="a" >
        	
        	 <strong>${act.AName}</strong>
	          <div class="shouji">
	            <p>活动时间：<fmt:formatDate value="${act.ATime}" pattern="yyyy-MM-dd HH:mm"/>   </p>
	            <p>活动地点：${act.AAdress}</p>
	            <p>活动内容：${act.AComent}</p>
	            <p>活动备注：${act.ASpec}</p>
	          </div>
        	
        	</c:forEach>
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

