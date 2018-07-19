<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
	<HEAD>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<LINK href="css/admin.css" type="text/css" rel="stylesheet">
	
	<SCRIPT language=javascript>
		function expand(el)
		{
			childObj = document.getElementById("child" + el);
	
			if (childObj.style.display == 'none')
			{
				childObj.style.display = 'block';
			}
			else
			{
				childObj.style.display = 'none';
			}
			return;
		}
	</SCRIPT>
	
	</HEAD>
<BODY>
	<TABLE height="100%" cellSpacing=0 cellPadding=0 width=170 background=images/menu_bg.jpg border=0>
  		<TR><TD vAlign=top align="center">
  		
      		<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        		<TR><TD height=10></TD></TR>
        	</TABLE>
        	
      		<TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        		<TR height=22>
        			<TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg>
        			<A class=menuParent onclick=expand(1) href="javascript:void(0);">查询用户信息</A>
        			</TD>
        		</TR>
        		<TR height=4>
          			<TD></TD>
          		</TR>
          	</TABLE>
          	
      		<TABLE id=child1 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        		<TR height=20><TD align="center" width=30><IMG height=9 src="images/menu_icon.gif" width=9></TD>
          			<TD>
          			<A class=menuChild href="${pageContext.request.contextPath }/user.do?p=findall" target=main>姓名检索</A>
          			</TD>
          		</TR>
        		<TR height=20><TD align="center" width=30><IMG height=9 src="images/menu_icon.gif" width=9></TD>
          			<TD>
          			<A class=menuChild href="${pageContext.request.contextPath }/user.do?p=findall" target=main>地址检索</A>
          			</TD>
          		</TR>
        		<TR height=20><TD align="center" width=30><IMG height=9 src="images/menu_icon.gif" width=9></TD>
          			<TD>
          			<A class=menuChild href="${pageContext.request.contextPath }/user.do?p=findall" target=main>所有用户</A>
          			</TD>
          		</TR>
        		<TR height=4><TD colSpan=2></TD></TR>
        	</TABLE>
        	
      		<TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
       	 		<TR height=22>
       	 			<TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg>
       	 			<A class=menuParent onclick=expand(2) href="javascript:void(0);">编辑用户信息</A>
       	 			</TD>
       	 		</TR>
        		<TR height=4><TD></TD></TR>
        	</TABLE>
        	
      		<TABLE id=child2 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        		<TR height=20>
          			<TD align="center" width=30><IMG height=9 src="images/menu_icon.gif" width=9></TD>
          			<TD>
          			<A class=menuChild href="register.jsp" target=main>添加用户</A>
          			</TD>
          		</TR>
        		<TR height=20>
          			<TD align="center" width=30><IMG height=9 src="images/menu_icon.gif" width=9></TD>
          			<TD>
          			<A class=menuChild href="${pageContext.request.contextPath }/user.do?p=findall" target=main>删除用户</A>
          			</TD>
          		</TR>
        		<TR height=4>
          			<TD colSpan=2></TD>
          		</TR>
          	</TABLE>
        	
        	<TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
       	 		<TR height=22>
       	 			<TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg>
       	 			<A class=menuParent onclick=expand(4) href="javascript:void(0);">编辑兴趣活动</A>
       	 			</TD>
       	 		</TR>
        		<TR height=4><TD></TD></TR>
        	</TABLE>
        	
        	<TABLE id=child4 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        		<TR height=20><TD align="center" width=30><IMG height=9 src="images/menu_icon.gif" width=9></TD>
          			<TD>
          			<A class=menuChild href="${pageContext.request.contextPath }/hobby.do?p=addac" target=main>添加活动</A>
          			</TD>
          		</TR>
        		<TR height=20><TD align="center" width=30><IMG height=9 src="images/menu_icon.gif" width=9></TD>
          			<TD>
          			<A class=menuChild href="${pageContext.request.contextPath }/hobby.do?p=findallho" target=main>删除活动</A>
          			</TD>
          		</TR>
        		<TR height=20><TD align="center" width=30><IMG height=9 src="images/menu_icon.gif" width=9></TD>
          			<TD>
          			<A class=menuChild href="${pageContext.request.contextPath }/hobby.do?p=findallho" target=main>修改活动</A>
          			</TD>
          		</TR>
        		<TR height=4><TD colSpan=2></TD></TR>
        	</TABLE>
        	
        	<TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
       	 		<TR height=22>
       	 			<TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg>
       	 			<A class=menuParent onclick=expand(5) href="javascript:void(0);">编辑社区资讯</A>
       	 			</TD>
       	 		</TR>
        		<TR height=4><TD></TD></TR>
        	</TABLE>
        	
        	<TABLE id=child5 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        		<TR height=20><TD align="center" width=30><IMG height=9 src="images/menu_icon.gif" width=9></TD>
          			<TD>
          			<A class=menuChild href="addnew.jsp" target=main>添加资讯</A>
          			</TD>
          		</TR>
        		<TR height=20><TD align="center" width=30><IMG height=9 src="images/menu_icon.gif" width=9></TD>
          			<TD>
          			<A class=menuChild href="${pageContext.request.contextPath }/new.do?p=findallnew" target=main>删除资讯</A>
          			</TD>
          		</TR>
        		<TR height=20><TD align="center" width=30><IMG height=9 src="images/menu_icon.gif" width=9></TD>
          			<TD>
          			<A class=menuChild href="${pageContext.request.contextPath }/new.do?p=findallnew" target=main>修改资讯</A>
          			</TD>
          		</TR>
        		<TR height=4><TD colSpan=2></TD></TR>
        	</TABLE>
        	
        	<TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
       	 		<TR height=22>
       	 			<TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg>
       	 			<A class=menuParent onclick=expand(3) href="javascript:void(0);">回复居民咨询</A>
       	 			</TD>
       	 		</TR>
        		<TR height=4><TD></TD></TR>
        	</TABLE>
        	
        	<TABLE id=child3 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        		<TR height=20><TD align="center" width=30><IMG height=9 src="images/menu_icon.gif" width=9></TD>
          			<TD>
          			<A class=menuChild href="${pageContext.request.contextPath }/ask.do?p=findallliuyan" target=main>查询留言</A>
          			</TD>
          		</TR>
        		<TR height=20><TD align="center" width=30><IMG height=9 src="images/menu_icon.gif" width=9></TD>
          			<TD>
          			<A class=menuChild href="${pageContext.request.contextPath }/ask.do?p=replyliuyan" target=main>回复留言</A>
          			</TD>
          		</TR>
        		<TR height=4><TD colSpan=2></TD></TR>
        	</TABLE>
          	
          </TD>
    	  <TD width=1 bgColor=#d1e6f7></TD>
		</TR>
	</TABLE>
</BODY>
</HTML>
