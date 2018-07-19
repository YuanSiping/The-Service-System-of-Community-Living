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
        <li><a href="${pageContext.request.contextPath}/user.do?p=gerenxinxi"><img src="images/jbxx.gif" border="0" align="middle" width="100" height="20"></a></li><br>
        <li><a href="${pageContext.request.contextPath}/hobby.do?p=wdqz&uid=${user.UId}"><img src="images/wdqz.gif" border="0" align="middle" width="100" height="20"></a></li><br>
        <li><a href="${pageContext.request.contextPath}/acut.do?p=useract&uid=${user.UId}"><img src="images/jfjl.gif" border="0" align="middle" width="100" height="20"></a></li>
      </ul>
      <div class="clear"></div>
    </div>
    
    <div class="right_2">
      <div class="right_nr">
        <div class="right_title"> <span style="float:left;"><strong>缴费记录</strong></span>
          <div class="clear"></div>
        </div>
        <div class="zaixianfalv">
          <br>        
          	<table border=0 width=100%>
				<tbody>
					<tr>
						<td valign="top" width=300>
							<div>
								<form  method="post" action="${pageContext.request.contextPath}/acut.do?p=findbytype&uid=${user.UId}">
									<table style="BORDER-COLLAPSE: collapse" height=25 cellPadding=1 width=100% align="left" border=0 bgcolor="#607B8B">
										<tr>
											<td align="center"><font style="font-weight:bold" size="2" color="white" >类别：</font></td>
											<td align="left">
												<select name="select">
								                  <option value="auction" selected="selected"> -----缴费种类----- </option>
								                  <option value="水费">水费</option>
								           	 	  <option value="电费">电费</option>
								           	 	  <option value="燃气费">燃气费</option>
								           	 	  <option value="宽带固话费">宽带固话费</option>
								           	 	  <option value="收视费">收视费</option>
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
								<table class="hovertable" style="BORDER-COLLAPSE: collapse;text-align: center;" height=25 cellPadding=1 width=100% align="left" border=1 bgcolor="#9FB6CD">
									<tr>
										<th>缴费种类</th>
										<th>缴费数目</th>
										<th>缴费时间</th>
									</tr>
									<!-- 循环-->
									<c:forEach items="${ats}" var="at">
	
										<tr onmouseover="this.style.backgroundColor='#C1CDCD';" onmouseout="this.style.backgroundColor='#d4e3e5';">
											<td>${type }</td>
											<td>${at.CNumber }</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${at.CTime }"/></td>
										</tr>
								
									</c:forEach>
										
								</table>
							</div>
						</td>
					</tr>
				</tbody>
			</table><br> 
                       
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