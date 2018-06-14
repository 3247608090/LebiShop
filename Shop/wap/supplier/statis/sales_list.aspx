﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Supplier.Statis.Statis_Sales_List" validateRequest="false"%>

<html>
<head>
<title><%=Tag("销售报表")%>-<%=site.title%></title>
<META name="author" content="56770 Eshop">
<link rel="stylesheet" type="text/css" href="<%=site.AdminCssPath %>/css.css">
<script type="text/javascript" language="javascript" src="<%=site.AdminJsPath %>/jquery-1.7.2.min.js"></script>
<script type="text/javascript" language="javascript" src="<%=site.AdminJsPath %>/messagebox.js"></script>
<script type="text/javascript" language="javascript" src="<%=site.AdminJsPath %>/jquery-ui-1.8.19.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=site.AdminJsPath %>/jqueryuicss/redmond/jquery-ui-1.8.19.custom.css" />
<style>body{background:#fff;margin:0;padding:0;font-size:12px;text-align:left}input{font-size:12px}.order-print table{width:100%; margin-bottom:10px}
.order-print h2{margin:0 0 10px 0; padding:10px 0; border-bottom:1px dotted #000; font-weight:bold; font-size:15px; text-align:Center}
.order-print .headmenu{padding-left:5px; height:27px;color:#666;font-size:13px;font-weight:bold}
.order-print th{padding-left:5px; line-height:25px; font-weight:normal; text-align:left; border-bottom:1px dotted #000}
.order-print td{padding-left:5px; line-height:25px; text-align:left; background:#fff}
.order-print TR.list {background-color:expression((this.rowIndex%2==0)?"#FFFFFF":"#FFFFFF")}
.order-print TD.list {padding-left:3px; ; border-bottom:1px dotted #000; line-height:25px}
.order-print TD.list .pro-pic {width: 45px; height: 45px}
.order-print TD.list .pro-pic IMG {width: expression(this.width > 45 ? 45 : true); height: expression(this.height > 45 ? 45 : true); max-width: 45px; max-height: 45px; vertical-align: middle; text-align: center}</style>
<style media=print>.print-btn{display:none;}</style>
</head>
<body>
<div class="print-btn">
    <div class="tools">
        <ul>
            <li class="print"><a href="javascript:void(0);" onclick="window.print();"><b></b><span><%=Tag("打印")%></span></a></li>
            <li class="close"><a href="javascript:void(0);" onclick="window.close();"><b></b><span><%=Tag("关闭")%></span></a></li>
        </ul>
    </div>
</div>
<div class="order-print">
<h2><%=dateFrom%> - <%=dateTo%></h2>
<table cellspacing="0" cellpadding="0" width="100%" align="center">
<tr>
<th style="width:5%"><%=Tag("序号")%></th>
<th style="width:10%"><%=Tag("商品编号")%></th>
<th style="width:10%"><%=Tag("商品货号")%></th>
<th><%=Tag("商品名称")%></th>
<th style="width:10%"><%=Tag("规格")%></th>
<th style="width:10%"><%=Tag("数量")%></th>
<th style="width:10%"><%=Tag("单价")%></th>
<th style="width:10%"><%=Tag("成本")%></th>
<th style="width:10%"><%=Tag("利润")%></th>
</tr>
<%int i = 0; int totalqty = 0; decimal totalprice = 0; decimal totalprice_cost = 0; decimal totalprofit = 0; foreach (Shop.Model.Lebi_Order_Product pro in pros)
  { %>
<tr class="list">
<td class="list" title="<%=pro.Time_Add%>"><%=i + 1%></td>
<td class="list"><%=pro.Product_Number%>&nbsp;</td>
<td><%=Shop.Bussiness.EX_Product.GetProduct(pro.Product_id).Code%>&nbsp;</td>
<td class="list"><%=Shop.Bussiness.Language.Content(pro.Product_Name, CurrentLanguage)%></td>
<td class="list"><%=Shop.Bussiness.EX_Product.ProPertyNameStr(Shop.Bussiness.EX_Product.GetProduct(pro.Product_id).ProPerty131, CurrentLanguage)%>&nbsp;</td>
<td class="list"><%=pro.Count%></td>
<td class="list"><%=FormatMoney(pro.Price)%></td>
<td class="list"><%=FormatMoney(pro.Price_Cost)%></td>
<td class="list"><%=FormatMoney(pro.Price - pro.Price_Cost)%></td>
</tr>
<%i += 1; totalqty += pro.Count; totalprice += pro.Price * pro.Count; totalprice_cost += pro.Price_Cost * pro.Count; totalprofit += (pro.Price - pro.Price_Cost) * pro.Count;
  } %>
<tr>
<td colspan="5"><strong><%=Tag("合计")%></strong></td>
<td><strong><%=totalqty%></strong></td>
<td><strong><%=FormatMoney(totalprice)%></strong></td>
<td><strong><%=FormatMoney(totalprice_cost)%></strong></td>
<td><strong><%=FormatMoney(totalprofit)%></strong></td>
</tr>
</table>
</div>
</body>
</html>

  