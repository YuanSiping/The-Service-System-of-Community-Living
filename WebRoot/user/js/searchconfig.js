function showCityBillOrg(cityCode){
	if(cityCode != "" && cityCode != null){
		$("#cityCodeHid").val(cityCode);
	}else{
		$("#cityCodeHid").val("021");
	}
	//查询产品
	$.ajax({
		type:'post',
		url: ICONSTANTS.ctx + '/bill/ajax/getProduct',
		data:{
			cityCode:$("#cityCodeHid").val()
		},
		success:function(data){
			if(data.code == '1000'){
				var billProduct = $("#billProduct");
				billProduct.empty();
				var htm=[];
				htm.push('<div class="left">账单类型：</div>');
				var productId = $("#productIdHid").val();
				var defaultProductId= data.products[0].productId;
				$.each(data.products,function(index,row){
					if(productId==row.productId){
						defaultProductId =productId;
					}
					htm.push('<div class="type_one mar-r-40" id="type'+row.productId+'" onclick="chargeCityBillOrg(\''+row.productId+'\')">');
					htm.push('<div class="type_pic type_pic'+row.sort+'"></div>');
					htm.push('<div class="type_name">'+row.productName+'</div>');
					htm.push('</div>');
				});
				billProduct.append(htm.join(''));
				chargeCityBillOrg(defaultProductId);
			}
		}
  }); 
}
//内部方法 更换产品显示样式和级联出账机构
function chargeCityBillOrg(productId){
	//更改产品显示样式
	$(".type_one").removeClass("cur_type");
	var id = "#type"+productId;
	$(id).addClass("cur_type");
	$("#productIdHid").val(productId);
	$(".s_nav li").removeClass("cur_nav");
	$(".s_nav li.p"+productId).addClass("cur_nav");
 	
  	$.post("../acut.do?p=getcompanybyid" , {x:Math.random(),'productId':productId} , function(data){
  		$("#cop").val(data);
  		$("#ahref").attr("href","../acut.do?p=jf&id="+productId);
  	});
}

function chargeDisplayType(){
	var select = $("#orgSelect");
	$("#billOrgIdHid").val(select.val());
	$("#billOrgNameHid").val(select.find("option:selected").text());
	
	$.ajax({
		type:'post',
		url: ICONSTANTS.ctx +'/bill/ajax/getDisplayType',
		data:{
			billOrgId:select.val(),
			productId:$("#productIdHid").val()
		},
		success:function(data){
			if(data.code == '1000'){
				var displayTypeDiv = $("#displayTypeDiv");
				displayTypeDiv.empty();
				var htm=[];
				$.each(data.displayTypes,function(index,row){
					htm.push('<label>');
					if(dDisplayType){
						if(dDisplayType == row.displayType){
							htm.push('<input name="r1" type="radio" id="'+row.billNoType+'" value="'+row.displayType+'" onclick="fillSearchDiv()" checked="checked"/>');
						}else{
							htm.push('<input name="r1" type="radio" id="'+row.billNoType+'" value="'+row.displayType+'" onclick="fillSearchDiv()"/>');
						}
					}else{
						if(index == 0){
							htm.push('<input name="r1" type="radio" id="'+row.billNoType+'" value="'+row.displayType+'" onclick="fillSearchDiv()" checked="checked"/>');
						}else{
							htm.push('<input name="r1" type="radio" id="'+row.billNoType+'" value="'+row.displayType+'" onclick="fillSearchDiv()"/>');
						}
					}
					htm.push(row.itemName);
					htm.push('</label>');
				});
				//清除默认值
				dDisplayType = null;
				displayTypeDiv.append(htm.join(''));
				fillSearchDiv();
			}
	 	}
   }); 
}

function fillSearchDiv(){
	
	var searchDiv = $("#searchDiv");
	searchDiv.empty();
	//切换隐藏验证码
	hiddenVerify();
	
	$(".bill_detail").css("display","none");
	$("#bill_detail1").empty();
	$("#billNoTypeHid").val($('input:radio:checked').attr("id"));
	
	var displayType = $('input:radio:checked').val();
	var billOrgId = $("#orgSelect").val();
	var productId = $("#productIdHid").val();
	var cityCode = $("#cityCodeHid").val();
	$.ajax({
		type:'post',
		url: ICONSTANTS.ctx +'/bill/ajax/getSearchConf',
		data:{
			billOrgId:billOrgId,
			productId:productId,
			displayType:displayType,
			cityCode:cityCode
		},
		success:function(data){
			searchDiv.empty();
			if(data.code == '1000'){
				var htm=[];
				htm.push(data.content);
				searchDiv.append(htm.join(''));
				if(dLastYear){
					$("#lastYear").val(dLastYear);
				}
				if(dLastMonth){
					$("#lastMonth").val(dLastMonth);
				}
				if(dNowYear){
					$("#nowYear").val(dNowYear);
				}
				if(dNowMonth){
					$("#nowMonth").val(dNowMonth);
				}
				if(dBillNo){
					$("#billNo").val(dBillNo);
					doQueryBill();
				}
				//清除默认值
				dLastYear = null;
				dLastMonth = null;
				dNowYear = null;
				dNowMonth = null;
				dBillNo = null;
				$("input,select").focus(function(){
					$(this).css('border-color','#008dda');
				});
				$("input,select").blur(function(){
					$(this).css('border-color','#d6d6d6');
				});
				var srcJpg = ICONSTANTS.resourcePath+"/static/images/chapter/"+productId+"/"+billOrgId+"_"+displayType
				$("#smallImg").attr('src',srcJpg+"_s.jpg");
				
				$("#descriptionInfo").html("");
				if(cityCode == "021"){
					//特殊文字显示
					var description = "可支付逾期账单，建议不超过1个月<br />提醒：已代扣或其它渠道支付请勿重复付费<br />客服热线：962233<br />";
					for ( var i = 0; i < billOrgChapter.length; i++) {
						if(billOrgChapter[i].billOrgId == billOrgId){
							var str = "<span style=\"color: red;\">" + billOrgChapter[i].description + "</span>";
							description = description + str;
							break;
						}
					}
					$("#descriptionInfo").html(description);
				}else{
					var description = "客服热线：962233<br />";
					$("#descriptionInfo").html(description);
				}
				//显示验证码
				showVerify();
			}
	 	}
   }); 
}

function hiddenVerify(){
	$("#imgShowAuto").hide();
	$("#imgShowAuto_qie").hide();
	$("#verify").val("");
}

function showVerify(){
	$("#verify").bind("focus",function(){
	    $("#imgShowAuto").show();
	    $("#imgShowAuto_qie").show();
	    changeHouseValidateImg('verifyCodeImg');
	    $("#verify").unbind("focus");
	});
}

function clearSearchDiv(){
	$("#bill_detail1").empty();
	$("#billNo").val("");
	$("#barcode").val("");
	$("#billAmt").val("");
	$("#verify").val("");
	$("#payPwd").val("");
	$("#verifyCodeImg").click();
	
	$(".bill_detail").slideUp(400);
	var t = $(window).scrollTop();
	$('html,body').animate({'scrollTop':t-400},600);	
}

function changeHouseValidateImg(validateId) {
    var currentTime = new Date().getTime();
    $("#" + validateId).attr("src", ICONSTANTS.ctx +"/verify/ajax/getverifyCodeImg" + "?d=" + currentTime);
}

function showPaymentCar(){
	var paymentCarCount = $("#paymentCarCount").val();
	if(paymentCarCount != null && paymentCarCount != ""){
		$(".buy_cart").css("display","block");
	}
}

function setUserBill(){
	$(".cf_dw").click(function(){	
		$(this).toggleClass("cur_cf");
		$(".cf_bill_no").toggle();
		$('body').click(function(){
	        $(".cf_bill_no").hide();				
			$(".cf_dw").removeClass("cur_cf");
		});
		$.ajax({
			type:'post',
			url: ICONSTANTS.ctx +'/bill/ajax/getUserBill',
			data:{
				displayType:$('input:radio:checked').val(),
				billOrgId:$("#billOrgIdHid").val()
			},
			success:function(data){
				if(data.code == '1000'){
					var _cf_bill_no = $(".cf_bill_no");
					_cf_bill_no.empty();
					var htm=[];
					$.each(data.userBills,function(index,row){
						var billNo = row.billNo
						htm.push('<div class="bill_no_one clearfix" onclick="fillUserBill(\''+billNo+'\')">');
						if(row.billGroup != null){
							htm.push('<span class="left" >'+billNo+'</span><span class="right">'+row.billGroup+'</span>');
						}else{
							htm.push('<span class="left" >'+billNo+'</span><span class="right"></span>');
						}
						htm.push('</div>');
					});
					_cf_bill_no.append(htm.join(''));
				}
		 	}
		}); 
		return false;
	});
}

function fillUserBill(value){
	$("#billNo").val(value);
	$(".cf_bill_no").hide();
	$(".cf_dw").removeClass("cur_cf");	
}
