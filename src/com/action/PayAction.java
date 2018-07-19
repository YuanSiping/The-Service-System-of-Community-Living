package com.action;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.service.AccountService;
import com.util.PaymentUtil;

@Controller
@RequestMapping("/pay.do")
public class PayAction {

	@RequestMapping(params="p=paybyimg")
	public void paybyimg(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print("<script >alert('缴费成功');location='user/jiaofeicg.jsp'</script>");
	}
	
	@RequestMapping(params="p=payment")
	public void payment(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		Properties props = new Properties();
		try {
		
			props.load(this.getClass().getClassLoader().getResourceAsStream("payment.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//准备13个参数
		
		String order1 = request.getParameter("order");
		
		String p0_Cmd = "Buy";//业务类型，固定值Buy
		String p1_MerId = props.getProperty("p1_MerId");//商号编码，在易宝的唯一标识
		String p2_Order = new String(order1.getBytes("iso-8859-1"),"utf-8");//订单编码
		System.out.println(p2_Order);
		String p3_Amt = "0.01";//支付金额
		String p4_Cur = "CNY";//交易币种，固定值CNY
		String p5_Pid = "";//商品名称
		String p6_Pcat = "";//商品种类
		String p7_Pdesc = "";//商品描述
		String p8_Url = props.getProperty("p8_Url");//在支付成功后，易宝会访问这个地址。
		String p9_SAF = "";//送货地址
		String pa_MP = "";//扩展信息
		String pd_FrpId = request.getParameter("yh");//支付通道
		String pr_NeedResponse = "1";//应答机制，固定值1
		
		
		//计算hmac
		String keyValue = props.getProperty("keyValue");
		String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt,
				p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP,
				pd_FrpId, pr_NeedResponse, keyValue);
		
		
		//重定向到易宝的网关
		StringBuilder sb = new StringBuilder("https://www.yeepay.com/app-merchant-proxy/node");
		sb.append("?").append("p0_Cmd=").append(p0_Cmd);
		sb.append("&").append("p1_MerId=").append(p1_MerId);
		sb.append("&").append("p2_Order=").append(p2_Order);
		sb.append("&").append("p3_Amt=").append(p3_Amt);
		sb.append("&").append("p4_Cur=").append(p4_Cur);
		sb.append("&").append("p5_Pid=").append(p5_Pid);
		sb.append("&").append("p6_Pcat=").append(p6_Pcat);
		sb.append("&").append("p7_Pdesc=").append(p7_Pdesc);
		sb.append("&").append("p8_Url=").append(p8_Url);
		sb.append("&").append("p9_SAF=").append(p9_SAF);
		sb.append("&").append("pa_MP=").append(pa_MP);
		sb.append("&").append("pd_FrpId=").append(pd_FrpId);
		sb.append("&").append("pr_NeedResponse=").append(pr_NeedResponse);
		sb.append("&").append("hmac=").append(hmac);
		
		try {
			response.sendRedirect(sb.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(params="p=back")
	public void back(HttpServletRequest request,HttpServletResponse response){
		System.out.println("laile");
		//获取12个参数
	    String p1_MerId = request.getParameter("p1_MerId");
		String r0_Cmd = request.getParameter("r0_Cmd");
		String r1_Code = request.getParameter("r1_Code");
		String r2_TrxId = request.getParameter("r2_TrxId");
		String r3_Amt = request.getParameter("r3_Amt");
		String r4_Cur = request.getParameter("r4_Cur");
		String r5_Pid = request.getParameter("r5_Pid");
		String r6_Order = request.getParameter("r6_Order");
		String r7_Uid = request.getParameter("r7_Uid");
		String r8_MP = request.getParameter("r8_MP");
		String r9_BType =request.getParameter("r9_BType");
		String hmac = request.getParameter("hmac");
		
	    //获取keyvalue
		Properties props = new Properties();
		try {
			props.load(this.getClass().getClassLoader().getResourceAsStream("payment.properties"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String keyValue = props.getProperty("keyValue");
		boolean bool = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd, r1_Code, r2_TrxId,
				r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid, r8_MP, r9_BType,
				keyValue);
		if(!bool) {
			request.setAttribute("code", "error");
			request.setAttribute("msg", "无效的签名，支付失败！（你不是好人）");
			//return "f:/jsps/msg.jsp";  这里是到支付失败页面
		}
		if(r1_Code.equals("1")) {
			//更新订单状态
			//sint n = orderdao.changstatus(2, r6_Order);
		
			if(r9_BType.equals("1")) {
						try {
							request.getRequestDispatcher("paysucc.jsp").forward(request, response);
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					
				 	 //这里是到支付成功页面			
			} else if(r9_BType.equals("2")) {
				try {
					//response.getWriter().print("success");
					response.getWriter().print("<script >alert('缴费成功');location='user/jiaofeicg.jsp'</script>"); 
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
					
		}
		}
  }
}
