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
<link href="user/css/css2.css" rel="stylesheet" type="text/css">
</head>
<script src="user/js/jquery-1[1].2.1.pack.js" type="text/javascript"></script>
<script src="user/js/muen.js" type="text/javascript"></script>
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
          <li class="one"><a href="ask.do?p=liuyanzixun">留言咨询</a></li>
          <li class="one"><A style="COLOR: #fff" onclick="if (confirm('确定要退出吗？')) return true; else return false;" href="user/login.jsp">退出系统</A></li>
          <li class="one"><a style="COLOR: #fff;background-image: none;" href="javascript:window.close()">关闭窗口</a></li>
         </ul>     
      </div>
      
      <div class="clear"></div>
    </div>
  </div>
  <div class="main">
    <div class="left">
      <div class="banner">
        <div align="center">
          <!-- 焦点图切换开始 -->
          <DIV id=nav>
            <UL>
               <LI><IMG src="user/images/01.jpg" text="社区全景|天台小区" pic="1">
                <DIV>社区概念图</DIV>
              </LI>
              <LI><IMG src="user/images/02.jpg" text="如画的花园|天台小区" pic="2">
                <DIV>社区花园图</DIV>
              </LI>
              <LI><IMG src="user/images/03.jpg" text="整洁的餐厅|天台小区" pic="3">
                <DIV>社区餐厅图</DIV>
              </LI>
              <LI><IMG src="user/images/04.jpg" text="迷人的夜景|天台小区" pic="4">
                <DIV>社区夜景图</DIV>
              </LI>
              <LI><IMG src="user/images/05.jpg" text="豪华的装潢|天台小区" pic="5">
                <DIV>社区室内图</DIV>
              </LI>
            </UL>
            <DIV id=BG></DIV>
            <DIV id=mask></DIV>
            <DIV id=back><IMG height=255 src="" width=685></DIV>
          </DIV>
          <p>
            <SCRIPT type=text/javascript>
 <!--
 
 function connect(obj){
	window.location.href=obj.value;	 
 }
 
 onload = function(){

	 var smallDiv = document.createElement("div");
		 smallDiv.id = "smallDiv";
		 with (smallDiv.style)
		 { 
		     position = "absolute";
             width    = "166px";
			 height =(Math.max(document.body.clientHeight,document.body.scrollHeight))/2+30;
			 <!--left = (document.body.clientWidth-1020)/2; -->
			 <!--top  = (document.body.clientHeight - 650)/2;-->
			 left = 9;
			 top  = (document.body.clientHeight - 650)/2+80;
			 backgroundColor = "gray";
			 backgroundImage="url("+getRootPath()+"/user/images/tuijianbj.gif)";
			
			 //设置界面透明效果
			  filter="alpha(opacity=60)";  //ie
			  opacity=0.8; //firefox
		 }
		document.body.appendChild(smallDiv);
		
		var btnClose = document.createElement("input");
		btnClose.type = "button";
		btnClose.value="x";
	    btnClose.style.marginLeft = document.all ? smallDiv.offsetWidth - btnClose.offsetWidth:smallDiv.offsetWidth-btnClose.offsetWidth-30;
		smallDiv.appendChild(btnClose);
		btnClose.onclick = function()
		{
			 var smallDiv = document.getElementById("smallDiv");
			 smallDiv.parentNode.removeChild(smallDiv);
		}
		
		 $.post("hobby.do?p=findhoactbyuser" , {x:Math.random()} , function(data){
			var json =  eval(data);
			var s="";
			var s = "<font style='font-weight:bold' size='2' color='white'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;近期社区活动</font>" + "<br>" ;
			
			for(var i = 0 ; i < json.length ; i++){
				var time = new Date(json[i].ATime).format('yyyy/MM/dd');
				var an = json[i].AName;
				s = s +"&nbsp;"+"<font color='white'>"+time +"</font>"+ ":<br>" ; 
				s = s +"&nbsp;"+"<a href='${pageContext.request.contextPath}/hobby.do?p=showone&name="+an+"'>"+ json[i].AName+"</a><br>" ; 
				
			}		
			 $("#smallDiv").append(s);
		 
		 });
	
 }
 
 
 //得到工程路径
function getRootPath() {
	//http://localhost:8083/uimcardprj/share/meun.jsp
	var curWwwPath = window.document.location.href;
	//uimcardprj/share/meun.jsp
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	//http://localhost:8083
	var localhostPaht = curWwwPath.substring(0, pos);
	// uimcardprj
	var projectName = pathName.substring(0, pathName.substr(1).indexOf("/") + 1);
	if (projectName == "/pc") {
		projectName = "";
	}
	return (localhostPaht + projectName);
}
 
 
//js对日期进行格式化
Date.prototype.format =function(format)
{
      var o = {
      "M+" : this.getMonth()+1, //month
	  "d+" : this.getDate(),    //day
	  "H+" : this.getHours(),   //hour
	  "m+" : this.getMinutes(), //minute
	  "s+" : this.getSeconds(), //second
	  "q+" : Math.floor((this.getMonth()+3)/3),  //quarter
	  "S"  : this.getMilliseconds() //millisecond
	  }
      if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
      (this.getFullYear()+"").substr(4- RegExp.$1.length));
      for(var k in o)if(new RegExp("("+ k +")").test(format))
      format = format.replace(RegExp.$1,
      RegExp.$1.length==1? o[k] :
      ("00"+ o[k]).substr((""+ o[k]).length));
      return format;
}
 
 
 
 
 var num = 0;
 $("#nav").hide();
	$("li img").load(function(){
		num++;
		if (num==4)
		{
			$("#nav").show();
		}
	})
		.click(function(){
		
		//如果已经处于active状态，return
		if (this.className.indexOf("active")!=-1) return;
		
		//正文文字渐隐
		$("#frontText").fadeOut();
		$("#frontTextBack").fadeOut();
		$("#frontTextSub").fadeOut();

		//active状态的图片恢复原样
		$("li img.active").fadeTo(200,0.6)
		.removeClass("active")
		.animate({top:5,width:70,left:1},300)
		.parent().css({"color":"#aaa"});  //
		
		//获取数据
		var i = $(this).attr("pic");
		var t = $(this).attr("text").split("|");
		
		//当前
		$(this).animate({top:-5,width:70,height:40,left:1},100)
		.addClass("active")
		.fadeTo(200,1)
		.parent().css({"color":"white"});

		$("#back").children().addClass("gray").end()
					.fadeTo(500,0.1,function(){
										//var IMG = new Image();
										//IMG.s
										$(this).children("img").attr("src","user/images/"+i+".jpg").removeClass("gray");	  //更改图片
										$(this).fadeTo(500,1,function(){
																$("#frontText").html(t[0]).fadeIn(200);	//更改正文文字
																$("#frontTextBack").html(t[0]).fadeIn(200);	//阴影文字
																$("#frontTextSub").html(t[1]).fadeIn(200)}	//副标题
																);
										})
		})

	//初始第一张图片
	
	var i =0;

	show();

	function show(){
		if (i==$("li img").size()) i = 0
		$("li img").eq(i).click();
		i++;
		//setTimeout(show(),1000);
	}

	document.oncontextmenu   =  function(e){return false}
	
	if (self.location.search!=""){
		var V = self.location.search;
		V = V.substr(1,V.length);
		eval(V);
		var json ="{";
		if (option.skin==0)
			$("#mask").hide();
		if (option.animate == 0){
		$("#nav ul").hide();
		}
		$("#nav").width(option.width?option.width:685);
		$("#nav").height(option.height?option.height:255);
		$("#back img").width($("#nav").width());
		$("#back img").height($("#nav").height());
		$(self.parent.document.getElementById("splash")).children().height($("#nav").height()).width($("#nav").width());
	}
		
 //-->
  </SCRIPT>
            <!-- 焦点图切换结束-->
        </div>
      </div>
      <div class="zaixian" style="margin-top:269px;">
        <div class="title_top">
          <div class="title">社区资讯</div>
          <a href="${pageContext.request.contextPath}/new.do?p=see"><img src="user/images/more2.gif" border="0"></a>
          <div class="clear"></div>
        </div>
        <div class="zaixian_nr">
          <ul>
          
	          <c:forEach items="${news}" var="news">
	          <li><a href="${pageContext.request.contextPath}/new.do?p=findone&nid=${news.NId}">${news.NTitle}</a></li>
	          </c:forEach>
          
          </ul>
        </div>
      </div>
      <div class="jianjie" style="margin-top:269px;">
        <div class="title_top">
          <div class="title">社区简介</div>
          <a href="user/shequxiangqing.jsp"><img src="user/images/more2.gif" border="0"></a>
          <div class="clear"></div>
        </div>
        <div class="jianjie_nr">
          <div class="xuxian_bottom" style="padding:16px 0;"> <img src="user/images/tu_1.jpg"><span>&nbsp;&nbsp;小区内部环境典雅幽静，周边配套设施完备。社区风气良好，邻里关系和谐。周围商圈多，购物，就医，娱乐等方便快捷。</span>
            <div class="clear"></div>
          </div>
          <div style=" margin-top:6px;">&nbsp;&nbsp;小区为一个集生态环境、人文环境、信息化和管理控制自动化等优质服务为一体的高档个性化住宅小区。环境优美，丽水成天的风景给予了回归家庭、回归私域的生活体验。 </div>
        </div>
      </div>
      <div class="clear"></div>
    </div>
    <div class="right">
      <div class="yewulingyu"><span style="float:left;">缴费业务</span><a href="user/jiaofeione.jsp" style=" float:right; margin-top:4px;"><img src="user/images/more1.gif" width="28" height="13" border="0"></a></div>
      <div class="clear"></div>
      <div class="lingyu_nr">
        <ul>
          <a href="${pageContext.request.contextPath}/acut.do?p=jf&id=1000000209"><li>缴水费</li></a>
          <a href="${pageContext.request.contextPath}/acut.do?p=jf&id=1000000210"><li>缴电费</li></a>
          <a href="${pageContext.request.contextPath}/acut.do?p=jf&id=1000000211"><li>缴燃气费</li></a>
          <a href="${pageContext.request.contextPath}/acut.do?p=jf&id=1000000207"><li>缴宽带固话费</li></a>
          <a href="${pageContext.request.contextPath}/acut.do?p=jf&id=1000000208"><li>缴收视费</li></a>
        </ul>
      </div>
      <div class="tu_1"><img src="user/images/tu_1.gif" border="0"> </div>
      <div class="youqing">
        <div class="youqinglianjie">友情链接</div>
        <div class="youqinglianjie_2">
          <select name="select" class="search" onchange="connect(this)">
            <option value="#" selected="selected">-------------友情链接------------</option>
            <option value="http://zhuzhou.fang.com">株洲搜房</option>
            <option value="https://www.tmall.com">天猫商城</option>
            <option value="http://www.baidu.com">百度一下</option>
          </select>
        </div>
        <div class=" clear"></div>
      </div>
      <div class="clear"></div>
      <div class="tu_1"><img src="user/images/tu_2.gif" width="295" height="51" border="0"></div>
      <div class="dongtai">
        <div class="dongtai_top_left">新闻动态</div>
        <div class="dongtai_top_right"><a href="http://www.47365.com/category/100002.html"><img src="user/images/more2.gif" border="0"></a></div>
        <div class="clear"></div>
        <div class="dongtai_nr"> 
          <a href="http://www.47365.com/content/78855cf04d8d712c.html">社区开展“勤俭节约变废为宝”科普宣传活动</a><br>
          <a href="http://www.47365.com/content/7445524caa90e440.html">深入社区摸底细 整合志愿人才库</a><br>
          <a href="http://www.47365.com/content/79555efa7859e5d0.html">社区开展 “全民健康 和谐生活”知识讲座</a><br>
          <a href="http://www.47365.com/content/7375502976dea315.html">社区践行党的群众路线，组织党员开展学习研讨</a></div>
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

