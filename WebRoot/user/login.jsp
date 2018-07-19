<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>社区生活服务系统</title>
<style type="text/css">
<!--
*{overflow:hidden; font-size:9pt;}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(images/bg.gif);
	background-repeat: repeat-x;
}
-->
</style></head>

<body>
<table width="100%"  height="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="561" style="background:url(images/lbg.gif)"><table width="940" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="238" style="background:url(images/login01.jpg)">&nbsp;</td>
          </tr>
          <tr>
            <td height="190"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="208" height="190" style="background:url(images/login02.jpg)">&nbsp;</td>
                <td width="518" style="background:url(images/login03.jpg)">
                <form name=form action="${pageContext.request.contextPath}/user.do?p=log" method=post>
                <table width="320" border=0 align="center" cellpadding="0" cellspacing="0">
                 
                  <tr>
                    <td width="40" height="45"><img src="images/user.gif" width="30" height="30"></td>
                    <td width="38" height="45" align="center">用&nbsp;&nbsp;&nbsp;户</td>
                    <td width="242" height="45"><input type="text" name="username" id="textfield" style="width:164px; height:32px; line-height:34px; background:url(images/inputbg.gif) repeat-x; border:solid 1px #d1d1d1; font-size:9pt; font-family:Verdana, Geneva, sans-serif;"></td>
                  </tr>
                  <tr>
                    <td height="45"><img src="images/password.gif" width="28" height="32"></td>
                    <td height="45" align="center">密&nbsp;&nbsp;&nbsp;码</td>
                    <td height="45"><input type="password" name="password" id="textfield2" style="width:164px; height:32px; line-height:34px; background:url(images/inputbg.gif) repeat-x; border:solid 1px #d1d1d1; font-size:9pt; "></td>
                  </tr>
                  <tr>
                  	<td colspan="2">
                  		<img src="${pageContext.request.contextPath}/user.do?p=doGetImage" id="img" alt="看不清，换一张" onclick="changeImage()">
                  	</td>
                  	<td>
                  		<input placeholder="请输入左方验证码" type="text" name="image" id="imagefield" style="width:164px; height:32px; line-height:34px; background:url(images/inputbg.gif) repeat-x; border:solid 1px #d1d1d1; font-size:9pt; font-family:Verdana, Geneva, sans-serif;">
                  	</td>
                  </tr>
                  <tr>
                    <td height="40">&nbsp;</td>
                    <td height="60">
                    <img onclick="javascript:fsubmit(document.form)" src="images/login.gif" width="78" height="34">&nbsp;&nbsp;&nbsp;</td>
                    <td align="center"><a href="zhuce.jsp"><img src="images/register.gif" width="78" height="34"></a></td>
                  	
                  </tr>
                </table>
                </form>
                </td>
                <td width="214" style="background:url(images/login04.jpg)" >&nbsp;</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="133" style="background:url(images/login05.jpg)">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>

<script type="text/javascript">
	
function fsubmit(obj){
	obj.submit();
}

function changeImage(){
			document.getElementById("img").src="${pageContext.request.contextPath}/user.do?p=doGetImage&x="+Math.random();
	}

</script>


</html>
