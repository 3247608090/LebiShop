﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Shop.supplier.order.shipping_log_window" validateRequest="false"%>

<table cellspacing="0" border="0" style="width: 100%; border-collapse: collapse;"
    class="datalist">
    <%if (log.message == "ok")
      { %>
    <tr class="title">
        <th style="width: 150px">
            <%=Tag("状态")%>：
        </th>
        <th>
             <%=Shop.Bussiness.EX_Type.TypeName(torder.Type_id_TransportOrderStatus)%>
        </th>
    </tr>
   <%foreach (Shop.Model.KuaiDi100.KuaiDi100data d in log.data)
     { %>
    <tr class="list">
        <td><%=d.time%></td>
        <td><%=d.context%></td>
    </tr>
    <%} %>  
    <%}
      else
      { %>
      <tr class="title">
        <th>
            <%=Tag("状态")%>：
        </th>
      </tr>
      <tr class="list"><td>
      <iframe name="kuaidi100" src="<%=torder.HtmlLog %>" width="650" height="400" marginwidth="0" marginheight="0" frameborder="0"></iframe>
      </td></tr>
    <%} %>
</table>

  