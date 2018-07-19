<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<LINK href="admin/css/admins.css" type="text/css" rel="stylesheet">
  </HEAD>
  
  <body  bgcolor="#E0EEEE"> 
  	<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
	    <TR height=28>
	    <TD background=admin/images/title_bg1.jpg>当前位置:修改居民信息</TD>
	    </TR>
	    <TR>
	    <TD bgColor=#b1ceef height=1></TD>
	    </TR>
	    <TR height=20>
	
	    </TR>
	</TABLE> 
  <br>
  	<!-- 
    <h3 align="center">请修改居民信息</h3>
    <hr width="219" align="center"/>
     -->
    <form action="user.do?p=recommd" method="post" >
    	<table class="hovertable" style="BORDER-COLLAPSE: collapse;text-align: center;" border="0" cellspacing="0" cellpadding="1" align="center">
    		<tr>
    			<td bgcolor="#ADD8E6">昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称</td>
    			<td>
    			<input type="text" name="nickname" value="${user.UNickname }"/>
    			</td>
    		</tr>
    		<tr>
    			<td bgcolor="#ADD8E6">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</td>
    			<td>
    			<input type="text" name="username" value="${user.UName }"/>
    			</td>
    		</tr>
    		<tr>
    			<td bgcolor="#ADD8E6">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</td>
    			<td>
    			<input type="password" name="userpwd" value="${user.UPassword }" size="21"/>
    			</td>
    		</tr>
    		<tr>
    			<td bgcolor="#ADD8E6">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</td>
    			<td>
	    			<input type="radio" name="usersex" value="男" ${user.USex=='男'?'checked':"" }/>男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    			<input type="radio" name="usersex" value="女" ${user.USex=='女'?'checked':"" }/>女
    			</td>
    		</tr>
    		<tr>
    			<td bgcolor="#ADD8E6">银行卡号</td>
    			<td>
    			<input type="text" name="usercard" value="${user.UBankcard }"/>
    			</td>
    		</tr>
    		<tr>
    			<td bgcolor="#ADD8E6">所住栋数</td>
    			<td>
    			<input type="text" name="userbulid" value="${user.UBuild }"/>
    			</td>
    		</tr>
    		<tr>
    			<td bgcolor="#ADD8E6">所住单元</td>
    			<td>
    			<input type="text" name="userunit" value="${user.UUnit }"/>
    			</td>
    		</tr>
    		<tr>
    			<td bgcolor="#ADD8E6">所住楼层</td>
    			<td>
    			<input type="text" name="userfloor" value="${user.UFloor }"/>
    			</td>
    		</tr>
    	</table><br>
    	<p align="center">	
    		<input type="hidden" name="UId" value="${user.UId }" >
    		 <input type="submit" value="提交"/>
    		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重置"/>
    	</p>
    </form>
  </body>
</html>
