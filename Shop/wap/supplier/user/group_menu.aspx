﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.Supplier.user.group_menu" validateRequest="false"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta content="text/html; charset=UTF-8" http-equiv="content-type" />
<meta name="author" content="LebiShop" />

    <title><%=Tag("编辑菜单")%>-<%=Tag("分组菜单")%>-<%=site.title%></title>

<link rel="stylesheet" type="text/css" href="<%=site.AdminCssPath %>/css.css" />
<script type="text/javascript" src="<%=site.AdminJsPath %>/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=site.AdminJsPath %>/ajaxfileupload.js"></script>
<script type="text/javascript" src="<%=site.AdminJsPath %>/main.js"></script>
<script type="text/javascript" src="<%=site.AdminJsPath %>/messagebox.js"></script>
<script type="text/javascript" src="<%=site.AdminJsPath %>/Cookies.js"></script>
<script type="text/javascript" src="<%=site.AdminJsPath %>/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=site.WebPath %>/Editor/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="<%=site.WebPath %>/Editor/ckfinder/ckfinder.js"></script>
<script type="text/javascript" src="<%=site.AdminJsPath %>/master.js"></script>
<link rel="stylesheet" type="text/css" href="<%=site.AdminJsPath %>/jqueryuicss/redmond/jquery-ui.css" />
<script type="text/javascript" src="<%=site.AdminJsPath %>/multiselect/js/jquery.multiselect2side.js"></script>
<link rel="stylesheet" href="<%=site.AdminJsPath %>/multiselect/css/jquery.multiselect2side.css" type="text/css" media="screen" />
<script type="text/javascript">
    var AdminPath = "<%=site.AdminPath %>";var WebPath ="<%=site.WebPath %>";var AdminImagePath = "<%=site.AdminImagePath %>";var requestPage = "<%=Shop.Tools.RequestTool.GetRequestUrl().ToLower() %>";var refPage = "<%=Shop.Tools.RequestTool.GetUrlReferrer().ToLower() %>";
    function quit() { if (confirm("<%=Tag("您确定要退出吗？")%>")) return true; else return false; }
    </script>
</head>
<body>
<div id="body_head">
    <div id="logo">
      <span><a href="<%=site.AdminPath %>/ajax/ajax_supplier.aspx?__Action=MenuJump&pid=0"><%=Lang(CurrentSupplier.Name)%></a></span>
    </div>
    <div id="service">
        <div class="layout">
          <span><em><%=Tag("您好！")%></em>[<%=CurrentSupplier.SubName%>|<%=CurrentSupplierUserGroup.Name%>]<%=CurrentSupplierUser.RemarkName%>&nbsp;&nbsp;<a href="<%=site.AdminPath %>/config/password.aspx"><%=Tag("改密")%></a>&nbsp;|&nbsp;<a href="<%=site.AdminPath %>/Logout.aspx" onclick="return quit()"><%=Tag("注销")%></a>&nbsp;|&nbsp;<a href="<%=Shop.Bussiness.ThemeUrl.GetURL("P_ShopIndex",CurrentSupplier.id.ToString(),"",CurrentLanguage.Code) %>" target="_blank"><%=Tag("网站前台")%></a></span>
        </div>
    </div>
    <div class="clearfix">
    </div>
    <div class="navmenu">
        <ul class="menu">
            <%foreach (Shop.Model.Lebi_Supplier_Menu menu in TopMenus)
                { %>
            <li class="<%=CurrentTopMenu.id==menu.id?"current":"" %>"><a href="<%=site.AdminPath %>/Ajax/ajax_supplier.aspx?__Action=MenuJump&pid=<%=menu.id %>"><span><%if (menu.Image != ""){ %><img src="<%=GetImage(site.WebPath + menu.Image) %>" height="15px" /><%} %><%=Tag(menu.Name)%></span></a> </li>
            <%} %>
        </ul>
        <%=lbmenu%>
    </div>
</div>
<div id="body_content">
<div id="sidebar">
    <div class="menubar ">
        <%if (desk == 1)
            { 
        %>
        <h2><span><img src="<%=site.AdminImagePath %>/minus.gif" id="img1" /> <%=Tag("快捷菜单")%></span></h2>
        <ul class="clear">
            <%foreach (Shop.Model.Lebi_Supplier_Menu menu in GetIndexMenus()){ %><li><a href="<%=MenuUrl(menu.URL,1) %>"><span><%=Tag(menu.Name)%></span></a></li><%}%>
        </ul>
        <% }else{ %>
        <%foreach (Shop.Model.Lebi_Supplier_Menu pmenu in GetMenus(CurrentTopMenu.id)){ %>
        <h2><span><img mid="<%=pmenu.id %>" src="<%=site.AdminImagePath %>/<%=MenuShow(pmenu.id)==true?"minus":"plus" %>.gif" id="imgStatis" /> <%=Tag(pmenu.Name)%></span></h2>
        <ul class="clear" <%=MenuShow(pmenu.id)==true?"":"style=\"display:none;\"" %>>
            <%foreach (Shop.Model.Lebi_Supplier_Menu menu in GetMenus(pmenu.id)){ %><li><a href="<%=MenuUrl(menu.URL,0) %>"><span><%=Tag(menu.Name)%></span></a></li><%}%>
        </ul>
        <%} } %>
    </div>
</div>
<div id="sideplus">
    <a onclick="switchSysBar()"><span class="navPoint" id="switchPoint" title="<%=Tag("关闭/打开左栏")%>"><img src="<%=site.AdminImagePath%>/vertical/left.png" alt="<%=Tag("关闭/打开左栏")%>" /></span></a>
</div>
<div id="sidecontent" class="clear">
    <div class="mainbody_path" id="body_path">
      
    <div class="tools">
        <ul>
            
            <li class="selectAll"><a href="javascript:void(0);" onclick="$('input[name=\'id\']').attr('checked',!$(this).attr('checked'));$(this).attr('checked',!$(this).attr('checked'));"><b></b><span><%=Tag("全选")%></span></a></li>
            <li class="submit"><a href="javascript:void(0);" onclick="SaveMenu();"><b></b><span><%=Tag("保存")%></span></a></li>
            <li class="rotate"><a href="javascript:void(0);" onclick="javascript:history.back();"><b></b><span><%=Tag("返回")%></span></a></li>
            <li class="name"><span id="navIgation"><%=Tag("当前位置")%>：<a href="<%=site.AdminPath %>/Ajax/ajax_admin.aspx?__Action=MenuJump&pid=0"><%=Tag("管理首页")%></a> > <a href="Group.aspx"><%=Tag("商家分组")%></a> > <%=Lang(group.Name) %> > <%=Tag("编辑菜单")%>
            </span></li>
        </ul>
    </div>

    </div>
      
      
    <div class="mainbody" id="body_main">
        <div id="body_main_form" style="min-width:1200px;width:100%">
          
    <%foreach (Shop.Model.Lebi_Supplier_Menu p in models)
      { %>

    <div class="proBox clear">
        <ul class="btns clear">
            <li class="menu"><input type="checkbox" name="id" id="p2_<%=p.id %>" value="<%=p.id %>" power="true" <%=Check(p.id)?"checked":"" %> onclick ="selectall(this,<%=p.id %>);"/>
            <a href="javascript:void(0);" onclick="Edit(0,<%=p.id %>);"><%if (p.Image != ""){%><img height="16" src="<%=site.WebPath + p.Image%>" /> <%} %><%=Tag(p.Name)%></a></li>
            <li class="add" onclick="Edit(<%=p.id %>,0);">
                <%=Tag("添加")%></li>
        </ul>
        <div class="iTabHead">
            <table cellpadding="0" cellspacing="0" width="100%" border="0" class="datalist">
                <%foreach (Shop.Model.Lebi_Supplier_Menu p2 in GetMenu(p.id))
                  {
                %>
                <tr class="list">
                    <td style="width:150px;">
                        <input type="checkbox" name="id" p2_<%=p.id %>="true" value="<%=p2.id %>"  power="true" <%=Check(p2.id)?"checked":"" %> id="p3_<%=p2.id %>" onclick ="selectall(this,<%=p2.id %>);" />
                        <a href="javascript:Edit(<%=p.id %>,<%=p2.id %>)">
                            <%=Tag(p2.Name)%></a>

                        <a class="add" href="javascript:void(0);" onclick="Edit(<%=p2.id %>,0);">
                            <%=Tag("添加")%></a>
                    </td>
                    <td align="left">
                        <% 
                            foreach (Shop.Model.Lebi_Supplier_Menu p3 in GetMenu(p2.id))
                        {
                        %>
                        <div class="limit">
                            <input type="checkbox" name="id" value="<%=p3.id %>" power="true" p2_<%=p.id %>="true" p3_<%=p2.id %>="true" <%=Check(p3.id)?"checked":"" %> />
                            <a href="javascript:Edit(<%=p2.id %>,<%=p3.id %>)">
                                <%=Tag(p3.Name)%></a>
                        </div>
                        <%} %>
                    </td>
                </tr>
                <%}%>
            </table>
        </div>
    </div>
<%} %>
    <script type="text/javascript">
        function Edit(pid,id) {
            var title_ = "<%=Tag("编辑菜单")%>";
            var url_ = "menu_edit_window.aspx?id=" + id+"&pid="+pid;
            var width_ = 600;
            var height_ = 380;
            var modal_ = true;
            EditWindow(title_, url_, width_, height_, modal_);
        }
        function SaveMenu() {
            var postData = GetFormJsonData("power");
            var url = AdminPath+"/ajax/ajax_supplier.aspx?__Action=SaveMenu&gid=<%=group.id %>";
            RequestAjax(url,postData,function(){MsgBox(1, "<%=Tag("操作成功")%>", "#")});
        }
        function selectall(obj,id){
            var flag=$(obj).is(":checked");
            $("input[" + $(obj).attr('id')+"='true']").each(function () {
                if(flag)
                    $(this).attr("checked", true);
                else
                    $(this).attr("checked", false);
                
            });
        }

    </script>

        </div>
    </div>
    
</div>
</div>
<div id="body_foot">
    <div class="foot">
      <div class="copy" id="lebicopy">
            <asp:Label ID="LBLicense" runat="server"></asp:Label>
        </div>
        <div class="lang">
            <ul class="droplang">
                <li class="lang_li"><a class="noclick">
                    <%int langi = 0;
                      if (CurrentLanguage.Name == "")
                        {%><%=Tag("语言选择")%><%}else{%><%=CurrentLanguage.Name%><%} %></a>
                    <dl class="lang_li_content">
                        <%foreach (Shop.Model.Lebi_Language_Code langc in langs)
                          {
                              langi++; if (langi== langs.Count)
                              {%>
                        <dd class="last"><%}
                              else
                              {%><dd><%} %>
                        <a href="javascript:SetLanguage('<%=langc.Code %>','<%=langc.Name %>');"><%=langc.Name %></a></dd>
                              <%} %>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
</div>
<script type="text/javascript">
    function Copyright() {
        var title_ = "<%=Tag("关于")%>";
        var url_ = "<%=site.AdminPath %>/Config/Copyright_window.aspx";
        var width_ = 500;
        var height_ = 310;
        var modal_ = true;
        EditWindow(title_, url_, width_, height_, modal_);
    }
</script>
</body>
</html>