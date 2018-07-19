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
<script type="text/javascript" src="${ pageContext.request.contextPath}/user/js/jquery-1[1].2.1.pack.js" ></script>
<body>
<div class="juzhong">
  <div class="top">
    <div class="top_top"><span style="float:left; margin-left:14px;">欢迎访问社区生活服务系统！ 建站咨询热线: 18373337069</span><span style="float:right; margin-right:6px;">今天是：${time }</span>
      <div class="clear"></div>
    </div>
    <div class="logo_bg"><img src="images/logo.jpg" style="float:left; margin:18px 0 0 25px;"><img src="images/logo_bg2.gif" width="502" height="100"  style=" float:right;">
      <div class="clear"></div>
    </div>
    <div class="muen">
      <div class="subnav">
        <ul id="nuw">
        	<li class="one"><a href="#" style="background-image: none;"></a></li>
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
            <li id="border_top"><a href="#">社区详情</a></li>
            <li><a href="#">社区荣誉</a></li>
            <li><a href="#">缴费标准</a></li>
          </ul>
        </li>
        <li><a href="#">个人中心</a></li>
        <li id="bottom_none"><a href="#" onClick="DoMenu('ChildMenu2')">兴趣圈子</a>
          <ul id="ChildMenu2" class="collapsed">
            <li id="border_top"><a href="#">创建兴趣圈子</a></li>
            <li><a href="#">搜索兴趣圈子</a></li>
          </ul>
        </li>
        <li><a href="#">留言咨询</a></li>
        <li><A onclick="if (confirm('确定要退出吗？')) return true; else return false;" href="login.jsp">退出系统</A></li>
        <li><a href="javascript:window.close()">关闭窗口</a></li>
      </ul>
      <div class="clear"></div>
    </div>
    
    <div class="right_2">
      <div class="right_nr">
        <div class="right_title"> <span style="float:left;"><strong>请填写个人信息</strong></span>
          <div class="clear"></div>
        </div>
        <div class="zaixianfalv">
          <div style="padding-top:8px; color:#4c657e;">注意：带*项必须填写</div>
          
          
          <form action="${pageContext.request.contextPath}/user.do?p=register" method="post" >
          <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#cbcbcb" class="biaoge">
			<tr>
              <td height="35" bgcolor="#f8f8f8"><span>*</span> 昵称：</td>
              <td bgcolor="#f8f8f8">
                <label>
                <input type="text" name="nickname" onblur="checknickname()" id="nickname" style="border: solid 1px #ccc;"><span>(*表示必须填写)</span>
                </label>
              </td>
            </tr>
            <tr>
              <td height="35" bgcolor="#f8f8f8"><span>*</span> 姓名：</td>
              <td bgcolor="#f8f8f8">
                <label>
                <input type="text" name="username1" onblur="checkname()" id="username1" style="border: solid 1px #ccc;"><span>(*表示必须填写)</span>
                </label>
              </td>
            </tr>
            <tr>
              <td height="35" bgcolor="#f8f8f8"><span>*</span> 密码：</td>
              <td bgcolor="#f8f8f8">
                <input type="password" name="userpwd1" size="21" onblur="checkpwd()" id="userpwd1" style="border: solid 1px #ccc;"><span>(*表示必须填写)</span>
              </td>
            </tr>
            <tr>
              <td height="35" bgcolor="#f8f8f8"> 性别：</td>
              <td bgcolor="#f8f8f8">
                <label>
                <input type="radio" name="usersex1" id="usersex1" value="男" checked="checked">
               男 </label>
                <font style="margin:0 20px;">
                <input type="radio" name="usersex1" id="usersex1" value="女">
                女</font></td>
            </tr>
            <tr>
              <td height="35" bgcolor="#f8f8f8"> 银行卡号：</td>
              <td bgcolor="#f8f8f8">
                <input onblur="checkcard()" type="text" name="usercard1" id="usercard1" style="border: solid 1px #ccc;">
              </td>
            </tr>
            <tr>
              <td height="35" bgcolor="#f8f8f8"> 所住栋数：</td>
              <td bgcolor="#f8f8f8">
                <input type="text" name="userbulid1" id="userbulid1" style="border: solid 1px #ccc;">
              </td>
            </tr>
            <tr>
              <td height="35" bgcolor="#f8f8f8"> 所住单元：</td>
              <td bgcolor="#f8f8f8">
                <input type="text" name="userunit1" id="userunit1" style="border: solid 1px #ccc;">
              </td>
            </tr>
            <tr>
              <td height="35" bgcolor="#f8f8f8"> 所住楼号：</td>
              <td bgcolor="#f8f8f8">
                <input type="text" name="userfloor1" id="userfloor1" style="border: solid 1px #ccc;">
              </td>
            </tr>
            
          </table>
          <div>
            <div align="center" style="padding:15px 0;">
              <input name="提交" type="submit" value="注册" style="border: solid 1px #ccc; background:#fff; margin-right:10px;">
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
    <div class="bottom_left"> &nbsp;&nbsp;&nbsp;&nbsp;邮箱：1510159299@qq.com&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |  <a href="http://www.cnblogs.com/5211314jackrose/">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;官方博客</a>  </div>
    <div class="bottom_right">&nbsp;&nbsp;&nbsp;&nbsp;地址：湖南省株洲市天元区珠江南路&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮政编码：412007&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;版权所有人：原思平</div>
  </div>
</div>
</body>
</html>



<SCRIPT>
	function checkname(){
		var name = document.getElementById("username1").value;
		if(name.length==0){   
        	alert("抱歉，姓名不能为空!");    
        }
	}
	
	function checkpwd(){
		var pwd = document.getElementById("userpwd1").value;
		if(pwd.length==0||name==" "){   
        	alert("抱歉，密码不能为空或者为空格!");    
        }
	}
	
	function checknickname(){
		var name = document.getElementById("nickname").value;
		$.post("../user.do?p=checknickname",{"nickname": name , X:Math.random()} ,function(data){
			if(data=='true'){
				alert("抱歉，该昵称已被注册！");
			}else{
				
			}
			
		});
	}
	
	function checkcard(){
		var card = document.getElementById("usercard1").value;
		//alert(card);
		var result = card.match(/^(\d{16}|\d{19})$/);
		if(result==null) alert("银行卡号输入错误！");
	}
	
	
	
</SCRIPT>  
