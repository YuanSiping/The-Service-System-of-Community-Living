<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>社区生活服务系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
   <link href="css/slider.css" rel="stylesheet" type="text/css" media="all"/>
   <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script> 
   <script type="text/javascript" src="js/move-top.js"></script>
   <script type="text/javascript" src="js/easing.js"></script>
   <script type="text/javascript" src="js/startstop-slider.js"></script>
	
	<script type="text/javascript" src="js/jquery-1.5.1.js"></script>

<script type="text/javascript">
$(function() {
	$("img").click(function() {
		$("#" + $(this).attr("name")).attr("checked", true);
	});
});
</script>
  <link rel="stylesheet" href="css/pay.css" type="text/css"></link></head>
  


    
  
  <!-- 主页面 各大银行支付页面  开始 -->
      <div class="divContent" style="margin:20px auto;width:80%;">
	<span class="spanPrice">支付金额：</span><span class="price_t">&yen;${order.total }</span>
	<span class="spanOid">编号：${order.oid }</span>
</div>
<form action="order.do?method=payment" method="post" id="form1" target="_top">
<input type="hidden" name="method" value="payment"/>
<input type="hidden" name="oid" value="${order.oid }"/>
<div class="divBank" style="margin:0px auto;width:80%;">
	<div class="divText">选择网上银行</div>
	<div style="margin-left: 20px;">
	  <div style="margin-bottom: 20px;">
		<input id="ICBC-NET-B2C" type="radio" name="yh" value="ICBC-NET-B2C" checked="checked"/>
		<img name="ICBC-NET-B2C" align="middle" src="images/icbc.bmp"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
		<input id="CMBCHINA-NET-B2C" type="radio" name="yh" value="CMBCHINA-NET-B2C"/>
		<img name="CMBCHINA-NET-B2C" align="middle" src="images/cmb.jpg"/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
		<input id="ABC-NET-B2C" type="radio" name="yh" value="ABC-NET-B2C"/>
		<img name="ABC-NET-B2C" align="middle" src="images/abc.jpg"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
		<input id="CCB-NET-B2C" type="radio" name="yh" value="CCB-NET-B2C"/>
		<img name="CCB-NET-B2C" align="middle" src="images/ccb.jpg"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  </div>	
	  <div style="margin-bottom: 20px;">
		<input id="BCCB-NET-B2C" type="radio" name="yh" value="BCCB-NET-B2C"/>
		<img name="BCCB-NET-B2C" align="middle" src="images/bj.jpg"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

		<input id="BOCO-NET-B2C" type="radio" name="yh" value="BOCO-NET-B2C"/>
		<img name="BOCO-NET-B2C" align="middle" src="images/bcc.jpg"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

		<input id="CIB-NET-B2C" type="radio" name="yh" value="CIB-NET-B2C"/>
		<img name="CIB-NET-B2C" align="middle" src="images/cib.jpg"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

		<input id="NJCB-NET-B2C" type="radio" name="yh" value="NJCB-NET-B2C"/>
		<img name="NJCB-NET-B2C" align="middle" src="images/nanjing.jpg"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  </div>
	  <div style="margin-bottom: 20px;">
		<input id="CMBC-NET-B2C" type="radio" name="yh" value="CMBC-NET-B2C"/>
		<img name="CMBC-NET-B2C" align="middle" src="images/cmbc.jpg"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

		<input id="CEB-NET-B2C" type="radio" name="yh" value="CEB-NET-B2C"/>
		<img name="CEB-NET-B2C" align="middle" src="images/guangda.jpg"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

		<input id="BOC-NET-B2C" type="radio" name="yh" value="BOC-NET-B2C"/>
		<img name="BOC-NET-B2C" align="middle" src="images/bc.jpg"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

		<input id="PINGANBANK-NET" type="radio" name="yh" value="PINGANBANK-NET"/>
		<img name="PINGANBANK-NET" align="middle" src="images/pingan.jpg"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  </div>
	  <div style="margin-bottom: 20px;">
		<input id="CBHB-NET-B2C" type="radio" name="yh" value="CBHB-NET-B2C"/>
		<img name="CBHB-NET-B2C" align="middle" src="images/bh.jpg"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

		<input id="HKBEA-NET-B2C" type="radio" name="yh" value="HKBEA-NET-B2C"/>
		<img name="HKBEA-NET-B2C" align="middle" src="images/dy.jpg"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

		<input id="NBCB-NET-B2C" type="radio" name="yh" value="NBCB-NET-B2C"/>
		<img name="NBCB-NET-B2C" align="middle" src="images//ningbo.jpg"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

		<input id="ECITIC-NET-B2C" type="radio" name="yh" value="ECITIC-NET-B2C"/>
		<img name="ECITIC-NET-B2C" align="middle" src="images/zx.jpg"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  </div>
	  <div style="margin-bottom: 20px;">
		<input id="SDB-NET-B2C" type="radio" name="yh" value="SDB-NET-B2C"/>
		<img name="SDB-NET-B2C" align="middle" src="images/sfz.jpg"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

		<input id="GDB-NET-B2C" type="radio" name="yh" value="GDB-NET-B2C"/>
		<img name="GDB-NET-B2C" align="middle" src="images/gf.jpg"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

		<input id="SHB-NET-B2C" type="radio" name="yh" value="SHB-NET-B2C"/>
		<img name="SHB-NET-B2C" align="middle" src="images/sh.jpg"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

		<input id="SPDB-NET-B2C" type="radio" name="yh" value="SPDB-NET-B2C"/>
		<img name="SPDB-NET-B2C" align="middle" src="images/shpd.jpg"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  </div>
	  <div style="margin-bottom: 20px;">
		<input id="POST-NET-B2C" type="radio" name="yh" value="POST-NET-B2C"/>
		<img name="POST-NET-B2C" align="middle" src="images/post.jpg"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

		<input id="BJRCB-NET-B2C" type="radio" name="yh" value="BJRCB-NET-B2C"/>
		<img name="BJRCB-NET-B2C" align="middle" src="images/beijingnongshang.jpg"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

		<input id="HXB-NET-B2C" type="radio" name="yh" value="HXB-NET-B2C"/>
		<img name="HXB-NET-B2C" align="middle" src="images/hx.jpg"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

		<input id="CZ-NET-B2C" type="radio" name="yh" value="CZ-NET-B2C"/>
		<img name="CZ-NET-B2C" align="middle" src="images/zheshang.jpg"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    </div>
	    </div>
	    <div style="margin: 22px;">
		<a href="javascript:void $('#form1').submit();" class="linkNext">下一步</a>
	    </div>
       </div>
    </form>
  <!-- 主页面 end -->


</html>
