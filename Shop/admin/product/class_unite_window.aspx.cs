﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Shop.Bussiness;
using Shop.Model;
using Shop.Tools;

namespace Shop.Admin.product
{
    public partial class Class_Unite_window : AdminPageBase
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!EX_Admin.Power("pro_type_unite", "合并商品分类"))
            {
                WindowNoPower();
            }
        }
    }
}