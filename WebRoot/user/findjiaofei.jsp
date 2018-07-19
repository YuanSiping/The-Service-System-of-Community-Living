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
<script type="text/javascript" src="${ pageContext.request.contextPath}/user/js/jquery-1[1].2.1.pack.js" ></script>
<script type="text/javascript" src="${ pageContext.request.contextPath}/user/js/jquery-1.9.1.min.js"></script>
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
        <div class="right_title"> <span style="float:left;"><strong>缴费记录</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
        	<div>
         		 <a href="javascript:getXlsFromTbl('tableExcel',null);" class="guangbi">导出至Excel表</a>
          	</div>
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
								<table id="tableExcel" class="hovertable" style="BORDER-COLLAPSE: collapse;text-align: center;" height=25 cellPadding=1 width=100% align="left" border=1 bgcolor="#9FB6CD">
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
    <div class="bottom_left"> <a href="user/lianxi.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系我们&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> |  <a href="http://www.cnblogs.com/5211314jackrose/">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;官方博客</a>  </div>
    <div class="bottom_right">&nbsp;&nbsp;&nbsp;&nbsp;地址：湖南省株洲市天元区珠江南路&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮政编码：412007&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;版权所有人：原思平</div>
  </div>
</div>
</body>
</html>

<SCRIPT> 
 function method1(tableid) {//整个表格拷贝到EXCEL中 
	 alert("!");
     var curTbl = document.getElementById(tableid); 
     var oXL = new ActiveXObject("Excel.Application"); 
     //创建AX对象excel 
     var oWB = oXL.Workbooks.Add(); 
     //获取workbook对象 
         var oSheet = oWB.ActiveSheet; 
     //激活当前sheet 
     var sel = document.body.createTextRange(); 
     sel.moveToElementText(curTbl); 
     //把表格中的内容移到TextRange中 
     sel.select(); 
     //全选TextRange中内容 
     sel.execCommand("Copy"); 
     //复制TextRange中内容  
     oSheet.Paste(); 
     //粘贴到活动的EXCEL中       
     oXL.Visible = true; 
     //设置excel可见属性
 } 
 function method2(tableid) //读取表格中每个单元到EXCEL中 
 { 
	 alert("!!");
     var curTbl = document.getElementById(tableid); 
     var oXL = new ActiveXObject("Excel.Application"); 
     //创建AX对象excel 
     var oWB = oXL.Workbooks.Add(); 
     //获取workbook对象 
     var oSheet = oWB.ActiveSheet; 
     //激活当前sheet 
     var Lenr = curTbl.rows.length; 
     //取得表格行数 
     for (i = 0; i < Lenr; i++) 
     { 
         var Lenc = curTbl.rows(i).cells.length; 
         //取得每行的列数 
         for (j = 0; j < Lenc; j++) 
         { 
             oSheet.Cells(i + 1, j + 1).value = curTbl.rows(i).cells(j).innerText; 
             //赋值 
         } 
     } 
     oXL.Visible = true; 
     //设置excel可见属性 
 } 
 
function getXlsFromTbl(inTblId, inWindow) { 
     try { 
         var allStr = ""; 
         var curStr = ""; 
         if (inTblId != null && inTblId != "" && inTblId != "null") { 
             curStr = getTblData(inTblId, inWindow); 
         } 
         if (curStr != null) { 
             allStr += curStr; 
        } 
        else { 
            alert("你要导出的表不存在！"); 
            return; 
        } 
        var fileName = getExcelFileName(); 
        doFileExport(fileName, allStr); 
    } 
    catch(e) { 
        alert("导出发生异常:" + e.name + "->" + e.description + "!"); 
    } 
} 
//获取网页表格数据
function getTblData(inTbl, inWindow) { 
    var rows = 0; 
    var tblDocument = document; 
    if (!!inWindow && inWindow != "") { 
        if (!document.all(inWindow)) { 
            return null; 
        } 
        else { 
            tblDocument = eval(inWindow).document; 
        } 
    } 
    var curTbl = tblDocument.getElementById(inTbl); 
    var outStr = ""; 
    if (curTbl != null) { 
        for (var j = 0; j < curTbl.rows.length; j++) {         
            for (var i = 0; i < curTbl.rows[j].cells.length; i++) { 
                if (i == 0 && rows > 0) { 
                    outStr += " \t"; 
                    rows -= 1; 
                } 
                outStr += curTbl.rows[j].cells[i].innerText + "\t"; 
                if (curTbl.rows[j].cells[i].colSpan > 1) { 
                    for (var k = 0; k < curTbl.rows[j].cells[i].colSpan - 1; k++) { 
                        outStr += " \t"; 
                    } 
                } 
                if (i == 0) { 
                    if (rows == 0 && curTbl.rows[j].cells[i].rowSpan > 1) { 
                        rows = curTbl.rows[j].cells[i].rowSpan - 1; 
                    } 
                } 
            } 
            outStr += "\r\n"; 
        } 
    } 
    else { 
        outStr = null; 
        alert(inTbl + "不存在!"); 
    } 
    return outStr; 
} 
//产生Excel文件名称
function getExcelFileName() { 
    var d = new Date(); 
    var curYear = d.getYear(); 
    var curMonth = "" + (d.getMonth() + 1); 
    var curDate = "" + d.getDate(); 
    var curHour = "" + d.getHours(); 
    var curMinute = "" + d.getMinutes(); 
    var curSecond = "" + d.getSeconds(); 
    if (curMonth.length == 1) { 
        curMonth = "0" + curMonth; 
    } 
    if (curDate.length == 1) { 
        curDate = "0" + curDate; 
    } 
    if (curHour.length == 1) { 
        curHour = "0" + curHour; 
    } 
    if (curMinute.length == 1) { 
        curMinute = "0" + curMinute; 
    } 
    if (curSecond.length == 1) { 
        curSecond = "0" + curSecond; 
    } 
    //定义缴费记录表名称
    var fileName = "缴费记录表" + "_" + curYear + curMonth + curDate + "_" 
            + curHour + curMinute + curSecond + ".xls"; 
    return fileName; 
} 
//将导出的Excel文件保存在本地
function doFileExport(inName, inStr) { 
    var xlsWin = null; 
    if (!!document.all("glbHideFrm")) { 
        xlsWin = glbHideFrm; 
    } 
    else { 
        var width = 200;
 		var height = 5;
        var openPara = "left=" + (window.screen.width / 2 - 200) 
                + ",top=" + (window.screen.height / 2 - 200) 
                + ",scrollbars=yes,width=" + width + ",height=" + height; 
        xlsWin = window.open("", "_blank", openPara); 
    } 
    xlsWin.document.write(inStr); 
    xlsWin.document.close(); 
    xlsWin.document.execCommand('Saveas', true, 'C:\\'+inName+''); 
    xlsWin.close(); 
  	alert("成功导出至“"+inName+"”！");
} 

var strSaveLocation = 'C:\1.xls'
 function createXLS() {
   var excel = new ActiveXObject("Excel.Application");
   var wk = excel.Workbooks.Add();
   wk.SaveAs(strSaveLocation);
   
   wk.Saved = true;

  excel.Quit();
 }

function writeXLS() {
   var excel = new ActiveXObject("Excel.Application");
   var wk = excel.Workbooks.Open(strSaveLocation);
   var sheet = wk.Worksheets(1);
   sheet.Cells(1, 1).Value = '测试字符串';
   wk.SaveAs(strSaveLocation);
   wk.Saved = true;

  excel.Quit();
 }

</SCRIPT> 