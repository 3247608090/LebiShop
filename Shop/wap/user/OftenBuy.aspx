﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.P_UserOftenBuy" validateRequest="false"%>


<%@ Import Namespace="Shop.Bussiness" %>
<%@ Import Namespace="Shop.Model" %>
<%@ Import Namespace="System.Collections.Generic" %>
<% LoadPage("ljq@lebi.cn_43",8,"CN","P_UserOftenBuy"); %>

<!DOCTYPE html PUBliC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><%=ThemePageMeta("P_UserOftenBuy","title")%></title>
<meta name="keywords" content="<%=ThemePageMeta("P_UserOftenBuy","keywords")%>" />
<meta name="description" content="<%=ThemePageMeta("P_UserOftenBuy","description")%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="utf-8" />
<meta name="format-detection" content="telephone=no" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="twcClient" content="false" id="twcClient" />
<meta name="revisit-after" content="1 days" />
<meta name="CurrenctCurrency" content="<%=CurrentCurrency.Code %>" />
<meta name="CurrentExchangeRate" content="<%=CurrentCurrency.ExchangeRate %>" />
<meta name="CurrentLanguage" content="<%=CurrentLanguage.Code %>" />
<meta name="generator" content="LebiShop V<%=SYS.Version+"."+SYS.Version_Son %>" />
<meta name="copyright" content="2003-<%=DateTime.Now.Year %> lebi.cn" />
<script type="text/javascript">var path = "<%=WebPath %>";var sitepath = "/";var langpath = "/";</script>
<script src="http://192.168.1.188/Theme/system/wap/js/jquery.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="http://192.168.1.188/Theme/system/wap/css/system.css" />
<script src="<%=WebPath %>/ajax/js.aspx" type="text/javascript"></script>
<script src="http://192.168.1.188/Theme/system/wap/js/main.js" type="text/javascript"></script>
<script src="http://192.168.1.188/Theme/system/wap/js/messagebox.js" type="text/javascript"></script>
<script src="http://192.168.1.188/Theme/system/wap/js/my97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script src="http://192.168.1.188/Theme/system/wap/js/jquery-ui.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="http://192.168.1.188/Theme/system/wap/js/jqueryuicss/redmond/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="http://192.168.1.188/theme/wap/css/css.css" />
<link rel="stylesheet" type="text/css" href="http://192.168.1.188/theme/wap/css/<%=CurrentLanguage.Code %>.css" />

</head>
<body class="default">
    
<div id="header" class="clearfix">
    <div class="logo">

<a href="/"><img src="<%=Image(Lang(SYS.Logoimg)) %>" alt="<%=Lang(SYS.Name)%>" title="<%=Lang(SYS.Name)%>" /></a>
</div>
    <ul class="toplink">
		<li><a href="#search" class="btnSearch"></a></li>
        
        <li><a href="<%=URL("P_Basket", "")%>" class="btnCart"><em id="cart_items"><%=Basket_Product_Count() %></em></a></li>
    </ul>
</div>
<div class="mhead clearfix">
	<a href="javascript:history.go(-1);" class="a-back"><span>返回</span></a>
	<h2><%=ThemePageMeta("P_UserOftenBuy","title")%></h2>
	<a href="<%=URL("P_AllProductCategories","")%>" class="a-cate"><span>商品分类</span></a>
</div>

    <div class="body">
        <div class="bodymain">
            
    

<div class="nbbox clearfix">
<div class="user">
    <div class="searchbox clearfix">
        <input type="text" id="key" name="key" class="input-query" value="<%=key %>" onkeydown="if(event.keyCode==13){search_();}" />
        <a href="javascript:void(0)" onclick="search_();" class="btn btn-12"><s></s>查询</a>
    </div>
    <div class="table-list">
        <%foreach (Shop.Model.Lebi_User_Product u_p in user_products)
        {Shop.Model.Lebi_Product product=GetProduct(u_p.Product_id);
        %>
        <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <th style="width:50px" valign="top" rowspan="3"><% if (product.ImageSmall == ""){ %>&nbsp;<%}else{ %><a href="<%=URL("P_Product",u_p.Product_id) %>"><img style="height: 50px;width: 50px;vertical-align:middle" src="<%=Image(product.ImageSmall) %>" /></a><%} %></th>
            <th style="text-align:left" valign="top">
            <input type="checkbox" name="id" value="<%=u_p.id %>" sel="true" /><input type="hidden" name="Uid" value="<%=u_p.id %>" shop="true" />
            <a href="<%=URL("P_Product",u_p.Product_id) %>"><%=Lang(product.Name)%></a>
            </th>
            <th style="width:60px" valign="top"><%=FormatMoney(product.Price) %></th>
        </tr>
        <tr>
            <td colspan="2">购买周期：<input name="WarnDays<%=u_p.id %>" id="Text1" type="text" value="<%=u_p.WarnDays %>" onkeyup="value=value.replace(/[^\d]/g,'');" shop="true" size="3" maxlength="5" class="input" /> 天&nbsp;&nbsp;数量：<input name="Count<%=u_p.id %>" id="Text2" type="text" value="<%=u_p.count %>" onkeyup="value=value.replace(/[^\d]/g,'');" shop="true" size="3" maxlength="5" class="input" /></td>
        </tr>
        <tr>
            <td colspan="2">预购时间：<%=FormatDate(u_p.Time_Add)%></td>
        </tr>
        </table>
        <%} %>
    </div>
    <div class="bottom clearfix"><div class="left"><a href="javascript:void(0);" onclick="$('input[name=\'id\']').attr('checked',!$(this).attr('checked'));$(this).attr('checked',!$(this).attr('checked'));" class="selectAll">全选</a>&nbsp;&nbsp;<a href="javascript:void(0)" onclick="Delete();" class="btn btn-11"><s></s>删除</a><a href="javascript:void(0)" onclick="Update();" class="btn btn-11"><s></s>保存</a><a href="javascript:void(0)" onclick="LikeToBasket();" class="btn btn-7"><s></s>加入购物车</a></div></div>
    <div class="bottom clearfix"><div class="right"><%=PageString%></div></div>
</div>
</div>
<script type="text/javascript" >
    function search_() {
        var key = $("#key").val();
        window.location = "?key=" + escape(key);
    }
    function Delete() {
        if (!confirm("确认要删除吗？"))
            return false;
        var postData = GetFormJsonData("sel");
        var url = path+"/Ajax/Ajax_userin.aspx?__Action=UserOftenBuy_Del";
        RequestAjax(url, postData, function () { MsgBox(1, "操作成功", "?") });
    }
    function Update() {
        var postData = GetFormJsonData("shop");
        var url = path+"/Ajax/Ajax_userin.aspx?__Action=UserOftenBuy_Update";
        RequestAjax(url,postData,function(){MsgBox(1, "操作成功", "?")});
    }
</script>


        </div>
      

<div class="mbox clearfix">
    <div class="mt">
        <h2>控制面板</h2>
    </div>
    <div class="mc usermenu clearfix">
        <ul>
            <li><a href="<%=URL("P_UserOrders","")%>"><span>我的订单</span></a></li>
            <%if(SYS.IsClosetuihuo=="0"){ %>
            <li><a href="<%=URL("P_UserReturn","")%>"><span>退货订单</span></a></li>
            <%} %>
            <li><a href="<%=URL("P_UserCard","")%>"><span>我的卡券</span></a></li>
            <li><a href="<%=URL("P_UserPoint","")%>"><span>积分记录</span></a></li>
            <li><a href="<%=URL("P_UserMoney","")%>"><span>资金记录</span></a></li>
            <li><a href="<%=URL("P_UserProfile","")%>"><span>资料管理</span></a></li>
            <li><a href="<%=URL("P_UserAccount","")%>"><span>绑定帐号</span></a></li>
            <li><a href="<%=URL("P_UserChangePassword","")%>"><span>修改密码</span></a></li>
            <li><a href="<%=URL("P_UserQuestion","")%>"><span>安全问题</span></a></li>
            <li><a href="<%=URL("P_UserAddress","")%>"><span>收货地址</span></a></li>
            <li><a href="<%=URL("P_UserBank","")%>"><span>收款账号</span></a></li>
            <li><a href="javascript:LoginOut();"><span>登录注销</span></a></li>
        </ul>
    </div>
</div>
<div class="mbox clearfix">
    <div class="mt">
        <h2>商品关注</h2>
    </div>
    <div class="mc usermenu clearfix">
        <ul>
            <li><a href="<%=URL("P_UserLike","")%>"><span>我的收藏</span></a></li>
            <li><a href="<%=URL("P_UserOftenBuy","")%>"><span>常购清单</span></a></li>
            <li><a href="<%=URL("P_UserComment","")%>"><span>商品评价<em>(<%=Count_Comment(0) %>)</em></span></a></li>
            <li><a href="<%=URL("P_UserAsk","")%>"><span>商品咨询<em>(<%=Count_ProductAsk(0) %>)</em></span></a></li>
        </ul>
    </div>
</div>
<div class="mbox clearfix">
    <div class="mt">
        <h2>站内信</h2>
    </div>
    <div class="mc usermenu clearfix">
        <ul>
            <li><a href="<%=URL("P_UserMessage","0")%>"><span>收件箱<em>(<%=Count_Message(0) %>)</em></span></a></li>
            <li><a href="<%=URL("P_UserMessage","1")%>"><span>发件箱</span></a></li>
            <li><a href="<%=URL("P_UserMessageWrite","")%>"><span>发信息</span></a></li>
        </ul>
    </div>
</div>
<%if (Shop.Bussiness.B_API.Check("plugin_agent")){ %>
<div class="mbox clearfix">
    <div class="mt">
        <h2>推广佣金</h2>
    </div>
    <div class="mc usermenu clearfix">
        <ul>
            <li><a href="<%=URL("P_UserAgent","")%>"><span>基本信息<em></em></span></a></li>
            <li><a href="<%=URL("P_UserAgentMoney","")%>"><span>佣金查询</span></a></li>
        </ul>
    </div>
</div>
<%} %>

    </div>
  
<div id="footer" class="clearfix">
    <div class="copyright">
        <%=Lang(SYS.Copyright) %>
    </div>
    <div class="lang">
        

<div class="language">
<%List<Shop.Model.Lebi_Language> xLiMs=Languages();RecordCount=xLiMs.Count;int xLiM_index=1;
foreach (Shop.Model.Lebi_Language xLiM in xLiMs){%>
<a <%if (xLiM_index==RecordCount){%>class="last"<%} %> href="javascript:SetLanguage(<%=xLiM.id%>,'<%=xLiM.Code%>','<%=xLiM.Path%>');"><img src="<%=Image(xLiM.ImageUrl) %>" title="<%=xLiM.Name%>" /><%=xLiM.Name%></a>
<%xLiM_index++;}%>
</div>

    </div>
    <div class="currency">
        

<div class="currency"><ul class="dropcurrency"><li class="currency_li"><a class="noclick"><span>币种：</span><s><%=CurrentCurrency.Code %></s></a><dl class="currency_li_content">
<%Table="Lebi_Currency";Where="";Order="Sort desc";PageSize=20;pageindex=Rint("page");RecordCount=B_Lebi_Currency.Counts(Where);int WxzJ_index=1;
List<Lebi_Currency> WxzJs = B_Lebi_Currency.GetList(Where, Order,PageSize ,pageindex);foreach (Lebi_Currency WxzJ in WxzJs){%>
<dd <%if (WxzJ_index==RecordCount){%>class="last"<%} %>><a href="javascript:SetCurrency(<%=WxzJ.id%>,'<%=WxzJ.Code%>',<%=WxzJ.ExchangeRate%>,'<%=WxzJ.Msige%>');"><%=WxzJ.Code%></a></dd>
<%WxzJ_index++;}%>
</dl></li></ul></div>

    </div>
    
<div id="footnav">
<ul>
<li><a href="<%=URL("P_Index", "")%>"><img src="http://192.168.1.188/Theme/system/wap/images/home.png" alt="首页" /><span>首页</span></a></li>
<li><a href="<%=URL("P_ProductCommentIndex", "")%>"><img src="http://192.168.1.188/Theme/system/wap/images/message.png" alt="晒单" /><span>晒单</span></a></li>
<li><a href="<%=URL("P_Basket", "")%>"><img src="http://192.168.1.188/Theme/system/wap/images/cart.png" alt="购物车" /><span>购物车</span></a></li>
<li><a href="<%=URL("P_UserCenter", "")%>"><img src="http://192.168.1.188/Theme/system/wap/images/user.png" alt="会员中心" /><span>会员中心</span></a></li>
</ul>
</div>

</div>


  
</body>
</html>