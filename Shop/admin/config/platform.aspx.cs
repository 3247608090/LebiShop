﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Shop.Bussiness;
using Shop.Model;

namespace Shop.Admin.Config
{
    public partial class platform : AdminPageBase
    {
        protected BaseConfig model;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!EX_Admin.Power("platformconfig_edit", "第三方平台设置"))
            {
                PageNoPower();
            }
            B_BaseConfig bconfig=new B_BaseConfig();
            //model = bconfig.LoadConfig();
            model = ShopCache.GetBaseConfig();

        }

        public string isselect(string c)
        {
            if (SYS.platform_login.Contains(c))
                return "checked";
            return "";
        }
    }
}