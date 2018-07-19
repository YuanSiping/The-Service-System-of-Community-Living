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
<link href="user/css/css.css" rel="stylesheet" type="text/css">
</head>
<script src="user/js/muen.js" type="text/javascript"></script>
<script src="user/js/nav.js" type="text/javascript"></script>
<script src="user/js/jquery-1[1].2.1.pack.js" type="text/javascript"></script>
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
               <a href="user/jiaofeione.jsp"><font size=2>返回第一步&lt;&lt;</font></a>
               <a href="${pageContext.request.contextPath}/acut.do?p=tojqtwo&acid=${act.acid}"><font size=2>返回第二步&lt;</font></a>
           </span>
        </div>

          <div class="clear"></div>
        </div>
        
        <div><img src="user/images/Y03.jpg" width="757"/></div>
        
        <div class="zaixianfalv"><br>
        
        
          <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#f8f8f8">
          	<tr>   
          		<td height="25" width=73 align="left"><font style="font-weight: bold">缴费项目：</font></td>
          		<td width=70 align="left"><span >${act.acname}</span></td>         		
          		<td height="25" width=100 align="left"><font style="font-weight: bold">本次缴费金额：</font></td>
          		<td width=83 align="left"><span >&yen; ${money}</span></td>  
          		<td height="25" width=83 align="left"><font style="font-weight: bold">缴费条形码：</font></td>
          		<td width=10 align="left" colspan="3"><span >${tiao}</span></td>      		
          	</tr>

          	<tr>
          	  <td height="25" bgcolor="#f8f8f8" width=73 align="left" style="vertical-align: top"><font style="font-weight: bold;">支付方式：</font></td>
              <td height="25" colspan="5" bgcolor="#f8f8f8" align="left" style="vertical-align: top">
                <label>
                	<input type="radio" name="usersex1" id="usersex1" value="网上支付" checked="checked" onclick="changeto()">网上支付<font size=2 style="font-family: 楷体;">(选择网上银行缴费)</font>
                </label>
                <label>
                	<font style="margin:0 20px;">
                	<input type="radio" name="usersex1" id="usersex1" value="扫码付" onclick="change()">扫码付<font size=2 style="font-family: 楷体;">(手机支付宝扫二维码缴费)</font></font>
              	</label>
              </td>
          	</tr>
          </table>
          
          <form action="pay.do?p=paybyimg&acid=${act.acid}&num=${money}&order=${tiao}" method="post" id="form0">
          <table id="t0" width="57%" border="0" cellspacing="5" cellpadding="0" align="center" background="user/images/samafu.gif">
          	<tr>
          		<td height="190">&nbsp;</td>
          	</tr>
          </table>
	          <div align="center" style="padding:15px 0;">             
	              <input type="submit" value="确认缴费">
	          </div>
          </form>
          
          <form action="pay.do?p=payment&acid=${act.acid}&num=${money}&order=${tiao}" method="post" id="form1">
          <table id="t1" width="100%" border="0" cellspacing="5" cellpadding="0" align="center" background="user/images/fqbj.gif">
			<tr>
				<td><br>
					<input id="ICBC-NET-B2C" type="radio" name="yh" value="ICBC-NET-B2C" checked="checked"/>
					<img name="ICBC-NET-B2C" align="right" src="user/images/icbc.bmp" width="150"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td><br>
					<input id="CMBCHINA-NET-B2C" type="radio" name="yh" value="CMBCHINA-NET-B2C"/>
					<img name="CMBCHINA-NET-B2C" align="right" src="user/images/cmb.jpg" width="150"/>
			        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        </td>
		        <td><br>
					<input id="ABC-NET-B2C" type="radio" name="yh" value="ABC-NET-B2C"/>
					<img name="ABC-NET-B2C" align="right" src="user/images/abc.jpg" width="150"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td><br>	
					<input id="HXB-NET-B2C" type="radio" name="yh" value="HXB-NET-B2C"/>
					<img name="HXB-NET-B2C" align="right" src="user/images/hx.jpg" width="150"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				
			 </tr>
			 <tr>
			 	<td>
					<input id="BCCB-NET-B2C" type="radio" name="yh" value="BCCB-NET-B2C"/>
					<img name="BCCB-NET-B2C" align="right" src="user/images/bj.jpg" width="150"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td>
					<input id="BOCO-NET-B2C" type="radio" name="yh" value="BOCO-NET-B2C"/>
					<img name="BOCO-NET-B2C" align="right" src="user/images/bcc.jpg" width="150"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td>
					<input id="CIB-NET-B2C" type="radio" name="yh" value="CIB-NET-B2C"/>
					<img name="CIB-NET-B2C" align="right" src="user/images/cib.jpg" width="150"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td>		
					<input id="SPDB-NET-B2C" type="radio" name="yh" value="SPDB-NET-B2C"/>
					<img name="SPDB-NET-B2C" align="right" src="user/images/shpd.jpg" width="150"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			  </tr>
			  <tr>
			  	<td>
					<input id="CCB-NET-B2C" type="radio" name="yh" value="CCB-NET-B2C"/>
					<img name="CCB-NET-B2C" align="right" src="user/images/ccb.jpg" width="150"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td>
					<input id="NJCB-NET-B2C" type="radio" name="yh" value="NJCB-NET-B2C"/>
					<img name="NJCB-NET-B2C" align="right" src="user/images/nanjing.jpg" width="150"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td>
					<input id="PINGANBANK-NET" type="radio" name="yh" value="PINGANBANK-NET"/>
					<img name="PINGANBANK-NET" align="right" src="user/images/pingan.jpg" width="150"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td>
					<input id="POST-NET-B2C" type="radio" name="yh" value="POST-NET-B2C"/>
					<img name="POST-NET-B2C" align="right" src="user/images/post.jpg" width="150"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			  </tr>
			  <tr>
			  	<td>
					<input id="CMBC-NET-B2C" type="radio" name="yh" value="CMBC-NET-B2C"/>
					<img name="CMBC-NET-B2C" align="right" src="user/images/cmbc.jpg" width="150"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td>
					<input id="CEB-NET-B2C" type="radio" name="yh" value="CEB-NET-B2C"/>
					<img name="CEB-NET-B2C" align="right" src="user/images/guangda.jpg" width="150"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td>
					<input id="BOC-NET-B2C" type="radio" name="yh" value="BOC-NET-B2C"/>
					<img name="BOC-NET-B2C" align="right" src="user/images/bc.jpg" width="150"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td>	
					<input id="BJRCB-NET-B2C" type="radio" name="yh" value="BJRCB-NET-B2C"/>
					<img name="BJRCB-NET-B2C" align="right" src="user/images/beijingnongshang.jpg" width="150"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			  </tr>
			  <tr>
			  	<td>
					<input id="CBHB-NET-B2C" type="radio" name="yh" value="CBHB-NET-B2C"/>
					<img name="CBHB-NET-B2C" align="right" src="user/images/bh.jpg" width="150"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td>
					<input id="HKBEA-NET-B2C" type="radio" name="yh" value="HKBEA-NET-B2C"/>
					<img name="HKBEA-NET-B2C" align="right" src="user/images/dy.jpg" width="150"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td>
					<input id="NBCB-NET-B2C" type="radio" name="yh" value="NBCB-NET-B2C"/>
					<img name="NBCB-NET-B2C" align="right" src="user/images//ningbo.jpg" width="150"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td>
					<input id="ECITIC-NET-B2C" type="radio" name="yh" value="ECITIC-NET-B2C"/>
					<img name="ECITIC-NET-B2C" align="right" src="user/images/zx.jpg" width="150"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			  </tr>
			  <tr>
			  	<td>
					<input id="SDB-NET-B2C" type="radio" name="yh" value="SDB-NET-B2C"/>
					<img name="SDB-NET-B2C" align="right" src="user/images/sfz.jpg" width="150"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td>
					<input id="GDB-NET-B2C" type="radio" name="yh" value="GDB-NET-B2C"/>
					<img name="GDB-NET-B2C" align="right" src="user/images/gf.jpg" width="150"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td>		
					<input id="SHB-NET-B2C" type="radio" name="yh" value="SHB-NET-B2C"/>
					<img name="SHB-NET-B2C" align="right" src="user/images/sh.jpg" width="150"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td>
					<input id="CZ-NET-B2C" type="radio" name="yh" value="CZ-NET-B2C"/>
					<img name="CZ-NET-B2C" align="right" src="user/images/zheshang.jpg" width="150"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>          
          </table>
            <div align="center" style="padding:15px 0;">   
              <input name="提交" type="submit" value="下一步">
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

<script type="text/javascript">
$(function() {
	$("img").click(function() {
		$("#" + $(this).attr("name")).attr("checked", true);
	});
});

onload = function(){
	jQuery("#form1").show();
	jQuery("#form0").hide();
}

function change(){
	jQuery("#form1").hide();
	jQuery("#form0").show();
}

function changeto(){
	jQuery("#form1").show();
	jQuery("#form0").hide();
}

</script>