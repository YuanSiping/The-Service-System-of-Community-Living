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
<link href="user/css/css.css" rel="stylesheet" type="text/css">
</head>
<script src="user/js/muen.js" type="text/javascript"></script>
<script src="user/js/nav.js" type="text/javascript"></script>
<script type="text/javascript" src="user/js/jquery-1[1].2.1.pack.js" ></script>
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
          <li  class="one"><a href="${pageContext.request.contextPath}/user.do?p=gerenxinxi">个人中心</a></li>
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
        <li><a href="${pageContext.request.contextPath}/user.do?p=gerenxinxi"><img src="user/images/jbxx.gif" border="0" align="middle" width="100" height="20"></a></li><br>
        <li><a href="${pageContext.request.contextPath}/hobby.do?p=wdqz&uid=${user.UId}"><img src="user/images/wdqz.gif" border="0" align="middle" width="100" height="20"></a></li><br>
        <li><a href="${pageContext.request.contextPath}/acut.do?p=useract&uid=${user.UId}"><img src="user/images/jfjl.gif" border="0" align="middle" width="100" height="20"></a></li>
      </ul>
      <div class="clear"></div>
    </div>
    
    <div class="right_2">
      <div class="right_nr">
        <div class="right_title"> <span style="float:left;"><strong>基本信息</strong></span>
          <div class="clear"></div>
        </div>
        <div class="zaixianfalv">
          <br>        
          
          <form action="${pageContext.request.contextPath}/user.do?p=recommd1&uid=${user.UId}" method="post" >
          <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#cbcbcb" class="biaoge">
			<tr>
              <td height="35" bgcolor="#f8f8f8"><span>*</span> 昵称：</td>
              <td bgcolor="#f8f8f8">
                <label>
                <input type="text" value="${user.UNickname}" name="nickname" onblur="checknickname()" id="nickname" style="border: solid 1px #ccc;">
                </label>
              </td>
            </tr>

            <tr>
              <td height="35" bgcolor="#f8f8f8"><span>*</span> 姓名：</td>
              <td bgcolor="#f8f8f8">
                <label>
                <input type="text" value="${user.UName}" name="username1" style="border: solid 1px #ccc;">
                </label>
              </td>
            </tr>
            <tr>
              <td height="35" bgcolor="#f8f8f8"><span>*</span> 密码：</td>
              <td bgcolor="#f8f8f8">
                <input type="password" value="${user.UPassword}" name="userpwd1" size="21" id="userpwd1" style="border: solid 1px #ccc;">
              </td>
            </tr>
            <tr>
              <td height="35" bgcolor="#f8f8f8"> 性别：</td>
              <td bgcolor="#f8f8f8">
                <label>
                <input type="radio" name="usersex1" id="usersex1" value="男" checked="checked" ${user.USex=='男'?'checked':"" }>男 </label>
                <font style="margin:0 20px;">
                <input type="radio" name="usersex1" id="usersex1" value="女" ${user.USex=='女'?'checked':"" }>女</font>
              </td>
            </tr>
            <tr>
              <td height="35" bgcolor="#f8f8f8"> 银行卡号：</td>
              <td bgcolor="#f8f8f8">
                <input type="text" value="${user.UBankcard}" name="usercard1" id="usercard1" style="border: solid 1px #ccc;">
              </td>
            </tr>
            <tr>
              <td height="35" bgcolor="#f8f8f8"> 所住栋数：</td>
              <td bgcolor="#f8f8f8">
                <input type="text" value="${user.UBuild}" name="userbulid1" id="userbulid1" style="border: solid 1px #ccc;">
              </td>
            </tr>
            <tr>
              <td height="35" bgcolor="#f8f8f8"> 所住单元：</td>
              <td bgcolor="#f8f8f8">
                <input type="text" value="${user.UUnit}" name="userunit1" id="userunit1" style="border: solid 1px #ccc;">
              </td>
            </tr>
            <tr>
              <td height="35" bgcolor="#f8f8f8"> 所住楼号：</td>
              <td bgcolor="#f8f8f8">
                <input type="text" value="${user.UFloor}" name="userfloor1" id="userfloor1" style="border: solid 1px #ccc;">
              </td>
            </tr>
            
          </table>
          <div>
            <div align="center" style="padding:15px 0;">
              <input name="提交" type="submit" value="提交" style="border: solid 1px #ccc; background:#fff; margin-right:10px;">
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
    <div class="bottom_left"> <a href="user/lianxi.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系我们&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> |  <a href="http://www.cnblogs.com/5211314jackrose/">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;官方博客</a>  </div>
    <div class="bottom_right">&nbsp;&nbsp;&nbsp;&nbsp;地址：湖南省株洲市天元区珠江南路&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮政编码：412007&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;版权所有人：原思平</div>
  </div>
</div>
</body>
</html>

<SCRIPT>
	function checknickname(){
		var name = document.getElementById("nickname").value;
		$.post("user.do?p=checknickname",{"nickname": name , X:Math.random()} ,function(data){
			if(data=='true'){
				alert("该用户名已被注册");
			}else{
				
			}
			
		});
	}
</SCRIPT>  