﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.P_UserChangePassword" validateRequest="false"%>


<%@ Import Namespace="Shop.Bussiness" %>
<%@ Import Namespace="Shop.Model" %>
<%@ Import Namespace="System.Collections.Generic" %>
<% LoadPage("ljq@lebi.cn_43",15,"CN","P_UserChangePassword"); %>

<!DOCTYPE html PUBliC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><%=ThemePageMeta("P_UserChangePassword","title")%></title>
<meta name="keywords" content="<%=ThemePageMeta("P_UserChangePassword","keywords")%>" />
<meta name="description" content="<%=ThemePageMeta("P_UserChangePassword","description")%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="utf-8" />
<meta name="format-detection" content="telephone=no" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="twcClient" content="false" id="twcClient" />
<meta name="revisit-after" content="1 days" />
<meta name="CurrenctCurrency" content="<%=CurrentCurrency.Code %>" />
<meta name="CurrenctCurrencyMsige" content="<%=CurrentCurrency.Msige %>" />
<meta name="CurrentExchangeRate" content="<%=CurrentCurrency.ExchangeRate %>" />
<meta name="CurrenctCurrencyLength" content="<%=CurrentCurrency.DecimalLength %>" />
<meta name="CurrentLanguage" content="<%=CurrentLanguage.Code %>" />
<meta name="generator" content="LebiShop V<%=SYS.Version+"."+SYS.Version_Son %>" />
<meta name="copyright" content="2003-<%=DateTime.Now.Year %> lebi.cn" />
<script src="/Theme/system/wap/js/jquery-3.1.0.min.js" type="text/javascript"></script>
<script src="/Theme/system/wap/js/jquery-ias.min.js"></script>
<%if (CurrentLanguage.IsLazyLoad==1){ %><script src="/Theme/system/wap/js/jquery.lazyload.min.js" type="text/javascript"></script><%} %>
<script src="/Theme/system/wap/js/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<%if (CurrentLanguage.Code=="CN"){%><script type="text/javascript" src="/Theme/system/wap/js/jquery-ui/datepicker-zh-CN.js"></script><%}%>
<script src="<%=WebPath %>/ajax/js.aspx" type="text/javascript"></script>
<script src="/Theme/system/wap/js/main.js" type="text/javascript"></script>
<script src="/Theme/system/wap/js/messagebox.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="/Theme/system/wap/css/system.css" />
<link rel="stylesheet" type="text/css" href="/Theme/system/wap/js/jquery-ui/jquery-ui.min.css" />
<link rel="stylesheet" type="text/css" href="/Theme/system/wap/js/jquery-ui/jquery-ui.theme.min.css" />
<link rel="stylesheet" type="text/css" href="/theme/wap/css/css.css" />
<link rel="stylesheet" type="text/css" href="/theme/wap/css/<%=CurrentLanguage.Code %>.css" />

</head>
<body class="default">
    
<div class="mhead clearfix">
	<a href="javascript:history.go(-1);" class="a-back"><span>返回</span></a>
	<h2 id="pagename"><%=ThemePageMeta("P_UserChangePassword","title")%></h2>
	<a href="<%=URL("P_AllProductCategories","")%>" class="a-cate"><span>商品分类</span></a>
</div>
<script>
    var pagetitle = $("#pagename").html();
    if (pagetitle.indexOf(" - ") > -1) {
        $("#pagename").html(pagetitle.split(' - ')[0]);
    }
</script>

    <div class="body">
        <div class="bodymain">
          
    

<div class="nbbox clearfix">
<div class="userbox">
    <div class="mt clearfix">
        <h2>登录密码</h2>
    </div>
    <div class="mc clearfix">
    <div class="dl-table clearfix">
    <dl>
        <dt>原始密码：</dt>
        <dd><input name="Password" id="Password" size="30" type="password" pass="true" min="notnull" class="input" /></dd>
    </dl>
    <dl>
        <dt>新密码：</dt>
        <dd><input name="Password1" id="Password1" size="30" type="password" pass="true" min="notnull" class="input" /></dd>
    </dl>
    <dl>
        <dt>确认密码：</dt>
        <dd><input name="Password2" id="Password2" size="30" type="password" pass="true" min="notnull" class="input" /></dd>
    </dl>
    <dl class="dl-btn">
        <dt></dt>
        <dd><a href="javascript:void(0)" onclick="setpassword();" class="btn btn-11"><s></s>提交</a></dd>
    </dl>
    </div>
    </div>
</div>
</div>
<div class="nbbox clearfix">
<div class="userbox">
    <div class="mt clearfix">
        <h2>支付密码</h2>
    </div>
    <div class="mc clearfix">
    <div class="dl-table clearfix">
    <%if (CurrentUser.Pay_Password != ""){ %>
    <dl>
        <dt>原始密码：</dt>
        <dd><input name="Pay_Password" id="Pay_Password" size="30" type="password" paypass="true" min="notnull" class="input" /> <a href="<%=URL("P_UserQuestion","1")%>">忘记密码</a></dd>
    </dl>
    <%} %>
    <dl>
        <dt>新密码：</dt>
        <dd><input name="Pay_Password1" id="Pay_Password1" size="30" type="password" paypass="true" min="notnull" class="input" /></dd>
    </dl>
    <dl>
        <dt>确认密码：</dt>
        <dd><input name="Pay_Password2" id="Pay_Password2" size="30" type="password" paypass="true" min="notnull" class="input" /></dd>
    </dl>
    <%
    Lebi_User_Answer user_answer = B_Lebi_User_Answer.GetModel("User_id ="+ CurrentUser.id);
    if (user_answer==null){
    %>
    <dl class="dl-btn">
        <dt></dt>
        <dd><a href="<%=URL("P_UserQuestion","")%>" class="click">请先设置安全问题</a></dd>
    </dl>
    <%}else{ %>
    <dl class="dl-btn">
        <dt></dt>
        <dd><a href="javascript:void(0)" onclick="setpaypassword();" class="btn btn-11"><s></s>提交</a></dd>
    </dl>
    <%} %>
    </div>
    </div>
</div>
</div>
<script type="text/javascript">
    function setpassword() {
        var Password = $("#Password").val();
        var Password1 = $("#Password1").val();
        var Password2 = $("#Password2").val();
        if (Password == "") {
            CheckNO("Password", "请输入原始密码");
            return false;
        }
        if (Password1 == "") {
            CheckNO("Password1", "请输入新密码");
            return false;
        }
        if (!CheckForm("pass", "span"))
            return false;
        if (Password1 != Password2) {
            CheckNO("Password1", "两次输入的密码不一致");
            return false;
        }
        var postData = { "Password": Password, "Password1": Password1, "Password2": Password2 };
        var url = path+"/ajax/Ajax_userin.aspx?__Action=SetPassword";
        RequestAjax(url, postData, function () { MsgBox(1, "操作成功", "?") });
    }
    function setpaypassword() {
        var Pay_Password = $("#Pay_Password").val();
        var Pay_Password1 = $("#Pay_Password1").val();
        var Pay_Password2 = $("#Pay_Password2").val();
        <%if(CurrentUser.Pay_Password!=""){ %>
        if (Pay_Password == "") {
            CheckNO("Pay_Password", "请输入原始密码");
            return false;
        }
        <%} %>
        if (Pay_Password1 == "") {
            CheckNO("Password1", "请输入新密码");
            return false;
        }
        if (!CheckForm("paypass", "span"))
            return false;
        if (Pay_Password1 != Pay_Password2) {
            CheckNO("Pay_Password1", "两次输入的密码不一致");
            return false;
        }
        var postData = { "Pay_Password": Pay_Password, "Pay_Password1": Pay_Password1, "Pay_Password2": Pay_Password2 };
        var url = path+"/ajax/Ajax_userin.aspx?__Action=SetPayPassword";
        RequestAjax(url, postData, function () { MsgBox(1, "操作成功", "?") });
    }
</script>


        </div>
    </div>
  
<%
if(!IsAPP()){
%>
<div id="footnav">
<ul>
<li><a href="<%=URL("P_Index", "")%>"><img src="/Theme/system/wap/images/home.png" alt="首页" /><span>首页</span></a></li>
<li><a href="<%=URL("P_AllProductCategories", "")%>"><img src="/Theme/system/wap/images/category.png" alt="商品分类" /><span>商品分类</span></a></li>
<li><a href="<%=URL("P_Basket", "")%>"><img src="/Theme/system/wap/images/cart.png" alt="购物车" /><span>购物车</span></a></li>
<li><a href="<%=URL("P_UserCenter", "")%>"><img src="/Theme/system/wap/images/user.png" alt="会员中心" /><span>会员中心</span></a></li>
</ul>
</div>
<%}%>

  
</body>
</html><div style="width:100%;text-align:center;font-size:12px;color:#999">Powered by <a style="font-size:12px;color:#00497f" href="http://www.lebi.cn/support/license/?url=" target="_blank" title="LebiShop多语言网店系统">LebiShop</a> V<%=SYS.Version%>.<%=SYS.Version_Son%></div>